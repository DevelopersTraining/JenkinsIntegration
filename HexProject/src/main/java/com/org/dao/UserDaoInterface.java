package com.org.dao;

import com.org.bean.User;

public interface UserDaoInterface {

	boolean addUser(User newUser);

	boolean deleteUser(User deleteUser);

}