
package com.org.test;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import com.org.bean.Item;
import com.org.dao.AppGenericDao;
import com.org.pojo.HistoryStock;
import com.org.util.HibernateUtil;

public class AppGenericDaoTest {
	AppGenericDao daoTest;
	Item item;

	@Before
	public void initializeTest() {
		daoTest = new AppGenericDao();
	}

	@Test
	public void getRowTest() {

		daoTest.getRows();
	}

	@Ignore
	@Test
	public void getUser() {

		daoTest.selectUser("edson", "edson");

	}

	@Ignore
	@Test
	public void addItem() {
		System.out.println("Add Test");
		item = new Item();
		item.setName("Something");
		item.setDescription("Something");
		item.setQuantity(5L);

		daoTest.addStock(item);

		System.out.println("Add Stock Successful");
	}
	
	@Test
	public void checkHistoryStock()
	{
		System.out.println("Entering new History Stock");
		item = new Item();
		item.setName("HistoryTest");
		item.setDescription("History test new");
		item.setQuantity(5L);
		item.setVendor("TestApi");
		daoTest.addStock(item);
		
		int type=0;
		HistoryStock report = new HistoryStock();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		report =(HistoryStock) session.createCriteria(HistoryStock.class).add(Restrictions.eq("flag", type)).add(Restrictions.eq("name", item.getName())).uniqueResult();
		System.out.println(report.toString());
		if(report!=null)
		{
			System.out.println("Add History stock Test Passed");
			System.out.println(report.toString());
			item.setItemId(report.getItemId());
		}
		else
		{
			System.out.println("Add Test Failed");
		}
		System.out.println("Add History Stock Successful");
		session.getTransaction().commit();
		session.close();
		item.setQuantity(10L);
		item.setDescription("History Test Update");
		daoTest.updateStock(item);
		type=1;
		//HistoryStock report = new HistoryStock();
		Session session1 = HibernateUtil.getSessionFactory().getCurrentSession();
		session1.beginTransaction();
		report =(HistoryStock) session1.createCriteria(HistoryStock.class).add(Restrictions.eq("flag", type)).add(Restrictions.eq("name", item.getName())).uniqueResult();
		System.out.println(report.toString());

		if(report!=null)
		{
			System.out.println("Update History stock Test Passed");
			System.out.println(report.toString());
			//item.setItemId(report.getItemId());
		}
		else
		{
			System.out.println("Update Test Failed");
		}
		session1.getTransaction().commit();
		session1.close();
		daoTest.deleteStock(item);
		type=2;
		//HistoryStock report = new HistoryStock();
		Session session2 = HibernateUtil.getSessionFactory().getCurrentSession();
		session2.beginTransaction();
		report =(HistoryStock) session2.createCriteria(HistoryStock.class).add(Restrictions.eq("flag", type)).add(Restrictions.eq("name", item.getName())).uniqueResult();
		System.out.println(report.toString());

		if(report!=null)
		{
			System.out.println("Delete History stock Test Passed");
			System.out.println(report.toString());
			//item.setItemId(report.getItemId());
		}
		else
		{
			System.out.println("Delete Test Failed");
		}
		session2.getTransaction().commit();
		session2.close();
		
		//session.beginTransaction();


	}

	@Ignore
	@Test
	public void updateItem() {
		System.out.println("Update test");

		item = new Item();
		item.setItemId(4L);
		item.setQuantity(5L);
		item.setDescription("Updated Apple");
		item.setName("Apple23");
		daoTest.updateStock(item);
		System.out.println("Update Stock Successful");

	}
	
	@Ignore
	@Test
	public void deleteItem()
	{
		item = new Item();
		item.setItemId(6L);
		daoTest.deleteStock(item);
		System.out.println("Delete Stock Successful");
	}

}
