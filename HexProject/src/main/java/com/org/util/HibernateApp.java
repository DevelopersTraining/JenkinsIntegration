package com.org.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.org.pojo.Stock;

public class HibernateApp {
	
	public static void main(String[] args) {
		// creating configuration object
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		// creating session object
		Session session = factory.openSession();
		// creating transaction object
		Transaction t = session.beginTransaction();
		Stock s=new Stock();
		s.setName("Apple");
		s.setDescription("Fruit");
		s.setQuantity(10);
		session.persist(s);// persisting the object
		t.commit();// transaction is committed
		session.close();
		System.out.println("successfully saved");
	}

}
