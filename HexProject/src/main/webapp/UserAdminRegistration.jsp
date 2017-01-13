
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="general.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Hexa Store</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar"></button>
			<a class="navbar-brand" href="userServlet#">Hexa Store</a>
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
      <a href="/">
        <img src="admin-dba.png" style="width: 100px;">
        <span>Add User</span>
      </a>
    </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <form action="userServlet" method="post">
		
		<div class="table-responsive">
		<table class="table">
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
 <option value="admin">Administrator</option>
 <option value="users">Authenticated Users</option>
 </select></td></tr>
		</table>
	<input class="btn btn-primary btn-sm" type="hidden" name="DbaRequest" value="adminAdd"/>
	<input class="btn btn-primary btn-sm" type="submit" value="Register"/> 
	<button class="btn btn-primary btn-sm" type="reset" value="Cancel">Cancel</button></p>
		</div>
		
	</form>
      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
