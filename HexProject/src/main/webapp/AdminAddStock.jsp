 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="general.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <div class="jumbotron" style="padding-bottom: 0px">
    <div id="logo">
      <a href="/">
        <img src="admin-storre.png" style="width: 200px;">
        <span>Add Stock</span>
      </a>
    </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <form action="StockHandlerServlet" method="post">
		
		<div class="table-responsive">
		<table class="table">
			<tr>
					<td>Item name:</td>
					<td><input type="text" name="item" required='true'/></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea name="description" rows="5" cols="20" required='true'></textarea>
					</td>
				</tr>
				<!-- Description: </td><td><input type="text" name="description" /></td></tr>-->
				<tr>
					<td>Quantity:</td>
					<!-- <td><input type="text" name="quantity" pattern="[0-9]+" /></td> -->
					<td><input type="text" name="quantity"
						onkeypress='return event.charCode >= 48 && event.charCode <= 57'required='true'></input>
					</td>
				</tr>
				<tr>
					<td>Item Vendor:</td>
					<td><input type="text" name="vendor" required='true'/></td>
				</tr>
		</table>
		</div>
			<input class="btn btn-primary btn-sm" type="submit" value="Add Item" />
			<button class="btn btn-primary btn-sm" type="reset" value="Cancel">Clear</button>
			<input class="btn btn-primary btn-sm" type="hidden" name="stockHandler" value="stockAdd">
		
	</form>
      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
  </body>
</html>
