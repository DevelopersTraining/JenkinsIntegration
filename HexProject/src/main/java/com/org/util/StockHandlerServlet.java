package com.org.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.bean.Item;
import com.org.dao.AppGenericDao;

/**
 * Servlet implementation class StockHandlerServlet
 */
@WebServlet("/StockHandlerServlet")
public class StockHandlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockHandlerServlet() {
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
		String redirectHandler = request.getParameter("stockHandler");

		if (redirectHandler == null) {
			response.sendRedirect("Login.jsp");
		}

		AppGenericDao appDao = new AppGenericDao();

		if (redirectHandler.equalsIgnoreCase("stockEdit")) {
			String operation = request.getParameter("stockButton");
			String rowId = request.getParameter("itemId");
			if (operation.equalsIgnoreCase("add")) {
				response.sendRedirect("AdminAddStock.jsp");
			} else if (operation.equalsIgnoreCase("update")) {
				// Item itemToUpdate = appDao.getRow(rowId);
				// request.setAttribute("itemData", itemToUpdate);
				// request.getRequestDispatcher("update.jsp").forward(request,
				// response);
			} else if (operation.equalsIgnoreCase("delete")) {
				// Item itemToUpdate = appDao.getRow(rowId);
				// request.setAttribute("itemData", itemToUpdate);
				// request.getRequestDispatcher("delete.jsp").forward(request,
				// response);
			} else {
				response.sendRedirect("index.jsp");
			}
		}

		if (redirectHandler.equalsIgnoreCase("stockAdd")) {
			Item item = new Item();
			item.setName(request.getParameter("item"));
			item.setDescription(request.getParameter("description"));
			item.setQuantity(Long.parseLong(request.getParameter("quantity")));
			appDao.addStock(item);
			request.setAttribute("getStockList", "listAdmin");
			request.getRequestDispatcher("/stockServlet").forward(request, response);
		}
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
