package com.org.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.bean.User;
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
				// System.out.println("Logged in as DBA");
				request.getRequestDispatcher("/userServlet").forward(request, response);
			} else {
				String role = isValid.getRoleName();
				request.getSession().setAttribute("userName", userName);
				request.getSession().setAttribute("roleName", role);
				if (role.equalsIgnoreCase("Admin")) {
					// System.out.println("Logged in as Admin");
					request.getRequestDispatcher("AdminUserMenu.jsp").forward(request, response);
				} else {
					// System.out.println("Logged in as User");
					// AppGenericDao appDao = new AppGenericDao();
					// List<Item> stockItems = appDao.getRows();
					// request.setAttribute("stockList", stockItems);
					request.getRequestDispatcher("AuthenticatedUserMenu.jsp").forward(request, response);
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
