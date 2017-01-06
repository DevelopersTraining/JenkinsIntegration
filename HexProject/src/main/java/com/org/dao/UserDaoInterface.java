package com.org.dao;

import java.util.ArrayList;

import com.org.bean.User;

public interface UserDaoInterface {

	boolean addUser(User newUser);

	boolean deleteUser(User deleteUser);
	
	ArrayList<User> getUserList();

}