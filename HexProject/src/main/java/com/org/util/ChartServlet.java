package com.org.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChartServlet
 */

@WebServlet("/charts")
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String responseURL = "/Chart.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(responseURL);
		dispatcher.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String responseURL = "/Chart.jsp";
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    String respuesta =  "["
	    					+"[1263254400000,29.67],"
	    					+"[1263340800000,30.09],"
							+"[1263427200000,29.92],"
							+"[1263513600000,29.42],"
							+"[1263859200000,30.72],"
							+"[1263945600000,30.25],"
							+"[1264032000000,29.72],"
							+"[1264118400000,28.25],"
							+"[1264377600000,29.01],"
							+"[1264464000000,29.42],"
							+"[1264550400000,29.70],"
							+"[1264636800000,28.47],"
							+"[1264723200000,27.44]"
							+ "]";
	    
	    
	    response.getWriter().write(respuesta);
		
		
	}

}
