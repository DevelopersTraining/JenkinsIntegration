<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.ArrayList,com.org.bean.User,java.util.Iterator"%> 
<html>
<head>
	<link rel="stylesheet" href="general.css">
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
    <div class="jumbotron" style="padding-bottom: 0px;
    								padding-left: 5px;">
      <div id="logo">
      <a href="/">
        <img src="admin-dba.png" style="width: 80px;">
        <span>DBA Admin</span>
      </a>
    </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <FORM action="deleteUser.jsp" id="deleteForm">
		
		<div class="table-responsive">
		<table class="table display" id="example">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>RoleName </th>
				<th>Registration Date </th>
			</tr>
		</thead>
		<tbody>
			<%  
				ArrayList<User> stockList= (ArrayList<User>) request.getAttribute("userList");
				System.out.println(stockList);
			    for(User users:stockList){
			 %>
			        <tr>
				        <td><input type="radio" name="userId"  value="<%=users.getUserId()%>" required /></td>
				        <td > <%= users.getUserName() %> </td>
				        <td > <%=users.getRoleName()%> </td>
				        <td> <%=users.getRegDate() %> </td>
			        </tr>
			<% }%>
	</tbody>
		</table>
		</div>	
		<input class="btn btn-primary btn-sm" type="submit" value="Delete"/>
		<a class="btn btn-primary btn-sm" value="AddUser" onclick="document.getElementById('addForm').submit();">Add</a>
		
		</FORM>
		<br>
			<FORM action="UserAdminRegistration.jsp" id="addForm">
			
				 
			</FORM>
			
			
			
			   <%if(request.getAttribute("selectButton") != null){%>
			                	<span style="color:red; font-size=12px" ><%= request.getAttribute("selectButton").toString() %></span>
			            <%} %> 
			          		           
      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
    
    <script type="text/javascript">
    function submitForm()
    {
    	var f = document.getElementById("deleteForm");
    	if(f.checkValidity()) {
    	    f.submit();
    	  } else {
    	    alert(document.getElementById('deleteForm').validationMessage);
    	  }
         
         document.getElementById("addForm").submit();
    } 
    </script>
  </body>
</html>
