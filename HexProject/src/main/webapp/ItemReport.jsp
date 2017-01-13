<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Styles -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="general.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="https://eonasdan.github.io/bootstrap-datetimepicker/">
<link rel="stylesheet" href="http://davidstutz.github.io/bootstrap-multiselect/dist/css/bootstrap-multiselect.css">
<!-- End styles -->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
<script src="http://davidstutz.github.io/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable({
			"order" : [ [ 2, "desc" ] ]
		});
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hexa Store</title>

<style>

    .multiselect-container {
        width: 100% !important;
    }
</style>
</head>
<body>
    	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar"></button>
				<a class="navbar-brand" href="AuthenticatedUserMenu.jsp">Hexa Store</a>
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
      
        <img src="store2.png" class="admin-img">      
      
      <span>Item Report Generator</span>
    </div>
    </div>
    <div class="container">
    	<form action="AuthenticatedUserMenu.jsp" method="post">
			<!--  input class="btn btn-primary btn-lt" type="submit" value="Back to Menu" / -->
	    </form>
    	<div class="row">    	
    	<form action="reportServlet" method="post">
    		<div class='col-sm-4'>
					<select name="reportType" id="elements">
						<option value="new"
							<%=(request.getAttribute("reportType")!=null)?((request.getAttribute("reportType").toString().equalsIgnoreCase("new"))?"selected":""):"" %>>New
							Items</option>
						<option value="deleted"
							<%=(request.getAttribute("reportType")!=null)?((request.getAttribute("reportType").toString().equalsIgnoreCase("deleted"))?"selected":""):"" %>>Deleted
							Items</option>
						<option value="updated"
							<%=(request.getAttribute("reportType")!=null)?((request.getAttribute("reportType").toString().equalsIgnoreCase("updated"))?"selected":""):"" %>>Updated
							Items</option>
					</select>
				</div>
    	
	        <div class='col-sm-3'>
	                <div class='input-group date' id='datetimepickerFrom'>
	                    <input type='text' name="startDate" class="form-control" placeholder="Date From" value=<%=(request.getAttribute("startDate") != null)?request.getAttribute("startDate"):""%>/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	        </div>
	        
	       	<div class='col-sm-3'>
	                <div class='input-group date' id='datetimepickerTo'>
	                    <input type='text' name="endDate" class="form-control" placeholder="Date To" value=<%=(request.getAttribute("endDate") != null)?request.getAttribute("endDate"):""%>/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	        </div>
	        
	         <div class='col-sm-2'>
	            	<button type="submit" value="Get Report" class="btn btn-primary">Get Report</button>
	         </div>
	        </form>
	        
	    </div>
    
    
      
    </div> <!-- /container -->
    <br>
    <br>
    <div class="container">
    
	<%
	if (request.getAttribute("stockList") != null) {
	%>
		<div class="table-responsive">
		<table class="table display" id="example">
			<thead>
				<tr>
					<th>No.</th>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Quantity</th>
					<th>Vendor</th>
					<th><%=(request.getAttribute("date")) !=null?request.getAttribute("date").toString():""%></th>
				</tr>
			</thead>
			<tbody>
				<%
						ArrayList<Item> stockList = (ArrayList<Item>) request.getAttribute("stockList");
						System.out.println(stockList);
						int i = 1;
						for (Item items : stockList) {
				%>
				<tr>
					<td><%=i %></td>
					<td><%=items.getItemId()%></td>
					<td><%=items.getName()%></td>
					<td><%=items.getDescription()%></td>
					<td><%=items.getQuantity()%></td>
					<td><%=items.getVendor()%></td>
					<td><%=items.getCreationDate()%></td>
				</tr>
				<%
							i++;
						}
				%>
			</tbody>
		</table>
		
		<%} %>
    </div>
    </div>
    
    <hr>
    <footer class="footer">
    	<p>&copy; 2017 Company, Inc.</p>
    </footer>
	
	
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
	<script src="http://davidstutz.github.io/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
	
	<script type="text/javascript">
	
		$(function () {
	    	$('#datetimepickerFrom').datetimepicker({
	    		showClear: true,
	    		showClose: false,
	    		format: 'MM/DD/YYYY'
	    	});
	    	$('#datetimepickerTo').datetimepicker({
	    		useCurrent: false,
	    		showClear: true,
	    		showClose: false,
	    		format: 'MM/DD/YYYY'
	    	});
	    	
	        $("#datetimepickerFrom").on("dp.change", function (e) {
	            $('#datetimepickerTo').data("DateTimePicker").minDate(e.date);
	        });
	        $("#datetimepickerTo").on("dp.change", function (e) {
	            $('#datetimepickerFrom').data("DateTimePicker").maxDate(e.date);
	        });
	        
	    	
	    	$('#elements').multiselect({

	    		buttonWidth: '100%',
	    		nonSelectedText: 'Select type of chart',
	    		
	    	});
	    	
	    	
	    	
	    	var chart = Highcharts.chart('container', {
   		        chart: {
   		            type: 'spline'
   		        },
   		        title: {
   		            text: 'Product stock quantity'
   		        },
   		        subtitle: {
   		            text: 'May 31 2016 and and June 1 2016'
   		        },
   		        xAxis: {
   		            type: 'datetime',
   		            labels: {
   		                overflow: 'justify'
   		            }
   		        },
   		        yAxis: {
   		            title: {
   		                text: 'Product Quantity'
   		            },
   		            minorGridLineWidth: 0,
   		            gridLineWidth: 0,
   		            alternateGridColor: null,
   		        },
   		        tooltip: {
   		            valueSuffix: ''
   		        },
   		        plotOptions: {
   		            spline: {
   		                lineWidth: 4,
   		                states: {
   		                    hover: {
   		                        lineWidth: 5
   		                    }
   		                },
   		                marker: {
   		                    enabled: false
   		                },
   		                pointInterval: 3600000, // one hour
   		                pointStart: Date.UTC(2015, 0, 12, 0, 0, 0)
   		            }
   		        },
   		        navigation: {
   		            menuItemStyle: {
   		                fontSize: '10px'
   		            }
   		        },
   		        
   		    });
			
	    	
	    	
	    	$('#btnGenerate').click(function(){
	    		
	    		$.ajax({	
	    			url: "efefe",
	    			method: "POST",
	    			context: document.body,
	    		}).done(function(data) {
	    			
	    			$('#container').show();
	    	       	chart.addSeries({
	    	        	name: 'ADBE',
	    	            data: data
	    	        });  
	    			
	    		}).fail(function()  {
	    		    alert("Sorry. Server unavailable. ");
	    		});

	    		
	    	});
	    	
	    	
	    });
		
		
		
		
		
		
		
	</script>

</body>
</html>