 <%@ page import="java.io.*,java.util.ArrayList,com.org.bean.Item,java.util.Iterator"%> 
<html>
<body>
<table border=1>
<tr>
<th>Id</th>
<th>Name</th>
<th>Description </th>
<th>Quantity </th>
</tr>
<%  
	ArrayList<Item> stockList= (ArrayList<Item>) request.getAttribute("stockList");
	System.out.println(stockList);
    for(Item items:stockList){
        %>
        <tr>
        <td> <%=items.getItemId()%> </td>
        <td > <%= items.getName() %> </td>
        <td > <%=items.getDescription()%> </td>
        <td > <%=items.getQuantity()%> </td>
        </tr>
<% }%>
</table>
</body>
</html>
