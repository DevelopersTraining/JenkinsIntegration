
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<!-- <form action="form_action.asp">
  Radio Button: <input type="radio" id="myRadio" name="test"required>
  <input type="submit">
</form> -->

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title"> HexaStore, Welcome!</h1>
            <div class="account-wall">
                <img class="profile-img" src="images.jpg"
                    alt="">
                <form class="form-signin" action="loginServlet" method="post">
                <input type="text" class="form-control" placeholder="User Name" name="AdminId" required autofocus>
                <input type="password" name="Password" class="form-control" placeholder="Password" required>
                <p style="font-size: 16px"><input type="radio" name="user_type" value="dba"required>
                	DBA User</p>
				<p style="font-size: 16px"><input type="radio" name="user_type" value="other"required>
					Other Users</p>
				<input class="btn btn-lg btn-primary btn-block" type="submit" value="Log in" />
				<button class="btn btn-lg btn-primary btn-block" type="reset" value="Cancel">Cancel</button></p>
                 
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
                <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            <%if(request.getAttribute("loginError") != null){%>
                	<span style="color:red; font-size=12px" ><%= request.getAttribute("loginError").toString() %></span>
            <%} %>    
            </div>
        </div>
    </div>
</div>
</body>
</html>