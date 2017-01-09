<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.ArrayList,com.org.bean.User,java.util.Iterator"%> 


<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #FF0000;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<body style="background-color:powderblue;">
<header>
	<h1 align="center">
		<font color="blue">WELCOME DATABASE ADMINISTRATOR</font>
	</h1>
	<center>
	 <FORM action="userServlet" method="post">
	<table border=1>
<tr>
<th>Id</th>
<th>Name</th>
<th>RoleName </th>
</tr>
<%  
	ArrayList<User> stockList= (ArrayList<User>) request.getAttribute("userList");
	System.out.println(stockList);
    for(User users:stockList){
 %>
        <tr>
        <td><input type="radio" name="userId"   value="<%=users.getUserId()%>"/></td>
        <td > <%= users.getUserName() %> </td>
        <td > <%=users.getRoleName()%> </td>
        </tr>
<% }%>
</table>
 
<BR/>
<input type="submit" name= "adminRequest" value="DeleteUser"/>
</FORM>
<br>
<FORM action="UserAdminRegistration.jsp" >
<input type="submit" value="AddUser"/> 
</FORM>

</body>
</html>