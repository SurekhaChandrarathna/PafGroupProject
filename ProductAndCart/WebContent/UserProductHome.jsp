<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet"
   type = "text/css"
   href = "cart.css" />
<title>Online Shopping Cart</title>
  
</head>
	<div>
						<ul><b>
						
						
						
							  <li><a class="" href="myCart.jsp">My Cart</a></li><br><br>
							  <li><a href="myOrders.jsp">My Orders</a></li><br><br>
							  <li><a href="messageUs.jsp">message Us</a></li><br><br>
							  <li><a href="#contact">Logout</a></li>
							  
							  <% String email=session.getAttribute("email").toString(); %>
							  <a href=""><%out.println(email); %></a>
					    </b>
					    </ul>
		</div>			    
					    <form action="searchHome.jsp" method="post">
					    	<input type = "text" placeholder="Search Item" name= "search">
					    	<button type = "Submit"> Search</button>
					    
					    </form>
<body>
</body>
</html>