<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	margin-top: -50px;
	margin-left: -100px;
}
</style>
<% 
String  item  = (String) session.getAttribute("item");        
String  description  = (String) session.getAttribute("description");
String  quantity  = (String) session.getAttribute("quantity");
%>
</head>
<body>
<body style="background-color: powderblue;">
	<header>
	<h1 align="center">
		<font color="blue">ADMIN UPDATE STOCK PAGE</font>
	</h1>
	</header>

	<form action="StockHandlerServlet" method="post">
		<center>
			<table style="width: 100%">
				<tr>
					<td>Item name:</td>
					<td><input type="text" name="item" value=<%= item %>/></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td>
						<textarea name="description" rows="5" cols="20" value=<%= description %>>
						</textarea>
					</td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input type="text" name="quantity" pattern="[0-9]" value=<%= quantity %>/></td>
				</tr>
			</table>
			<input type="submit" value="Update Item" />
			<button type="reset" value="Cancel">Clear</button>
			<input type="hidden" name="stockHandler" value="stockUpdate">
	</form>
</body>
</html>