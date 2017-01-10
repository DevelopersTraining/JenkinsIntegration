<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Items Report</title>

</head>
<body style="background-color: powderblue;">
	<h1 align="center">
		<font color="blue">REPORTS ON NEW ITEMS</font>
	</h1>
	<center>
	
		<form action="reportServlet" method="post">
			<input type="submit" name="userSubmit" value="View Report" >
		</form>

		<form action="stockServlet" method="post">
			<input type="submit" name="userSubmit" value="View Stock">
			<input type="hidden" name="stockRedirect" value="listUser">
		</form>
		
		
	</center>
</body>
</html>