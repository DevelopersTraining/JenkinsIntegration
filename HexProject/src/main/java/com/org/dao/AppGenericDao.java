package com.org.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.org.bean.Item;
import com.org.pojo.AppUser;
import com.org.pojo.Stock;

import com.org.util.HibernateUtil;
import org.hibernate.Criteria;

public class AppGenericDao {

	public List<Item> getRows() {
		System.out.println("Starting::getRows");

		List<Item> items = new ArrayList<Item>();
		List<Object> currentStock;
		Session session = null;

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			String hql = "FROM Stock";
			Query query = session.createQuery(hql);
			List<Stock> results = query.list();

			System.out.println("Number of records:" + results.size());

			for (Stock item : results) {
				System.out.println(item.toString());
				items.add(new Item(item.getItemId(), item.getName(), item.getDescription(), item.getQuantity()));
			}

			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Error" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println("Finishing::getRows");

		return items;
	}

	public boolean selectUser(String userName, String password) {
		System.out.println("Starting::selectUser");

		List<Item> items = new ArrayList<Item>();
		List<Object> currentStock;
		Session session = null;

		try {

			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			Criteria c = session.createCriteria(AppUser.class);
			c.add(Restrictions.eq("userName", userName));
			c.add(Restrictions.eq("password", password));

			List<AppUser> results = c.list();

			for (AppUser user : results) {
				System.out.println(user);
				System.out.println(user.getRole().getRoleName());
			}
		} catch (Exception e) {
			System.out.println("Error" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println("Finishing::selectUser");

		return true;
	}

	public void addStock(Item item) {
		System.out.println("Starting:: addStock");

		try {

			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction t = session.beginTransaction();
			Stock st = new Stock();
			st.setName(item.getName());
			st.setDescription(item.getDescription());
			st.setQuantity(item.getQuantity());
			session.persist(st);
			t.commit();
			session.close();
			System.out.println("successfully saved");

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void updateStock(Item item) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction t = session.beginTransaction();
		Stock current = (Stock) session.get(Stock.class, item.getItemId());
		System.out.println("Before Update" + current);
		Stock updated = new Stock();
		updated.setItemId(item.getItemId());
		updated.setDescription(item.getDescription());
		updated.setName(item.getName());
		updated.setQuantity(item.getQuantity());
		session.merge(updated);
		t.commit();
		System.out.println("After Update" + current);

	}

	public void deleteStock(Item item) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		String deleteQuery = "DELETE Stock WHERE itemId = " + item.getItemId();
		Query query = session.createQuery(deleteQuery);
		int rows = query.executeUpdate();
		session.getTransaction().commit();
	}

}
