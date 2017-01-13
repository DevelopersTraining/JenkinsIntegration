package com.org.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.bean.Item;
import com.org.dao.AppGenericDao;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/stockServlet")
public class StockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockServlet() {
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

		AppGenericDao appDao = new AppGenericDao();
		List<Item> stockItems = appDao.getRows();
		request.setAttribute("stockList", stockItems);

		String responsePage = "admin.jsp";
		System.out.println("In Stock Servlet");
		System.out.println(request.getParameter("stockRedirect"));

		if (request.getParameter("stockRedirect") != null) {
			responsePage = "user.jsp";
			System.out.println("Redirecting to user page");
		}

		request.getRequestDispatcher(responsePage).forward(request, response);

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
