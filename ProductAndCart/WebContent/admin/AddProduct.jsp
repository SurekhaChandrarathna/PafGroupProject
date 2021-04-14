<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>

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
	
				<%
		String msg = request.getParameter("msg");
		if("done".equals(msg))
		{
	
		%>
		
			  <div class="modal-content" >
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>Message</h2>
			    </div>
			    <div class="modal-body">
			      <p><b>The Product Added To The System Successfully!</p>
			    </div>
			    
			  </div>
			
		<%  } %>
	
		<%
			if("notdone".equals(msg))
			{

		%>
			
			  <div class="modal-content" >
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>Message</h2>
			    </div>
			    <div class="modal-body">
			      <p><b>Unsuccessfull!!</p>
			    </div>
			    
			  </div>
			
	
		<%  } %>	
					    
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

		<center><div class="div1">
		<form action ="addProductAction.jsp"  method= "post"><br><b>
			<div class="card">
 				 <img src="dd.png"  style="width:50%">
  					<div class="container">
    		<h3><b><i>Product ID :-  <%out.println(id); %><i></b></h3> 
  				</div>
			</div>
			<br><br>
			Item Name<br> <input type ="text" name = "name" placeholder = "Enter the item name.." required><br><br>
			Item Category<br> <input type ="text" name = "category" placeholder = "Enter the item category.." required><br><br>
			Item Description<br> <input type ="text" name = "description" placeholder = "Enter the item description.." required><br><br>
			Item Price<br> <input type ="text" name = "price" placeholder = "Enter the item price.." required><br><br>
			Quantity<br> <input type ="text" name = "quantity" placeholder = "Enter the quantity of the item.." required><br><br>
			Item Activation<br> <select  name = "active" required>
							<option value = "">  </option>
							<option value = "Yes"> Yes </option>
							<option value = "No"> No </option>
							</select><br><br>
			<button class="button1"><span>Add Details </span></button>
				    
		</form>
		</div></center>
		
</body>
</html>