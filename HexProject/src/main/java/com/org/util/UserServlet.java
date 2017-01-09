package com.org.util;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.org.bean.User;
import com.org.dao.UserDao;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {

	@Autowired
	UserDao userDao;

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String responseURL = "/DBadminist.jsp";
		ArrayList<User> listUser = new ArrayList();
		User someUser = null;

		try {

			String requestType = "";

			// Validate the request
			if (request.getParameter("adminRequest") != null) {
				System.out.println("Admin Request type is"+request.getParameter("adminRequest").toString());
				requestType = request.getParameter("adminRequest").toString();
			}
			/*if(requestType.equalsIgnoreCase("addUser"))
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("/UserAdminRegistration.jsp");
				dispatcher.forward(request, response);
				//response.sendRedirect("/UserAdminRegistration.jsp");
			}*/
			if (requestType.equalsIgnoreCase("adminAdd")) {
				System.out.println("Inside Admin Add");
				someUser = new User();
				someUser.setUserName(request.getParameter("userName").toString());
				Long roleId=0L;
				if(request.getParameter("roleId").toString().equalsIgnoreCase("admin"))
				{
					roleId=1L;
				}
				else if(request.getParameter("roleId").toString().equalsIgnoreCase("users"))
				{
					roleId=2L;
				}
				someUser.setRoleId(roleId);
				someUser.setUserPassword(request.getParameter("password"));
				userDao.addUser(someUser);

				request.setAttribute("addUserOk", "An user was added!");

			} else if (requestType.equalsIgnoreCase("deleteUser")) {

				someUser = new User();
				Long userId = Long.valueOf(request.getParameter("userId").toString());
				someUser.setUserId(userId);
				userDao.deleteUser(someUser);

				request.setAttribute("deleteUserOk", "The user was deleted!");

			}

			userDao = new UserDao();
			// Always have to get the user list to be showed in the JSP
			listUser = userDao.getUserList();
			request.setAttribute("userList", listUser);

		} catch (Exception e) {
			System.out.println("Error:" + e.toString());
			e.printStackTrace();
		}

		// Return to the JSP
		RequestDispatcher dispatcher = request.getRequestDispatcher(responseURL);
		dispatcher.forward(request, response);
	}

}
