package com.org.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.org.pojo.AppUser;
import com.org.pojo.DbaUser;
import com.org.pojo.Role;
import com.org.pojo.Stock;

public class HibernateUtil {
	// session factory
	private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		try {
			Configuration configuration = new Configuration().configure("hibernate.cfg.xml"); // configuration

			configuration.addAnnotatedClass(AppUser.class);
			configuration.addAnnotatedClass(DbaUser.class);
			configuration.addAnnotatedClass(Role.class);
			configuration.addAnnotatedClass(Stock.class);

			StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder();

			serviceRegistryBuilder.applySettings(configuration.getProperties());

			ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();

			return configuration.buildSessionFactory(serviceRegistry);

		} catch (Throwable ex) {

			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void shutdown() {
		// Close caches and connection pools
		getSessionFactory().close();
	}

}