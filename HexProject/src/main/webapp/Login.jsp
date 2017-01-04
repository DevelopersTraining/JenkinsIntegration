
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
p.normal {
    border: 2px solid red;
	border-radius: 12px;
	padding: 25px 50px;
	background-color: lightgreen;
	padding: 50px, 50px, 50px, 50px;
}

form {
	position: fixed;
	top: 40%;
	left: 40%;
	width: 250px;
}
</style>

</head>
<body>



<body style="background-color:powderblue;">
	<header>
	<h1 align="center">
		<font color="blue">STOCK INVENTORY MANAGEMENT</font>
	</h1>
	</header>
	<div style="float: left;"><img src="Inventory.jpg" alt="Mountain View"
		style="width: 304px; height: 228px;"></div>
		<div style="float: right;"><img src="stock-inventory-management-system-with-pos-point-of-sale-500x500.jpg" alt="Inventory View"
		style="width: 304px; height: 228px;"></div>
	<form action="loginServlet" method="post">
		<center>
		<p class ="normal">
		
			<font color="maroon">User Name :</font><input type="text"
			name="AdminId" /><br />
			<br/> <font color="maroon">Password :</font><input type="password" name="Password" /><br />
			<br/> <font color="red"><input type="radio" name="user_type" value="dba">DBA
			User<br /></font><font color="red"> <input type="radio" name="user_type" value="other">
			Other Users<br></font> <br> <input type="submit" value="login" />
			<button type="reset" value="Cancel">Cancel</button></p>
		</center>
	</form>
	</center>
</body>
</html>