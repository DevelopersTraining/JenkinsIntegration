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
</head>
<body>
<body style="background-color: powderblue;">
	<header>
	<h1 align="center">
		<font color="blue">ADMIN ADD STOCK PAGE</font>
	</h1>
	</header>

	<form action="StockHandlerServlet" method="post">
		<center>
			<table style="width: 100%">
				<tr>
					<td>Item name:</td>
					<td><input type="text" name="item" /></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea rows="2" cols="16">
</textarea></td>
				</tr>

				<!-- Description: </td><td><input type="text" name="description" /></td></tr>-->
				<tr>
					<td>Quantity:</td>
					<td><input type="text" name="quantity" pattern="[0-9]+" /></td>
				</tr>
			</table>
			<input type="hidden" name="stock" value="addStock">
			<p></p>
			<input type="submit" value="Add Item" />
			<button type="reset" value="Cancel">Clear</button>
		</center>
	</form>
</body>
</html>