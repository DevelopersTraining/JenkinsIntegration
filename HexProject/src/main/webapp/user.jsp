 <%@ page import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%> 
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
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Hexa Store</a>
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
      <form action="StockHandlerServlet" method="post">
		
		<div class="table-responsive">
		<table class="table">
			<tr>
<th>Id</th>
<th>Name</th>
<th>Description </th>
<th>Quantity </th>
</tr>
<%  
	ArrayList<Item> stockList= (ArrayList<Item>) request.getAttribute("stockList");
	System.out.println(stockList);
    for(Item items:stockList){
        %>
        <tr>
        <td> <%=items.getItemId()%> </td>
        <td > <%= items.getName() %> </td>
        <td > <%=items.getDescription()%> </td>
        <td > <%=items.getQuantity()%> </td>
        </tr>
<% }%>
		</table>
		</div>
		<input class="btn btn-primary btn-sm" type="submit" name="stockButton" value="add" />
		<input class="btn btn-primary btn-sm" type="submit" name="stockButton" value="update"/>
		<input class="btn btn-primary btn-sm" type="submit" name="stockButton" value="delete"/>
		<input class="btn btn-primary btn-sm" type="hidden" name="stockHandler" value=stockEdit>
	</form>
      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
