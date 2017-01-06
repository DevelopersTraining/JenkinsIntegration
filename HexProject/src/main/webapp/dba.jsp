<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.org.bean.User" %>

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
<SCRIPT language="javascript">
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
</head>
<body>
<body style="background-color:powderblue;">
<header>
	<h1 align="center">
		<font color="blue">WELCOME DATABASE ADMINISTRATOR</font>
	</h1>
	<center>
	<table>
	
  <tr>
  	<th>S. No.</th>
    <th>User Name</th>
    <th>Role Name</th>
    <th>Registration Date</th>
  </tr>
  <% 
   ArrayList<User> userlist = new ArrayList<User>();
  
  	if(request.getAttribute("userList")!=null){
  		userlist = (ArrayList<User>)request.getAttribute("userList");
  	}
  
  int sno = 1;
  for(User u: userlist)
	  {
  %>
  <tr>
  	<th><%= sno %></th>
  	<th><%=u.getUserName()%></th>
  	<th><%=u.getRoleName()%></th>
  	<th><%=u.getRegDate()%></th>
  </tr>
  <% 
  sno++;
	  }%>
  <p></p>
  <FORM>
<H2>Dynamically add element in form.</H2>
Select the element and hit Add to add it in form.
<BR/>
<SELECT name="element">
	<OPTION value="button">Button</OPTION>
	<OPTION value="text">Textbox</OPTION>
	<OPTION value="radio">Radio</OPTION>
</SELECT>

<INPUT type="button" value="Add" onclick="add(document.forms[0].element.value)"/>

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