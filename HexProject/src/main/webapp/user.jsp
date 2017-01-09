 <%@ page import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%> 
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.jqueryui.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "pagingType": "full_numbers"
    } );
} );
</script>
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
        <h1>Welcome</h1>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <form>
		
		<div class="table-responsive">
		<table class="table" id="example">
		<thead>
			<tr>
<th>Id</th>
<th>Name</th>
<th>Description </th>
<th>Quantity </th>
</tr>
</thead>
<%  
	ArrayList<Item> stockList= (ArrayList<Item>) request.getAttribute("stockList");
	System.out.println(stockList);
    for(Item items:stockList){
        %>
        <tbody>
        <tr>
        <td> <%=items.getItemId()%> </td>
        <td > <%= items.getName() %> </td>
        <td > <%=items.getDescription()%> </td>
        <td > <%=items.getQuantity()%> </td>
        </tr>
        </tbody>
<% }%>
		</table>
		</div>
		
	</form>
      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
