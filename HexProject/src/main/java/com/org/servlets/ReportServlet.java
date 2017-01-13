package com.org.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.bean.Item;
import com.org.dao.HistoryStockDao;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/reportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String type = (String) request.getParameter("reportType");
		String startDate = (String) request.getParameter("startDate");
		String endDate = (String) request.getParameter("endDate");

		HistoryStockDao history = new HistoryStockDao();

		List<Item> report = new ArrayList<Item>();

		if (type.equalsIgnoreCase("new")) {
			report = history.generateReport(0, startDate, endDate);
			request.setAttribute("stockList", report);
		} else if (type.equalsIgnoreCase("deleted")) {
			report = history.generateReport(2, startDate, endDate);
			request.setAttribute("stockList", report);
		} else if (type.equalsIgnoreCase("updated")) {
			report = history.generateReport(1, startDate, endDate);
			request.setAttribute("stockList", report);
		}
		request.setAttribute("reportType", type);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.getRequestDispatcher("ItemReport.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
