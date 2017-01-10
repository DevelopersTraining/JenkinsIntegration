
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%>
<html>
<head>
<link rel="stylesheet"	
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" >
<link rel="stylesheet" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable( {
	        "order": [[ 2, "desc" ]]
	    } );
	} );
</script>
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
			<h1>Admin Add Stock Page</h1>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<form action="StockHandlerServlet" method="post">

			<div class="table-responsive">
				<table class="display" id="example">
					<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
						<th>Quantity</th>
						<th>Vendor</th>
						<th>Created at</th>
					</tr>
					</thead>
					<tbody>
					<%
						ArrayList<Item> stockList = (ArrayList<Item>) request.getAttribute("stockList");
						System.out.println(stockList);
						for (Item items : stockList) {
					%>
					<tr>
						<td><input type="radio" name="itemId"
							value="<%=items.getItemId()%>" /></td>
						<td><%=items.getName()%></td>
						<td><%=items.getDescription()%></td>
						<td><%=items.getQuantity()%></td>
						<td><%=items.getVendor()%></td>
						<td><%=items.getCreationDate() %></td>
					</tr>
					<%
						}
					%>
					</tbody>
				</table>
				<input class="btn btn-primary btn-sm" type="submit"
					name="stockButton" value="update" /> <input
					class="btn btn-primary btn-sm" type="submit" name="stockButton"
					value="delete" /> <input class="btn btn-primary btn-sm"
					type="hidden" name="stockHandler" value=stockEdit> <input
					class="btn btn-primary btn-sm" type="submit" name="stockButton"
					value="add" /> <input class="btn btn-primary btn-sm" type="hidden"
					name="stockHandler" value=stockEdit>
			</div>
		</form>

		<hr>

		<footer>
			<p>&copy; 2017 Company, Inc.</p>
		</footer>
	</div>
	<!-- /container -->
</body>
</html>
