package com.org.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import com.org.bean.Item;
import com.org.pojo.AppUser;
import com.org.pojo.Stock;
import com.org.util.HibernateUtil;
import org.hibernate.Criteria;

public class AppGenericDao {


	public List<Item> getRows(){
		 System.out.println("Starting::getRows");
		 
		 List<Item> items = new ArrayList<Item>();
		 Session session = null;
		 
		 try {
			 	session = HibernateUtil.getSessionFactory().getCurrentSession();
				session.beginTransaction();
				
				String hql = "FROM Stock";
				Query query = session.createQuery(hql);
				List<Stock> results = query.list();
				
				System.out.println("Number of records:"+results.size());  
				
				for (Stock item: results){
					System.out.println(item.toString());
					items.add(new Item(item.getItemId(),item.getName(),item.getDescription(),item.getQuantity()));
				}

				session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Error"+e.getMessage());
			e.printStackTrace();
		}finally{
			if(session!=null)
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
			 
			 for (AppUser user: results){
				 System.out.println(user);
				 System.out.println(user.getRole().getRoleName());
			 }	
		 }catch(Exception e){
			 System.out.println("Error"+e.getMessage());
				e.printStackTrace();
		 }finally{
			if(session!=null)
				session.close();
		}		 
		System.out.println("Finishing::selectUser");
		
		return true;
	}
	
	
	
}
