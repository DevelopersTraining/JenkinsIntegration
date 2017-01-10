<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <h1>Charts Generator</h1>
      </div>
    </div>

    <div class="container">
    	
    	<div class="row">
    	
    		<div class='col-sm-4'>
	        	<div class="form-group">
	        		<select id="example-getting-started" multiple="multiple">
					    <option value="cheese">New Items</option>
					    <option value="tomatoes">Deleted Items</option>
					    <option value="mozarella">Updated Items</option>
					</select>
	        	</div>
	        </div>
    	
	        <div class='col-sm-3'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepickerFrom'>
	                    <input type='text' class="form-control" placeholder="Date From"/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	        
	       	<div class='col-sm-3'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepickerTo'>
	                    <input type='text' class="form-control" placeholder="Date To"/>
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
	<script src="http://davidstutz.github.io/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	
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
	        
	    	
	    	$('#example-getting-started').multiselect({

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
//    		});
			
	    	
	    	
	    	$('#btnGenerate').click(function(){
	    		
	    		$.ajax({	
	    			url: "charts",
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