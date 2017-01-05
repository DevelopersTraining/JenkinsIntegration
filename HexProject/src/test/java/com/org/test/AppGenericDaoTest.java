
package com.org.test;

import org.junit.Before;
import org.junit.Test;

import com.org.bean.Item;
import com.org.dao.AppGenericDao;

public class AppGenericDaoTest {
	AppGenericDao daoTest;
	Item item;

	@Before
	public void initializeTest() {
		daoTest = new AppGenericDao();
	}

	@Test
	public void getRowTest() {

		daoTest.getRows();
	}

	@Test
	public void getUser() {

		daoTest.selectUser("edson", "edson");

	}

	@Test
	public void addItem() {
		System.out.println("Add Test");
		item = new Item();
		item.setName("Something");
		item.setDescription("Something");
		item.setQuantity(5L);

		daoTest.addStock(item);

		System.out.println("Add Stock Successful");
	}

	@Test
	public void updateItem() {
		System.out.println("Update test");

		item = new Item();
		item.setItemId(4L);
		item.setQuantity(5L);
		item.setDescription("Updated Apple");
		item.setName("Apple23");
		daoTest.updateStock(item);
		System.out.println("Update Stock Successful");

	}

	@Test
	public void deleteItem()
	{
		item = new Item();
		item.setItemId(6L);
		daoTest.deleteStock(item);
		System.out.println("Delete Stock Successful");
	}
}
