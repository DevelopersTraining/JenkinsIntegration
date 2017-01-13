package com.org.dao;

import java.util.List;

import com.org.bean.Item;

public interface HistoryStockDaoInterface {

	public List<Item> generateReport(int type, String startDate, String endDate);

}