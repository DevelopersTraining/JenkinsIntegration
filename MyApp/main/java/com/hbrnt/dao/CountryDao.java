package com.hbrnt.dao;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.hbrnt.pojo.cache.Country;
import com.hbrnt.utl.HibernateUtils;
//Class CountryDao
public class CountryDao implements ICountryDao {
	
	SessionFactory sf;
	final static Logger logger = Logger.getLogger(StudentDao.class);
	
	public CountryDao() {
		sf = HibernateUtils.getSessionFactory();
	}
	
	public Country findCountry(int id) 
	{
		Session session = sf.openSession();

		Country country = (Country) session.get(Country.class, id);
		
		session.close();

		return country;
	}
}
