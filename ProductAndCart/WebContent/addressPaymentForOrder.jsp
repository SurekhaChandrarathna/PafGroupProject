
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

	<script>
		if(window.history.forward(1) !=null)
			
			window.history.forward(1);
	</script>
</head>
<body>
<br>
<table>
<thead>
		<%
		
			String email=session.getAttribute("email").toString();
		 	
			 int total=0;
			 int sno =0;
		
		try{
			Connection con = DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs2= st.executeQuery("Select sum(total) from carts where email = '"+email+"' and address is null");
			
			while(rs2.next()){
				total = rs2.getInt(1);
			}
	
	%>
          <tr>
     
							
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
      <%
      	ResultSet rs=st.executeQuery("select *from products inner join carts on products.ID=carts.product_id and carts.email='"+email+"' and carts.address is NULL");
      
      	while(rs.next())
      	{
      %>
          <tr>
          	<% sno = sno+1; %>
          	 <td><%out.println(sno); %></td>
             <td><%=rs.getString(2) %></td>
             <td><%=rs.getString(3) %></td>
             <td><i class="fa fa-inr"></i><%=rs.getString(6) %></td>
             <td><%=rs.getString(10) %> </td>
             <td><i class="fa fa-inr"></i> <%=rs.getString(12) %></td>
           </tr>
           
           <%}
      	
      
      	%>
  
        </tbody>
          </table>
      	
			<div>
				<form action = "addressPaymentForOrderAction.jsp" method="post">
					 
					 Enter Address<input type ="text" name ="address"  placeholder="Enter the address.." required><br><br>
					 Enter city<input type ="text" name ="city" placeholder="Enter the city..." required><br><br>
					 Mobile Number<input type ="text" name ="mobile_number"  placeholder="Enter the mobile number.." required><br><br>
					 Select way of Payment<select name = "payment_method"><br><br>
					    <option value=""></option>
					    <option value="Cash On Delivery(COD)">Cash On Delivery(COD)</option>
					 	<option value="Online Payment">Online Payment</option>
					 </select><br><br>
					 Pay online on this btechdays@pay.com<input type ="text" name ="transaction_id"  placeholder ="Enter the transaction id.." ><br><br>
					

			    	<button type="submit">Proceed to Generate Bill & Save</button>
				
				</form>
			</div>
				<%	
	        	
	        	
      	                }
						catch(Exception e)
						{
							System.out.println(e);
						}
				%>
		
				
				      <br>
				      <br>
				      <br>

</body>
</html>