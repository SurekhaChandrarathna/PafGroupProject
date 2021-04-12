<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="AdminProductHome.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
   type = "text/css"
   href = "cart.css" />

<meta charset="ISO-8859-1"u>
<title>Add New product</title>
</head>
<body>
	
					
					    
		<%--Get id and display the interface --%>
		<%
		int id=1;
		try{
			
			Connection con=DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("Select max(id) from products");
			
			while(rs.next())
			{
				id=rs.getInt(1);
				id=id+1;
			}
		}catch(Exception e){
			
			
		}
		
		%>
		
		
	
		
		<%--Create form to add products --%>		    
		<form action ="addProductAction.jsp"  method= "post"><br>
		<div class="mb-3">
			<h3> Product ID :<%out.println(id); %></h3>	
		
			<input type ="hidden" name = "id" value="<%out.println(id); %>"><br><br>
			Item Name <input type ="text" name = "name" placeholder = "Enter the item name.." required><br><br>
			Item Category <input type ="text" name = "category" placeholder = "Enter the item category.." required><br><br>
			Item Description <input type ="text" name = "description" placeholder = "Enter the item description.." required><br><br>
			Item Price <input type ="text" name = "price" placeholder = "Enter the item price.." required><br><br>
			Quantity <input type ="text" name = "quantity" placeholder = "Enter the quantity of the item.." required><br><br>
			Item Activation <select  name = "active" required>
							<option value = "">  </option>
							<option value = "Yes"> Yes </option>
							<option value = "No"> No </option>
							</select><br><br>
					
		</div>	
		<button><i>Add Details</i></button>	
		</form>
	
		<%
		String msg = request.getParameter("msg");
		if("done".equals(msg))
		{
	
		%>
			<h1> Successfully Added the Product! </h1>
	
		<%  } %>
	
		<%
			if("notdone".equals(msg))
			{

		%>
			<h1> UnSuccessful! </h1>
	
		<%  } %>
</body>
</html>