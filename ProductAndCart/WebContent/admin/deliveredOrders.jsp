
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader2.jsp" %><html>
<head>

<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

<br><br><br>
<center>

<table>
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
          </tr>
                 <%
	
					try{
						Connection con = DBConnection.getCon();
						Statement st = con.createStatement();
						ResultSet rs= st.executeQuery("select *from carts inner join products where carts.product_id=products.ID  and carts.order_date is not NULL and carts.status='Delivered'");
					
						while(rs.next())
						{
			   %>
        
          <tr>
          			    <td><%=rs.getString(8) %></td>
			            <td><%=rs.getString(15) %></td>
			            <td><%=rs.getString(16) %></td>
			            <td><i class="fa fa-inr"><%=rs.getString(5) %></i>  </td>
			            <td><%=rs.getString(6) %></td>
			            <td><%=rs.getString(7) %></td>
			            <td><%=rs.getString(9) %></td>
			            <td><%=rs.getString(10) %></td>
			            <td><%=rs.getString(11) %></td>
			            <td><%=rs.getString(12) %></td>
			            <td><%=rs.getString(13) %></td>
              </tr>
         <%	}
					}catch(Exception e){
						System.out.println(e);
					}
					
			%>
        </table></center>
      <br>
      <br>
      <br>

</body>
</html>