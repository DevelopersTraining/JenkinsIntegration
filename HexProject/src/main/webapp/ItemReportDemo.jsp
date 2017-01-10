<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items Report</title>
</head>
<body>
	<center>
		<form action="reportServlet">
			<select name="reportType">
				<option value="new" <%=(request.getAttribute("reportType")!=null)?((request.getAttribute("reportType").toString().equalsIgnoreCase("new"))?"selected":""):"" %>>New Items</option>
				<option value="deleted" <%=(request.getAttribute("reportType")!=null)?((request.getAttribute("reportType").toString().equalsIgnoreCase("deleted"))?"selected":""):"" %>>Deleted Items</option>
				<option value="updated" <%=(request.getAttribute("reportType")!=null)?((request.getAttribute("reportType").toString().equalsIgnoreCase("updated"))?"selected":""):"" %>>Updated Items</option>
			</select> <br> <br> <input type="submit" value="Get Report">
		</form>
	</center>
	<div>
	<%
	if (request.getAttribute("stockList") != null) {
	%>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Quantity</th>
					<th>Vendor</th>
					<th><%=(request.getAttribute("date")) !=null?request.getAttribute("date").toString():""%></th>
				</tr>
			</thead>
			<tbody>
				<%
						ArrayList<Item> stockList = (ArrayList<Item>) request.getAttribute("stockList");
						System.out.println(stockList);
						for (Item items : stockList) {
				%>
				<tr>
					<td><input type="radio" name="itemId"
						value="<%=items.getItemId()%>" /></td>
					<td><%=items.getName()%></td>
					<td><%=items.getDescription()%></td>
					<td><%=items.getQuantity()%></td>
					<td><%=items.getVendor()%></td>
					<td><%=items.getCreationDate()%></td>
				</tr>
				<%
						}
				%>
			</tbody>
		</table>
		<%} %>
	</div>
</body>
</html>