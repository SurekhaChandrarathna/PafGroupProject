  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>
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
				try{
					Connection con = DBConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs= st.executeQuery("Select * from products");
					
					while(rs.next()){
						
						
				
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
		</table></center>
		<br><br><br>
<!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- bootstrap -->
	
		
</body>
</html>