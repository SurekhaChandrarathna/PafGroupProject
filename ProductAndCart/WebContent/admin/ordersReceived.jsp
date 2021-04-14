<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: Black; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<br><br>
<%
				String msg=request.getParameter("msg");
				
				if("cancel".equals(msg))
				{
				
				%>
				<div class="modal-content" >
				    <div class="modal-header">
				      <span class="close">&times;</span>
				      <h2>Message</h2>
				    </div>
				    <div class="modal-body">
				      <p><b>Order Canceled Successfully!</p>
				    </div>
				    
				  </div>			
				<%  } %>
			
				<%
					if("delivered".equals(msg))
					{
			
				%>
				 <div class="modal1-content" >
				    <div class="modal1-header">
				      <span class="close">&times;</span>
				      <h2>Message</h2>
				    </div>
				    <div class="modal1-body">
				      <p><b>Order Delivered Successfully!</p>
				    </div>
				    
				  </div>
		
			<%  } %>
				<%
						if("invalid".equals(msg))
						{
				
					%>
<					h3 class="alert">Some thing went wrong! Try Again!</h3>			
			<%  } %>

			<table id="customers">
			          <tr>
			          <th>Mobile Number</th>
			            <th scope="col">Product Name</th>
			            <th scope="col">Quantity</th>
			            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
			            <th>Address</th>
			            <th>City</th>
			            <th scope="col">Order Date</th>
			             <th scope="col">Expected Delivery Date</th>
			             <th scope="col">Payment Method</th>
			              <th scope="col">T-ID</th>
			              <th scope="col">Status</th>
			              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
			              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
			          </tr>
			        
			   <%
				   int sno =0;
	
					try{
						Connection con = DBConnection.getCon();
						Statement st = con.createStatement();
						ResultSet rs1= st.executeQuery("select *from carts inner join products where carts.product_id=products.ID  and carts.order_date is not NULL and carts.status='processing'");
					
						while(rs1.next())
						{
			   %>
			          <tr>
			            <td><%=rs1.getString(8) %></td>
			            <td><%=rs1.getString(15) %></td>
			            <td><%=rs1.getString(16) %></td>
			            <td><i class="fa fa-inr"><%=rs1.getString(5) %></i>  </td>
			            <td><%=rs1.getString(6) %></td>
			            <td><%=rs1.getString(7) %></td>
			            <td><%=rs1.getString(9) %></td>
			            <td><%=rs1.getString(10) %></td>
			            <td><%=rs1.getString(11) %></td>
			            <td><%=rs1.getString(12) %></td>
			            <td><%=rs1.getString(13) %></td>
			            <td><a href="cancelOrdersAction.jsp?ID=<%=rs1.getString(2)%>&email=<%=rs1.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>
			            <td><a href="deliveredOrdersAction.jsp?ID=<%=rs1.getString(2)%>&email=<%=rs1.getString(1)%>">Deliver <i class='fas fa-dolly'></i></i></a></td>
			            </tr>
			         <%	}
					}catch(Exception e){
						System.out.println(e);
					}
					
					%>
			        </table>
			      <br>
			      <br>
			      <br>
			
			</body>
</html>