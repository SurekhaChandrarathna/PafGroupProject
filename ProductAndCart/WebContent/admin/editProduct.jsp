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

	<h2><a href="AllProductEditProduct.jsp">Back</a></h2>
				    
		
		<%
		String id=request.getParameter("ID");
	
	
		try{
			
			Connection con = DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("Select* from products where ID='"+id+"'");

			while(rs.next()){
		
	 %>
	 <form action ="EditProductAction.jsp"  method= "post"><br>
	 		<input type ="hidden" name = "id" value="<%=rs.getString(1) %>"><br><br>
	        Enter Name <input type ="text" name = "name" value ="<%=rs.getString(2) %>" required><br><br>
		    Item Category <input type ="text" name = "category" value ="<%=rs.getString(3) %>" required><br><br>
	        Item Description <input type ="text" name = "description" value ="<%=rs.getString(4) %>" required><br><br>
			Item Price <input type ="text" name = "price" value ="<%=rs.getString(5) %>" required><br><br>
			Quantity <input type ="text" name = "quantity"  value ="<%=rs.getString(6) %>" required><br><br>
			Item Activation <select  name = "active"  value ="<%=rs.getString(7) %>" required>
							<option value = "">  </option>
							<option value = "Yes"> Yes </option>
							<option value = "No"> No </option>
							</select><br><br>
							
			<button>Save</button>
	</form>
	 <%
	 }
		}catch(Exception e){
			System.out.println(e);
		}
	 %>
</body>
</html>