package com.org.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import com.org.bean.User;
import com.org.pojo.AppUser;
import com.org.pojo.DbaUser;
import com.org.pojo.Role;
import com.org.util.HibernateUtil;

@Service
public class UserDao implements UserDaoInterface {

	private Session session = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.org.dao.UserDaoInterface#addUser(com.org.bean.User)
	 */
	public boolean addUser(User newUser) {

		try {

			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			AppUser user = new AppUser();
			Role role = new Role();

			if (newUser.getRoleId() == 1) {
				role.setRoleid(1l);
				role.setRoleName("Admin");
			} else if (newUser.getRoleId() == 2) {
				role.setRoleid(2l);
				role.setRoleName("User");
			}

			user.setRole(role);
			user.setPassword(newUser.getUserPassword());
			user.setUserName(newUser.getUserName());
			user.setRegDate(new Date(Calendar.getInstance().getTime().getTime()));

			session.persist(user);

			session.getTransaction().commit();
			session.close();

		} catch (Exception e) {
			System.out.println("Failed to add new User" + e.getMessage());
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.org.dao.UserDaoInterface#deleteUser(com.org.bean.User)
	 */
	public boolean deleteUser(Long userId) {
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			AppUser user = new AppUser();
			user.setUserId(userId);

			session.delete(user);

			session.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Failed to delete user" + e.getMessage());
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return true;
	}

	public ArrayList<User> getUserList() {
		ArrayList<User> userList = new ArrayList<User>();

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			// Get user from AppUser
			String hql = "FROM AppUser";
			Query query = session.createQuery(hql);
			List<AppUser> results = query.list();

			System.out.println("Number of records:" + results.size());

			for (AppUser us : results) {
				System.out.println(us.toString());
				// (Long userId, Long roleId, String roleName, String userName,
				// String userPassword, Date regDate){
				userList.add(new User(us.getUserId(), us.getRole().getRoleId(), us.getRole().getRoleName(),
						us.getUserName(), us.getPassword(), us.getRegDate()));
			}
			session.getTransaction().commit();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return userList;
	}

	public User getUser(Long userId) {
		User user=new User();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		AppUser current = (AppUser) session.get(AppUser.class, userId);
		user.setUserId(current.getUserId());
		user.setUserName(current.getUserName());
		user.setUserPassword(current.getPassword());
		user.setRoleName(current.getRole().getRoleName());
		session.close();
		return user;
	}

}
