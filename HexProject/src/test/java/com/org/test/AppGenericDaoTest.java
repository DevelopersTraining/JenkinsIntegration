
package com.org.test;

import org.junit.Before;
import org.junit.Test;

import com.org.dao.AppGenericDao;

public class AppGenericDaoTest {
	AppGenericDao daoTest;
	
	@Before
	public void initializeTest(){
		daoTest = new AppGenericDao();	
	}

	@Test
	public void getRowTest(){
		
		daoTest.getRows();		
	}
	
	@Test
	public void getUser(){
		
		daoTest.selectUser("edson","edson");
		
	}
}
