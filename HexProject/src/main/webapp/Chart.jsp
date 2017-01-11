<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="https://eonasdan.github.io/bootstrap-datetimepicker/">
<link rel="stylesheet" href="http://davidstutz.github.io/bootstrap-multiselect/dist/css/bootstrap-multiselect.css">
<style>

    .multiselect-container {
        width: 100% !important;
    }
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    <div class="jumbotron">
      <div class="">
        <h1>Chart Generator</h1>
      </div>
    </div>

    <div class="container">
    	
    	<div class="row">
    	
    	    <div class='col-sm-4'>
	        	<div class="form-group">
	        		<select id="item" >
	        		<%
						ArrayList<Item> stockList = (ArrayList<Item>) request.getAttribute("stockList");
						System.out.println(stockList);
						for (Item items : stockList) {
					%>
					    <option value="<%=items.getItemId()%>"><%=items.getName()%></option>
					    
					<%
						}
					%>
					</select>
	        	</div>
	        </div>
    	
<!--     		<div class='col-sm-2'> -->
<!-- 	        	<div class="form-group"> -->
<!-- 	        		<select id="elements" multiple="multiple"> -->
<!-- 					    <option value="0">New Items</option> -->
<!-- 					    <option value="1">Updated Items</option> -->
<!-- 					    <option value="2">Deleted Items</option> -->
<!-- 					</select> -->
<!-- 	        	</div> -->
<!-- 	        </div> -->
    	
	        <div class='col-sm-3'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepickerFrom'>
	                    <input type='text' class="form-control" id="dtpFrom" placeholder="Date From" readonly/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	        
	       	<div class='col-sm-3'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepickerTo'>
	                    <input type='text' class="form-control" id="dtpTo" placeholder="Date To" readonly/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	        
	         <div class='col-sm-2'>
	            <div class="form-group">
	            	<button type="button" class="btn btn-primary" id="btnGenerate">Generate</button>
	            </div>
	         </div>
	        
	    </div>
    
    
      
    </div> <!-- /container -->
    
    </br>
    </br>
    <div class="container" id="container" style="min-width: 310px; height: 400px; margin: 0 auto; display:none"></div>
    
    <hr>
    <footer class="footer">
    	<p>&copy; 2017 Company, Inc.</p>
    </footer>
	
	
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script> -->
	<script src="http://davidstutz.github.io/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	
	<script type="text/javascript">
	
		$(function () {
	    	$('#datetimepickerFrom').datetimepicker({
	    		showClear: true,
	    		showClose: false,
	    		format: 'MM/DD/YYYY',
	    		ignoreReadonly : true
	    	});
	    	$('#datetimepickerTo').datetimepicker({
	    		useCurrent: false,
	    		showClear: true,
	    		showClose: false,
	    		format: 'MM/DD/YYYY',
	    		ignoreReadonly : true
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
	    	
	    	$('#item').multiselect({
	    		buttonWidth: '100%',
	    		nonSelectedText: 'Select Item',
	    	});
	    	
	    	
	    	var chart = Highcharts.chart('container', {
   		        chart: {
   		            type: 'spline'
   		        },
   		        title: {
   		            text: 'Product stock quantity'
   		        },
//    		        subtitle: {
//    		            text: 'May 31 2016 and and June 1 2016'
//    		        },
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
//    		});
			
	    	
	    	
	    	$('#btnGenerate').click(function(){
	    		
	    		var item = $('#item').val();
	    		var elements = $('#elements').val();
	    		var dtpFrom = $('#dtpFrom').val();
	    		var dtpTo = $('#dtpTo').val();
	    		var itemDescription = $('#item option:selected').text();
	    		
	    		
	    		if(checkValidations(item, elements, dtpFrom, dtpTo)){
	    			
		    		$.ajax({	
		    			url: "charts",
		    			method: "POST",
		    			data: {
		    				item : item,
// 		    				elements : elements.join(),
		    				dtpFrom : dtpFrom,
		    				dtpTo : dtpTo
		    			}
		    		}).done(function(data) {
		    			
		    			while(chart.series.length > 0)
		    			    chart.series[0].remove(true);
		    			
		    			$('#container').show();
		    	       	chart.addSeries({
		    	        	name: itemDescription,
		    	            data: data
		    	        });  
		    	       	chart.setTitle(null, { text: 'From  '+dtpFrom+'  To  '+dtpTo });
		    			
		    		}).fail(function()  {
		    		    alert("Sorry. Server unavailable. ");
		    		});
		    		
	    		}
	    			
	    	});
	    	
	    	
	    });
		
		
		
		
		function checkValidations(item, elements, dtpFrom, dtpTo){
// 			alert(item);
			if(item === undefined || item === null || item.length === 0){
				alert("Please select an Item");
				return false;
			}
			
// 			if(elements === undefined || elements === null || elements.length === 0){
// 				alert("Please select at least one type of chart");
// 				return false;
// 			}
			
			if(dtpFrom === undefined || dtpFrom === null || dtpFrom.length === 0){
				alert("Please select the date From");
				return false;
			}
			
			if(dtpTo === undefined || dtpTo === null || dtpTo.length === 0){
				alert("Please select the date To");
				return false;
			}
			
			
			return true;
		}
		
		
	</script>

</body>
</html>