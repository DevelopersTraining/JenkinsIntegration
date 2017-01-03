package com.hbrnt.dao;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.hbrnt.pojo.inheritance.Circle;
import com.hbrnt.pojo.inheritance.Rectangle;
import com.hbrnt.pojo.inheritance.Shape;
import com.hbrnt.utl.HibernateUtils;

public class ShapeDao implements IShapeDAO {
	SessionFactory sf;
	final static Logger logger = Logger.getLogger(StudentDao.class);
	
	public ShapeDao() {
		sf = HibernateUtils.getSessionFactory();
	}
	
	public void insertCircle(Circle circle) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();
		session.save(circle);
		session.getTransaction().commit();
		sf.openSession().close();
	}

	public void insertRectangle(Rectangle rectangle) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();
		session.save(rectangle);
		session.getTransaction().commit();
		sf.openSession().close();
	}

	public void insertShape(Shape shape) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();
		session.save(shape);
		session.getTransaction().commit();
		sf.openSession().close();
	}
	
	public Shape findShape(Long shapeId) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();

		return (Shape) session.get(Shape.class, shapeId);
	}
	
	public Circle findCircle(Long shapeId) 
	{
		Session session = sf.openSession();
		session.getTransaction().begin();

		return (Circle) session.get(Circle.class, shapeId);
	}

	public Rectangle findRectangle(Long shapeId) {
		Session session = sf.openSession();
		session.getTransaction().begin();

		return (Rectangle) session.get(Rectangle.class, shapeId);
	}
}
