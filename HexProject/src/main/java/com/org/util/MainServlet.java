package com.org.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.bean.Item;
import com.org.bean.User;
import com.org.dao.AppGenericDao;
import com.org.dao.LoginDao;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/loginServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
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
		String userName, password, userType;
		userName = request.getParameter("AdminId");
		password = request.getParameter("Password");
		userType = request.getParameter("user_type");

		User user = new User();
		user.setUserName(userName);
		user.setUserPassword(password);
		user.setRoleName(userType);

		LoginDao validate = new LoginDao();

		User isValid = validate.validateLogin(user);

		if (isValid != null) {
			if (userType.equals("dba")) {
				// response.getWriter().append("DBA Logged In");
				request.getRequestDispatcher("/userServlet").forward(request, response);
			} else {
				String role = isValid.getRoleName();
				if (role.equalsIgnoreCase("Admin")) {
					request.setAttribute("getStockList", "listAdmin");
					request.getRequestDispatcher("/stockServlet").forward(request, response);
				} else {
					AppGenericDao appDao = new AppGenericDao();
					List<Item> stockItems = appDao.getRows();
					request.setAttribute("stockList", stockItems);
					request.getRequestDispatcher("user.jsp").forward(request, response);
				}
			}

		} else {
			request.setAttribute("loginError", "User or Password invalid. Please try again...");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
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
