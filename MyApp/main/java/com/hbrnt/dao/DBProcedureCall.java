package com.hbrnt.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.hbrnt.pojo.Student;
import com.hbrnt.utl.HibernateUtils;

public class DBProcedureCall {
	
	SessionFactory sf;
	final static Logger logger = Logger.getLogger(StudentDao.class);
	
	public DBProcedureCall() {
		sf = HibernateUtils.getSessionFactory();
	}
	
	public Student findFirstClassStudent()
	{
		Query query = sf.openSession().createSQLQuery(
				"CALL ClassFirstStudent(:stockCode)")
				.addEntity(Student.class)
				.setParameter("stockCode", "7277");
						
		List<Student> result = query.list();
		
		Student student = null;
		for(int i=0; i<result.size(); i++){
			student = (Student) result.get(i);
			System.out.println(student);
		}
		
		return student;
	}
}
