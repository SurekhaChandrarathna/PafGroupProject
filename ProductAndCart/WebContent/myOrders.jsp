<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="UserProductHome.jsp" %>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>

		<%
			int sno =0;

		try{
			Connection con = DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs1= st.executeQuery("select *from carts inner join products where carts.product_id=products.ID and carts.email='"+email+"' and carts.order_date is not NULL ");
			
			while(rs1.next()){
				sno = sno+1;
		
		
		
		%>
          <tr>
         		<td><%out.println(sno); %></td>
				<td><%=rs1.getString(15) %></td>
				<td><%=rs1.getString(16) %></td>
				<td><%=rs1.getString(19) %></td>
				<td><%=rs1.getString(3) %> </td>
			    <td><%=rs1.getString(5) %></td>
                <td><%=rs1.getString(9) %></td>
				<td><%=rs1.getString(10) %></td>
				<td><%=rs1.getString(11) %> </td>
			    <td><%=rs1.getString(13) %></td>
            </tr>
         <%
			}
			}catch(Exception e){
				System.out.println(e);
			}
         
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>