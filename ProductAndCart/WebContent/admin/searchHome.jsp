<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Item</title>
</head>
<body>


			<center><table id="customers">
			
			<tr>
					<th scope="col"  class="bg-info">ID</th>
					<th scope="col"  class="bg-info">Name</th>
					<th scope="col"  class="bg-info">Category</th>
					<th scope="col"  class="bg-info">Description</th>
					<th scope="col"  class="bg-info">Quantity</th>
					<th scope="col"  class="bg-info">Price</th>
					<th  class="bg-info">Status</th>
					<th scope="col"  class="bg-info">Edit Product Details</th>
					
			</tr>
			
			
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
					<b><td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td> <button class="button button2"  ><a href="editProduct.jsp?ID=<%=rs.getString(1) %>"><b>Edit</b></a></button></td>
					
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