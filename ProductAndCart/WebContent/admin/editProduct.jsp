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

	<h2><a href="AllProductEditProduct.jsp">Back</a></h2>

		<%
		String id=request.getParameter("ID");
	
	
		try{
			
			Connection con = DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("Select * from products where ID='"+id+"'");

			while(rs.next()){
		
	 %>
	 <center><div class="div1">
		<form action ="EditProductAction.jsp"  method= "post"><br><b>
			<div class="card">
 				 <img src="dd.png"  style="width:50%">
  					<div class="container">
    		<h3><b><i>Product ID :-  <%out.println(id); %><i></b></h3> 
  					</div>
  			</div>
			
			<br><br>
			<input type ="hidden" name = "id" value ="<%out.println(id);%>" required><br><br>
			
			Item Name<br>  <input type ="text" name = "name" value ="<%=rs.getString(2) %>" required><br><br>
			Item Category<br> <input type ="text" name = "category" value ="<%=rs.getString(3) %>" required><br><br>
			Item Description<br> <input type ="text" name = "description" value ="<%=rs.getString(4) %>" required><br><br>
			Item Price<br> <input type ="text" name = "price" value ="<%=rs.getString(5) %>" required><br><br>
			Quantity<br> <input type ="text" name = "quantity"  value ="<%=rs.getString(6) %>" required><br><br>
		    Item Activation<br> <select  name = "active"  value ="<%=rs.getString(7) %>" required>
							
							<option value = "Yes"> Yes </option>
							<option value = "No"> No </option>
							</select><br><br>
			<button class="button1"><span>Update Details </span></button>
		</b>
			    
		</form>
		</div></center>
		

	 <%
	 }
		}catch(Exception e){
			System.out.println(e);
		}
	 %>
</body>
</html>