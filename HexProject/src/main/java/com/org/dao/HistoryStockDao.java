package com.org.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.org.bean.Item;
import com.org.pojo.HistoryStock;
import com.org.pojo.Stock;
import com.org.util.HibernateUtil;

public class HistoryStockDao implements HistoryStockDaoInterface {

	public List<Item> generateReport(int type, String startDate, String endDate) {

		List<HistoryStock> report = new ArrayList<HistoryStock>();
		List<Item> generatedReport = new ArrayList<Item>();
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			// DateFormat format = new SimpleDateFormat("MM-DD-YYYY");

			Date start = new Date(startDate);

			Date end = new Date(endDate);

			// String startDateFormated = format.format(start);
			// String endDateFormated = format.format(end);

			System.out.println(start + " " + end);

			report = session.createCriteria(HistoryStock.class).add(Restrictions.eq("flag", type))
					.add(Restrictions.ge("creationDate", start)).add(Restrictions.le("creationDate", end))
					.addOrder(Order.asc("creationDate")).list();

			for (HistoryStock item : report) {
				System.out.println(item.toString());
				generatedReport.add(new Item(item.getItemId(), item.getName(), item.getDescription(),
						item.getQuantity(), item.getCreationDate(), item.getVendor()));
			}

			session.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Error" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return generatedReport;
	}
	
	public List<Object[]> generateChart(String item_id, int type, String startDate, String endDate) {

//		List<Object> report = new ArrayList<Object>();
		List<Object[]> generatedReport = new ArrayList<Object[]>();
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			// DateFormat format = new SimpleDateFormat("MM-DD-YYYY");

			Date start = new Date(startDate);

			Date end = new Date(endDate);

			// String startDateFormated = format.format(start);
			// String endDateFormated = format.format(end);

			System.out.println(start + " " + end);

			String hql = "Select AVG(quantity), TRUNC(creationDate, 'DD') From HistoryStock WHERE itemId = :item AND flag = :flag AND creationDate BETWEEN :from AND :to GROUP BY TRUNC(creationDate, 'DD') ORDER BY TRUNC(creationDate, 'DD') ASC";
			Query query = session.createQuery(hql);
			query.setParameter("item", Long.parseLong(item_id));
			query.setParameter("flag", type);
			query.setParameter("from", start);
			query.setParameter("to", end);
			generatedReport = query.list();

			
//			for (Object[] result : report) {
//				Object his =  result[0];
//				System.out.println(his);
////				generatedReport.add(new Item(item.getItemId(), item.getName(), item.getDescription(),
////						item.getQuantity(), item.getCreationDate(), item.getVendor()));
//			}

			session.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Error" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return generatedReport;
	}

}
