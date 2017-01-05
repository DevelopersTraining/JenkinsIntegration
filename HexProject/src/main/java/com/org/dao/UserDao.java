package com.org.dao;

import org.hibernate.Session;

import com.org.bean.User;
import com.org.pojo.AppUser;
import com.org.pojo.Role;
import com.org.util.HibernateUtil;

public class UserDao implements UserDaoInterface {

	private Session session = null;

	/* (non-Javadoc)
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
			user.setRegDate(newUser.getRegDate());

			session.persist(user);

			session.getTransaction().commit();

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

	/* (non-Javadoc)
	 * @see com.org.dao.UserDaoInterface#deleteUser(com.org.bean.User)
	 */
	public boolean deleteUser(User deleteUser) {
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			AppUser user = new AppUser();
			user.setUserId(deleteUser.getUserId());

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

}
