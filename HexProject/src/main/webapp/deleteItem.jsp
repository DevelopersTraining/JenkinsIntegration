
<!-- <style> -->
/* form { */
/* 	position: fixed; */
/* 	top: 40%; */
/* 	left: 50%; */
/* 	margin-top: -50px; */
/* 	margin-left: -100px; */
/* } */
<!-- </style> -->

 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.*,com.org.bean.Item,java.sql.Date;"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<% 
Item item = (Item) request.getAttribute("itemData");
String  name  = item.getName();        
String  description  = item.getDescription();
Long  quantity  = item.getQuantity();
String vendor = item.getVendor();
Date creationDate = item.getCreationDate();
%>
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
        <h1>ADMIN DELETE STOCK PAGE</h1>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <form action="StockHandlerServlet" method="post">
		
		<div class="table-responsive">
		<table class="table">
			<tr>
					<td>Item name:</td>
					<td><%= name %></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><%= description %></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><%= quantity %></td>
				</tr>
				<tr>
					<td>Vendor:</td>
					<td><%= vendor %></td>
				</tr>
				<tr>
					<td>Creation Date:</td>
					<td><%= creationDate %></td>
				</tr>
		</table>
		</div>
			<input  class="btn btn-primary btn-sm"type="submit" name="delete" value="delete" />
			<input class="btn btn-primary btn-sm" type="submit" name="delete" value="cancel"/>
			<input class="btn btn-primary btn-sm" type="hidden" name="id" value="<%=item.getItemId()%>">
			<input  class="btn btn-primary btn-sm" type="hidden" name="stockHandler" value="stockDelete">		
	</form>
      <hr>
      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
