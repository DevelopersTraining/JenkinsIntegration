 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.*,com.org.bean.User,com.org.dao.UserDao"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $('#example').DataTable({
    	"order":[[2,"desc"]]
    });
});
</script>
<title>Insert title here</title>
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
      <div class="">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            
          </button>
          <a class="navbar-brand" href="#">Hexa Store</a>
          <form action="Login.jsp" class="navbar-form navbar-right">
    		<input class="btn btn-success" type="submit" value="Sign Off" />
		  </form>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="">
        <h1>DBA DELETE USERS PAGE</h1>
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
