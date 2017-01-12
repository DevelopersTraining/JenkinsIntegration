<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="general.css">
<title>Hexa Store</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HexaStore</title>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar"></button>
			<a class="navbar-brand" href="#">Hexa Store</a>
			<div class="navbar-form navbar-right">
				<a class="btn btn-success" href="Login.jsp">Sign Off</a>
			</div>
		</div>
		<a class="navbar-brand" style="float: right">Logged in as <%=request.getSession().getAttribute("roleName")%>: <%=request.getSession().getAttribute("userName")%></a>
		<div id="navbar" class="navbar-collapse collapse"></div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron" style="padding-bottom: 0px">
		<div id="logo">
      
        <img src="store2.png" class="admin-img">      
      
      <span>Current Items</span>
    </div>
    </div>
	 <h1 class="text-center login-title">ADMIN USER MENU</h1>
	<center>
	
		<a class="btn btn-primary btn-lg" href="charts">View Report &raquo</a><br><br>
		

		<form action="stockServlet" method="post">
			<input class="btn btn-primary btn-lg" type="submit" value="View Stock &raquo;" />
		</form>
	<hr>
	</center>
	<footer>
	<p>&copy; 2017 Company, Inc.</p>
	</footer>
</body>
</html>