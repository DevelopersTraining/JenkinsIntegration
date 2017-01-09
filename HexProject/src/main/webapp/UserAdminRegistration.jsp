<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body style="background-color:powderblue;">
<header>
	<h1 align="center">
		<font color="blue">WELCOME TO DBA HOMEPAGE</font>
	</h1>
</header>
<form action = "userServlet" method = "post" >
<center>
<table style= "width:50%">
<tr><td>
 User Name*: </td><td><input type="text" name="userName" required/></td></tr>
<tr><td>
Password*: </td><td><input type="password" name="password" required/></td></tr>
<!-- <tr><td>
Registration Date*:</td><td>
<input type="date" name="reg_date" required/>
</td></tr> -->
<tr><td>
Role: </td><td><select name="roleId">
 <option value="admin">User Administrators</option>
 <option value="users">Users</option>
 </select></td></tr>
</table><p></p>
<input type="hidden" name="adminRequest" value="adminAdd"/>
<input type="submit" value="Register"/> 
<button type="reset" value="Cancel">Cancel</button></p>
		</center>
</center>
</form>
</body>
</html>