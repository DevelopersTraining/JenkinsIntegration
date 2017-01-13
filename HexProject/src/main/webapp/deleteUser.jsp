 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.*,com.org.bean.User,com.org.dao.UserDao"%>
<html>
<head>
<<link rel="stylesheet" href="general.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet"href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">


	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#example').DataTable({
				"order" : [ [ 2, "desc" ] ]
			});
		});
	</script>
<title>Hexa Store</title>
<% 
Long userId = Long.parseLong(request.getParameter("userId"));
User user= new UserDao().getUser(userId);
String  name  = user.getUserName();        
String  password  = user.getUserPassword();
String  role  = user.getRoleName();
%>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar"></button>
			<a class="navbar-brand" href="userServlet">Hexa Store</a>
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
        <span>Delete User</span>
      </a>
    </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <form action="userServlet" method="post">
		
		<div class="table-responsive">
		<table class="table" id="example">
			<thead>
			<tr>
				<th>User Name</th>
				<th>Password</th>
				<th>Role</th>
			</tr>
			</thead>
			<tbody>
				<tr>				
					<td><%=name%></td>
					<td><%=password%></td>
					<td><%= role %></td>								
				</tr>
			</tbody>
		</table>
		</div>
			<input  class="btn btn-primary btn-sm"type="submit" name="delete" value="delete" />
			<input class="btn btn-primary btn-sm" type="submit" name="delete" value="cancel"/>
			<input class="btn btn-primary btn-sm" type="hidden" name="id" value="<%=userId%>">			
			<input  class="btn btn-primary btn-sm" type="hidden" name="DbaRequest" value="deleteUser">		
	</form>
      <hr>
      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
