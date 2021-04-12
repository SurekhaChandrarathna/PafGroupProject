<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="UserProductHome.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Products To The Cart</title>
</head>
<body>
	
		<%
		String msg=request.getParameter("msg");
	
		if("added".equals(msg))
		{
		
		%>
			<h1>  Product Added Successfully! </h1>
	
		<%  } %>
	
		<%
			if("exist".equals(msg))
			{
	
		%>
			<h1> The Product Already Exist In Your Cart! Quantity Increased! </h1>
	
		<%  } %>
		<%
			if("invalid".equals(msg))
			{
	
		%>
			<h1> something went wrong! </h1> 
	
		<%  } %>
			<table>
			<thead>
			<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Description</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Add To Cart</th>
					
			</tr>
			</thead>
			
			<tbody>
			
			<%
				try{
					Connection con = DBConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs= st.executeQuery("Select * from products where active = 'Yes'");
					
					while(rs.next()){
						
						
				
			%>
			<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td> <a href="addToCartAction.jsp?ID=<%=rs.getString(1)%>">Add To Cart</a></td>
					
			</tr>
			<%}
				}catch(Exception e){
					System.out.println(e);
				}
			
			%>		
			</tbody>
		</table>
		<br><br><br>
		
		
		

</body>
</html>