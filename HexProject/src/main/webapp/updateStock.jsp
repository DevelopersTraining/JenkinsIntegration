<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.*,com.org.bean.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="general.css">
<title>Hexa Store</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>

<%
	Item item = (Item) request.getAttribute("itemData");
	System.out.println("in the jsp page");
	System.out.println(item.toString());
	String name = item.getName();
	String description = item.getDescription();
	Long quantity = item.getQuantity();
	String vendor = item.getVendor();
%>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar"></button>
				<a class="navbar-brand" href="stockServlet">Hexa Store</a>
				<form action="Login.jsp" class="navbar-form navbar-right">
					<input class="btn btn-success" type="submit" value="Sign Off" />
				</form>
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
        <img src="store2.png" style="width: 200px;">
        <span>ADMIN UPDATE STOCK PAGE</span>
      </a>
    </div>
    </div>
	
	<div class="container">
		<form action="StockHandlerServlet" method="post">
			<div class="table-responsive">
								
								
									<table class="table">
			<tr>
						<td>Item name:</td>
							<td><input type="text" required='true' name="item"
										value=<%=name%>></td>
									</tr>
				<tr>
										<td>Description:</td>
										<td><textarea name="description" required='true' rows="5"
												cols="20"> <%=description%> 
						</textarea></td>
									</tr>
				<!-- Description: </td><td><input type="text" name="description" /></td></tr>-->
				<tr>
										<td>Quantity:</td>
										<td>
											<!-- <input type="text" name="quantity" pattern="[0-9]" value=<%=quantity%>/>  -->
											<input type="text" required='true' name="quantity"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											value=<%=quantity%>>
										</td>
									</tr>
				<tr>
										<td>Vendor:</td>
										<td><input type="text" required='true' name="vendor"
											value=<%=vendor%>></td>
									</tr>
		</table>
				</div>
							<input type="submit" value="updateItem" />
							<button type="reset" value="Cancel">Clear</button>
							<input type="hidden" name="id" value="<%=item.getItemId()%>">
							<input type="hidden" name="stockHandler" value="stockUpdate">
		</form>
	<hr>
		<footer>
			<p>&copy; 2017 Company, Inc.</p>
		</footer>
	</div>
</body>
</html>