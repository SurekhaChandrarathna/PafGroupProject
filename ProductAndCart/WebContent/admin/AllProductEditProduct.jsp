<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="AdminProductHome.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
	
		<%
		String msg=request.getParameter("msg");
	
		if("right".equals(msg))
		{
		
		%>
			<h1> Successfully Updated the Product! </h1>
	
		<%  } %>
	
		<%
			if("wrong".equals(msg))
			{
	
		%>
			<h1> UnSuccessful! </h1>
	
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
					<th >Status</th>
					<th scope="col">Edit Product Details</th>
					
			</tr>
			</thead>
			
			<tbody>
			
			<%
				try{
					Connection con = DBConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs= st.executeQuery("Select * from products");
					
					while(rs.next()){
						
						
				
			%>
			<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td> <a href="editProduct.jsp?ID=<%=rs.getString(1) %>">Edit</a></td>
					
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