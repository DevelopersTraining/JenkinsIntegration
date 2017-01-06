package com.org.dao;

import java.util.List;

import com.org.bean.Item;

public interface IAppGenericDao {

	public List<Item> getRows();

	public boolean selecUser(String userName, String password);

	public void addStock(Item item);

	public void updateStock(Item item);

	public void deleteStock(Item item);

	public Item getRow(String id);

}
