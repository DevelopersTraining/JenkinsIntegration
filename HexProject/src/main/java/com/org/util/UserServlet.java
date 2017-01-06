package com.org.util;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.org.bean.User;
import com.org.dao.UserDao;
import com.org.dao.UserDaoInterface;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet{
	
	@Autowired
	UserDaoInterface userDao;
	
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
		
		String responseURL = "/dba.jsp";
		String requestType = request.getAttribute("requestType").toString();
		
		ArrayList<User> listUser = null;
		
		if(requestType.equalsIgnoreCase("getUserList")){
			listUser = userDao.getUserList();
			request.setAttribute("userList", listUser);
		}else if(requestType.equalsIgnoreCase("addUser")){
			
			
			listUser = userDao.getUserList();
		}else if(requestType.equalsIgnoreCase("deleteUser")){
			
			
			listUser = userDao.getUserList();
		}
		
		
		//Return to the JSP
		RequestDispatcher dispatcher = request.getRequestDispatcher(responseURL);
		dispatcher.forward(request, response);		
	}
	
	
}
