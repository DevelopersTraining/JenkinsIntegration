<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/dataTables.jqueryui.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authenticated User Menu</title>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar"></button>
			<a class="navbar-brand" href="#">Hexa Store</a>
			<form action="Login.jsp" class="navbar-form navbar-right">
				<input class="btn btn-success" type="submit" value="Sign Off" />
			</form>
			
		</div>
		<a class="navbar-brand" href="#">Logged in as <%=request.getSession().getAttribute("roleName")%>: <%=request.getSession().getAttribute("userName")%></a>
		<div id="navbar" class="navbar-collapse collapse"></div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div>
		</div>
	</div>
	 <h1 class="text-center login-title">AUTHENTICATED USER MENU</h1>
	<center>
	
		<form action="ItemReport.jsp" method="post">
			<input class="btn btn-primary btn-lg" type="submit" value="View Report &raquo;" />
		</form>
		

		<form action="stockServlet" method="post">
			<input type="hidden" name="stockRedirect" value="user">
			<input class="btn btn-primary btn-lg" type="submit" value="View Stock &raquo;" />
		</form>
	<hr>
	</center>
	<footer>
	<p>&copy; 2017 Company, Inc.</p>
	</footer>
</body>
</html>