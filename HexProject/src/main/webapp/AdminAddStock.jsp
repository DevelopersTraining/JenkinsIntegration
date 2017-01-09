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
					<td><input type="text" name="item" required/></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea name="description" rows="5" cols="20" required></textarea>
					</td>
				</tr>
				<!-- Description: </td><td><input type="text" name="description" /></td></tr>-->
				<tr>
					<td>Quantity:</td>
					<!-- <td><input type="text" name="quantity" pattern="[0-9]+" /></td> -->
					<td><input type="text" name="quantity"
						onkeypress='return event.charCode >= 48 && event.charCode <= 57'required></input>
					</td>
				</tr>
			</table>
			<p></p>
			<input type="submit" value="Add Item" />
			<button type="reset" value="Cancel">Clear</button>
			<input type="hidden" name="stockHandler" value="stockAdd">
		</center>
	</form>
</body>
</html>
