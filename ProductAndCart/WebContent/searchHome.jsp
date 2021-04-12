<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="UserProductHome.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Item</title>
</head>
<body>


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
				int z = 0;
				try{
					String search = request.getParameter("search");
					
					Connection con = DBConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs= st.executeQuery("Select * from products where name like '%"+search+"%' or category like '%"+search+"%' and active= 'Yes'");
					
					while(rs.next()){
							z= 1;	
						
				
			%>
			<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td> <a href="addToCartAction.jsp?ID=<%=rs.getString(1) %>">Add To Cart</a></td>
					
			</tr>
			<%}
				}catch(Exception e){
					System.out.println(e);
				}
			
			%>		
			</tbody>
		</table>
		
			<%
				if(z==0){
			%>
			
			<h1>Nothing To Show!!</h1>
			<%} %>
		<br><br><br>
</body>
</html>