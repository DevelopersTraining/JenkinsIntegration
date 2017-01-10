
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%>
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
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div>
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
		<div class="">
			<h1>Welcome, mushashon</h1>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<form>

			<div class="table-responsive">
				<table class="table display" id="example">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Description</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
					<%
						ArrayList<Item> stockList = (ArrayList<Item>) request.getAttribute("stockList");
						for (Item items : stockList) {
					%>
					
						<tr>
							<td><%=items.getItemId().toString()%></td>
							<td><%=items.getName().toString()%></td>
							<td><%=items.getDescription().toString()%></td>
							<td><%=items.getQuantity().toString()%></td>
						</tr>
					
					<%
						}
					%>
					</tbody>
				</table>
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
