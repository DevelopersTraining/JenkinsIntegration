package com.org.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.bean.Item;
import com.org.dao.AppGenericDao;
import com.org.dao.HistoryStockDao;

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
		
		AppGenericDao appDao = new AppGenericDao();
		List<Item> stockItems = appDao.getRows();
		request.setAttribute("stockList", stockItems);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(responseURL);
		dispatcher.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Boolean error = false;
		String responseURL = "/Chart.jsp";
		
		String item = request.getParameter("item");
//		String elements = request.getParameter("elements");
		String dtpFrom = request.getParameter("dtpFrom");
		String dtpTo = request.getParameter("dtpTo");
		
		
	    Date parsedDate = null;
	    try {
	        parsedDate = formatter.parse(dtpFrom);
//	        dtpFrom = dtpFrom.replaceAll("/", "-");
	    } catch (ParseException e) {
	    	System.out.println("Error when parsing from date");
	    	response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    	error = true;
	    }
	    
	    try {
	        parsedDate = formatter.parse(dtpTo);
//	        dtpTo = dtpTo.replaceAll("/", "-");
	    } catch (ParseException e) {
	    	System.out.println("Error when parsing to date");
	    	response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    	error = true;
	    }
	    
	    try{
	    	if(!item.matches("\\d+")){
	    		System.out.println("Error when getting the item id");
	    		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    		error = true;
	    	}
//	    	if(elements == null){
//	    		System.out.println("Error when parsing elements");
//	    		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//	    		error = true;
//	    	}
	    	 	
	    }catch(Exception e){
	    	e.printStackTrace();
	    	response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    	error = true;
	    }
	    String respuesta =  "";
	    if(error == false){
	    	
	    	try{
	    	
	//		    String[] elementos = elements.split(",");
				response.setContentType("application/json");
			    response.setCharacterEncoding("UTF-8");
			    
			    
			    HistoryStockDao appDao = new HistoryStockDao();
			    List<Object[]> report = appDao.generateChart(item, 1, dtpFrom, dtpTo);
			    
			    respuesta =  "[";
			    ArrayList<String> listItem = new ArrayList();
				for (Object[] result : report) {
					String avg =  String.valueOf(result[0]);
					String date =  String.valueOf(result[1]);
					
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					Date dateG = df.parse(date);
					
					Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
					calendar.setTime(dateG);
					calendar.set(Calendar.HOUR_OF_DAY, 00);
					calendar.set(Calendar.MINUTE, 00);
					calendar.set(Calendar.SECOND, 00);
//					calendar.set(Calendar.MILLISECOND, 0);
					
					Date d = calendar.getTime();
					
					listItem.add("["+d.getTime()+","+avg+"]");
	
				}
			    respuesta = respuesta+ String.join(",", listItem) + "]";
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
		    
//		    String respuesta =  "["
//		    					+"[1263254400000,29.67],"
//		    					+"[1263340800000,30.09],"
//								+"[1263427200000,29.92],"
//								+"[1263513600000,29.42],"
//								+"[1263859200000,30.72],"
//								+"[1263945600000,30.25],"
//								+"[1264032000000,29.72],"
//								+"[1264118400000,28.25],"
//								+"[1264377600000,29.01],"
//								+"[1264464000000,29.42],"
//								+"[1264550400000,29.70],"
//								+"[1264636800000,28.47],"
//								+"[1264723200000,27.44]"
//								+ "]";
		    
		    
		    response.getWriter().write(respuesta);
	    	
	    }
	    
	    

	    
	    
	    
		
		
	}

}
