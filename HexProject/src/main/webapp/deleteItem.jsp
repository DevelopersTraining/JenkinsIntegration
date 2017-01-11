
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.*,com.org.bean.Item,java.sql.Date;"%>
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
        <a class="navbar-brand" href="#">Logged in as <%=request.getSession().getAttribute("roleName")%>: <%=request.getSession().getAttribute("userName")%></a>
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
		<table class="table" id="example">
		<thead>
		<tr>
			<th>Item Name</th>
			<th>Description</th>
			<th>Quantity</th>
			<th>Vendedor</th>
			<th>Creation Date</th>
		</tr>
		</thead>
		<tbody>
			<tr>
					<td><%= name %></td>				
					<td><%= description %></td>					
					<td><%= quantity %></td>					
					<td><%= vendor %></td>					
					<td><%= creationDate %></td>
			</tr>
		</tbody>
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
