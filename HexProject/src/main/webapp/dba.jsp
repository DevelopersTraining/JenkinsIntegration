

<!-- <style> -->
/* table { */
/* 	font-family: arial, sans-serif; */
/* 	border-collapse: collapse; */
/* 	width: 100%; */
/* } */

/* td, th { */
/* 	border: 1px solid #FF0000; */
/* 	text-align: left; */
/* 	padding: 8px; */
/* } */

/* tr:nth-child(even) { */
/* 	background-color: #dddddd; */
/* } */
<!-- </style> -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.org.bean.User"%>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<SCRIPT language="javascript">
	function add(type) {

		//Create an input type dynamically.
		var element = document.createElement("input");

		//Assign different attributes to the element.
		element.setAttribute("type", type);
		element.setAttribute("value", type);
		element.setAttribute("name", type);

		var foo = document.getElementById("fooBar");

		//Append the element in page (in span).
		foo.appendChild(element);

	}
</SCRIPT>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar"></button>
			<a class="navbar-brand" href="#">Hexa Store</a>
			<form action="Login.jsp" class="navbar-form navbar-right">
				<input class="btn btn-success" type="submit" value="Sign Off" />
			</form>
		</div>
		<div id="navbar" class="navbar-collapse collapse"></div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h1>WELCOME DATABASE ADMINISTRATION</h1>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<form action="StockHandlerServlet" method="post">

			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>S. No.</th>
						<th>User Name</th>
						<th>Role Name</th>
						<th>Registration Date</th>
					</tr>
					<%
						ArrayList<User> userlist = new ArrayList<User>();

						if (request.getAttribute("userList") != null) {
							userlist = (ArrayList<User>) request.getAttribute("userList");
						}

						int sno = 1;
						for (User u : userlist) {
					%>
					<tr>
						<th><%=sno%></th>
						<th><%=u.getUserName()%></th>
						<th><%=u.getRoleName()%></th>
						<th><%=u.getRegDate()%></th>
					</tr>
					<%
						sno++;
						}
					%>
					<p></p>
					<FORM>
						<H2>Dynamically add element in form.</H2>
						Select the element and hit Add to add it in form. <BR /> <SELECT
							name="element">
							<OPTION value="button">Button</OPTION>
							<OPTION value="text">Textbox</OPTION>
							<OPTION value="radio">Radio</OPTION>
						</SELECT> <INPUT type="button" value="Add"
							onclick="add(document.forms[0].element.value)" /> <span
							id="fooBar">&nbsp;</span>

					</FORM>
					</center>
					</header>
				</table>
			</div>
			<input class="btn btn-primary btn-sm" type="submit" value="Add User" />
			<button class="btn btn-primary btn-sm" type="reset" value="Cancel">Delete User</button>
		</form>
		<hr>

		<footer>
		<p>&copy; 2017 Company, Inc.</p>
		</footer>
	</div>
	<!-- /container -->
</body>
</html>
