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
			
			
			<%
				try{
					Connection con = DBConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs= st.executeQuery("Select * from products where active = 'Yes'");
					
					while(rs.next()){
						
						
				
			%>


			<div class="row">
			  <div class="column">
			    <div class="card">
			     
					  <h1>Product ID :- <%=rs.getString(1) %></h1>
					  <h1>Item Name :- <%=rs.getString(2) %> </h1>
					  <h1>Category  :- <%=rs.getString(3) %> </h1>
					  <h1><%=rs.getString(4) %> </h1>
					  <p class="price">Price:-  Rs.<%=rs.getString(6) %></p>
					  
					 <button class="button button2" href="addToCartAction.jsp?ID=<%=rs.getString(1) %>" ><b></b>Add to Cart</button>
					  
			    </div>
			  </div>
						
			
			<%}
				}catch(Exception e){
					System.out.println(e);
				}
			
			%>		
		
		<br><br><br>
		
		
		

</body>
</html>