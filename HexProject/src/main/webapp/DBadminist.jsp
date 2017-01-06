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
<title>Insert title here</title>
<!--  <SCRIPT language="javascript">
	function add(type) {

		//Create an input type dynamically.
		var element = document.createElement("input");

		//Assign different attributes to the element.
		element.setAttribute("type", type);
		element.setAttribute("value", type);
		element.setAttribute("name", type);

		var foo = document.getElementById("fooBar");

		//Append the element in page (in span).
		foo.appendChild(element);

	}
</SCRIPT>
-->
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
<!--<SELECT name="element">
	<OPTION value="button">Button</OPTION>
	<OPTION value="text">Textbox</OPTION>
	<OPTION value="radio">Radio</OPTION>
</SELECT>
<input type="hidden" value="deleteUser" name="requestType"> 
<INPUT type="button" value="Add" onclick="UserAdminRegistration.jsp"/>-->
<input type="submit" value="Delete" name="Delete User">
<span id="fooBar">&nbsp;</span>

</FORM>
  </center>
</header>
</table>
<p></p>
<input type="submit" value="Add User"/> 
<button type="reset" value="Cancel">Delete User</button></p>
</body>
</html>