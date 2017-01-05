package com.org.test;

import java.sql.Date;
import java.util.Calendar;

import org.junit.Before;
import org.junit.Test;

import com.org.bean.User;
import com.org.dao.UserDao;

public class UserDaoTest {

	UserDao userDaoTest;

	@Before
	public void setUpClass() {
		userDaoTest = new UserDao();
	}

	@Test
	public void addUser() {
		User user = new User();
		user.setUserName("Bata");
		user.setUserPassword("ghi");
		user.setRoleId(2l);
		Date today = new Date(Calendar.getInstance().getTime().getTime());
		user.setRegDate(today);
		userDaoTest.addUser(user);
	}

	@Test
	public void deleteUser() {
		User user = new User();
		user.setUserId(19l);
		userDaoTest.deleteUser(user);
	}

}
