package com.org.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.org.bean.User;
import com.org.pojo.AppUser;
import com.org.pojo.DbaUser;
import com.org.util.HibernateUtil;

public class LoginDao implements LoginDaoInterface {

	/* (non-Javadoc)
	 * @see com.org.dao.LoginDaoInterface#validateLogin(com.org.bean.User)
	 */
	public User validateLogin(User user) {
		User validUser = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session s = sf.openSession();

		// String password = (String) s
		// .createSQLQuery("SELECT PASSWORD FROM DBA_USER WHERE DBA_NAME=" +
		// user.getUserName()).uniqueResult();
		String password = null;
		String roleName = null;

		if (user.getRoleName().equals("dba")) {
			Criteria criteria = s.createCriteria(DbaUser.class);
			criteria.add(Restrictions.eq("dba_name", user.getUserName()));
			List<DbaUser> results = criteria.list();
			if(results.isEmpty())
			{
				return null;
			}
				DbaUser dbaUser = results.get(0);
			password = dbaUser.getPassword();
			roleName = user.getRoleName();
			
		} else {
			Criteria criteria = s.createCriteria(AppUser.class);
			criteria.add(Restrictions.eq("userName", user.getUserName()));
			List<AppUser> results = criteria.list();
			if(results.isEmpty())
			{
				return null;
			}
			AppUser appUser = results.get(0);
			roleName = appUser.getRole().getRoleName();
			password = appUser.getPassword();
			
		}

		if (password.equals(user.getUserPassword())) {
			validUser = new User();
			validUser.setRoleName(roleName);

		}

		s.close();
		return validUser;
	}

}
