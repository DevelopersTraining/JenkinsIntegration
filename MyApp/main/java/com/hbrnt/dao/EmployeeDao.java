package com.hbrnt.dao;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.hbrnt.pojo.inheritance.tblpercls.Employee;
import com.hbrnt.pojo.inheritance.tblpercls.Owner;
import com.hbrnt.pojo.inheritance.tblpercls.Person;
import com.hbrnt.utl.HibernateUtils;

public class EmployeeDao implements IEmployeeDao {

	SessionFactory sf;
	final static Logger logger = Logger.getLogger(StudentDao.class);
	
	public EmployeeDao() 
	{
		sf = HibernateUtils.getSessionFactory();
	}

	public Person findPerson(Long personId) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();

		return (Person) session.get(Person.class, personId);
	}

	public void insertPerson(Person person) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();
		session.save(person);
		session.getTransaction().commit();
		sf.openSession().close();
	}
	
	public Employee findEmployee(Long personId) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();

		return (Employee) session.get(Employee.class, personId);
	}

	public void insertEmployee(Employee employee) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();
		session.save(employee);
		session.getTransaction().commit();
		sf.openSession().close();
	}


	public Owner findOwner(Long personId) {
		Session session = sf.openSession();
		session.getTransaction().begin();

		return (Owner) session.get(Owner.class, personId);
	}


	public void insertOwner(Owner owner) {
		Session session = sf.openSession();
		session.getTransaction().begin();
		session.save(owner);
		session.getTransaction().commit();
		sf.openSession().close();
	}
}
