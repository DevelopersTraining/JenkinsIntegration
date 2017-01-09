<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
form {
	position: fixed;
	top: 40%;
	left: 50%;
}
</style>
</head>
<body style="background-color: powderblue;">
	<header>
	<h1 align="center">
		<font color="blue">ADMIN ADD STOCK PAGE</font>
	</h1>
	</header>

	<form action="StockHandlerServlet" method="post">
		<center>
			<table border=1>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Quantity</th>
				</tr>
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
				</tr>
				<%
					}
				%>
			</table>
			<input type="submit" name="stockButton" value="add" />
			<input type="submit" name="stockButton" value="update" />
			<input type="submit" name="stockButton" value="delete" />
			<input type="hidden" name="stockHandler" value=stockEdit>
		</center>
	</form>
</body>
</html>