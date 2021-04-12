<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>


<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>

	<%
	
		String email=session.getAttribute("email").toString();
		
		try{
			
			int total=0;
			int sno =0;
			
		
			Connection con = DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("Select sum(total) from carts where email = '"+email+"' and status='bill'");
			
			while(rs.next()){
				total = rs.getInt(1);
			}
	      	ResultSet rs2=st.executeQuery("select *from carts ");

			while(rs2.next())
			{
	
	%>

						<h3>Online shopping Bill (BTech Days)</h3>
						<hr>
					
						<div class="right-div-right"><h3>Email:<%out.println(email); %>  </h3></div>
						<div class="right-div"><h3>Mobile Number: <%=rs2.getString(8)%> </h3></div>  
						
						<div class="left-div"><h3>Order Date: <%=rs2.getString(9)%>  </h3></div>
						<div class="right-div-right"><h3>Payment Method: <%=rs2.getString(11)%> </h3></div>
						<div class="right-div"><h3>Expected Delivery: <%=rs2.getString(10)%> </h3></div> 
						
						<div class="left-div"><h3>Transaction Id:<%=rs2.getString(12)%>  </h3></div>
						<div class="right-div-right"><h3>City:<%=rs2.getString(7)%>  </h3></div> 
						<div class="right-div"><h3>Address:<%=rs2.getString(6)%>  </h3></div> 
						
						<div class="left-div"><h3>State:  <%=rs2.getString(13)%></h3></div>
					
						<hr>
	
						<% break;} %>
							
							<br>
							
						<table id="customers">
						<h3>Product Details</h3>
						  <tr>
						    <th>S.No</th>
						    <th>Product Name</th>
						    <th>category</th>
						    <th>Price</th>
						    <th>Quantity</th>
						     <th>Sub Total</th>
						  </tr>
						  
						  <%
						  
							ResultSet rs1= st.executeQuery("select *from carts inner join products where carts.product_id=products.ID and carts.email='"+email+"' and carts.status='bill'");
						  	
						  	while(rs1.next())
						  	{	
						  		sno=sno+1;
						  	
						  
						  %>
						  <tr>
						    <td><%out.println(sno); %></td>
						    <td><%=rs1.getString(15) %></td>
						    <td><%=rs1.getString(3) %></td>
						    <td><%=rs1.getString(6) %></td>
						    <td><%=rs1.getString(10) %> </td>
						     <td><%=rs1.getString(12) %></td>
						  </tr>
						
						<%} %>
						</table>
						<h3>Total: </h3>
						<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
						<a onclick="window.print();"><button class="button right-button">Print</button></a>
						<br><br><br><br>

<%
		}catch(Exception e){
			System.out.println(e);
		}
%>
</body>
</html>