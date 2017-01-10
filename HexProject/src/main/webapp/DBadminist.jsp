<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.ArrayList,com.org.bean.User,java.util.Iterator"%> 


<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
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
      <div class="container">
        <h1>Admin Add Stock Page</h1>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <FORM action="deleteUser.jsp">
		
		<div class="table-responsive">
		<table class="table">
			<tr>
<th>Id</th>
<th>Name</th>
<th>RoleName </th>
<th>Registration Date </th>
</tr>
<%  
	ArrayList<User> stockList= (ArrayList<User>) request.getAttribute("userList");
	System.out.println(stockList);
    for(User users:stockList){
 %>
        <tr>
        <td><input type="radio" name="userId"   value="<%=users.getUserId()%>"/></td>
        <td > <%= users.getUserName() %> </td>
        <td > <%=users.getRoleName()%> </td>
        <td> <%=users.getRegDate() %> </td>
        </tr>
<% }%>
		</table>
		</div>
		<input class="btn btn-primary btn-sm" type="submit" value="DeleteUser"/>
		</FORM>
		<br>
<FORM action="UserAdminRegistration.jsp" >
<input class="btn btn-primary btn-sm" type="submit" value="AddUser"/> 
</FORM>
      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
