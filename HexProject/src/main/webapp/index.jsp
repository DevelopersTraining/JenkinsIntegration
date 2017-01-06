 <%@ page import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%> 
<html>
<body>
<h2>Hello World!</h2>
<h2> How are you?!</h2>
<table border=1>
<tr>
<th>Id</th>
<th>Name</th>
<th>Description </th>
<th>Quantity </th>
</tr>
<%  
	Long itemId = 0l;
	String name = null;
	String description = null;
	Long quantity = 0l;
	ArrayList<Item> stockList= (ArrayList<Item>) request.getAttribute("stockList");
    Iterator<Item> iter = stockList.iterator();
    while(iter.hasNext()){
        Item items = iter.next();
        %>
        <tr>
        <td><input type="radio" name="itemId"   value="<%=itemId%>"/></td>
        <td > <%= name %> </td>
        <td > <%=description%> </td>
        <td > <%=quantity%> </td>
        </tr>
<% }%>
</table>
</body>
</html>
