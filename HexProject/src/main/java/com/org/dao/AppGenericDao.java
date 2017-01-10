package com.org.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.org.bean.Item;
import com.org.pojo.AppUser;
import com.org.pojo.HistoryStock;
import com.org.pojo.Stock;
import com.org.util.HibernateUtil;

public class AppGenericDao {

	public List<Item> getRows() {
		System.out.println("Starting::getRows");

		List<Item> items = new ArrayList<Item>();
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
				items.add(new Item(item.getItemId(), item.getName(), item.getDescription(), item.getQuantity(),
						item.getCreationDate(), item.getVendor()));
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
			st.setVendor(item.getVendor());
			st.setCreationDate(new Date(Calendar.getInstance().getTime().getTime()));
			Long itemId= (Long)session.save(st);
			t.commit();
			session.close();
			System.out.println("successfully saved");
			
			Item it=getRow(""+itemId);	
			
			System.out.println("After insert, copying the current Item to History set flag to 0");
			it.setCreationDate(new Date(Calendar.getInstance().getTime().getTime()));
			addHistoryItem(it, 0);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public void addHistoryItem(Item item, int flag) {
		try
		{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction t = session.beginTransaction();

		Stock current = (Stock) session.get(Stock.class, item.getItemId());

		System.out.println("Copying the current Item to History");
		HistoryStock history = new HistoryStock();

		history.setItemId(current.getItemId());
		history.setDescription(current.getDescription());
		history.setName(current.getName());
		history.setQuantity(current.getQuantity());
		history.setVendor(current.getVendor());
		history.setCreationDate(item.getCreationDate());
		history.setFlag(new Integer(flag));

		session.saveOrUpdate(history);
		t.commit();

		session.close();
		System.out.println("After Update");
		}
		catch(Exception e)
		{
			e.printStackTrace();
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
		updated.setVendor(item.getVendor());
		updated.setCreationDate(item.getCreationDate());
		session.merge(updated);
		t.commit();
		session.close();
		System.out.println("After Update, copying the current Item to History set flag to 1");
		item.setCreationDate(new Date(Calendar.getInstance().getTime().getTime()));
		addHistoryItem(item, 1);
		System.out.println("After Update" + current);

	}

	public void deleteStock(Item item) {
		System.out.println("After delete, copying the current Item to History set flag to 2");
		item.setCreationDate(new Date(Calendar.getInstance().getTime().getTime()));
		addHistoryItem(item, 2);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction t=session.beginTransaction();
		
		String deleteQuery = "DELETE Stock WHERE itemId = " + item.getItemId();
		Query query = session.createQuery(deleteQuery);
		int rows = query.executeUpdate();
		t.commit();
		session.close();
		
	}

	public Item getRow(String id) {
		Long itemId = Long.parseLong(id.trim());
		Item item = new Item();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction t = session.beginTransaction();
		Stock current = (Stock) session.get(Stock.class, itemId);
		item.setItemId(current.getItemId());
		item.setName(current.getName());
		item.setDescription(current.getDescription());
		item.setQuantity(current.getQuantity());
		item.setCreationDate(current.getCreationDate());
		item.setVendor(current.getVendor());
		t.commit();
		session.close();
		return item;

	}

}
