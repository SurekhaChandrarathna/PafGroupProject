<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<%
	String email= session.getAttribute("email").toString();
	String id = request.getParameter("ID");
	int product_price = 0;
	int product_total = 0;
	int cart_total = 0;
	int quantity = 1;
	
	
	int z=0;
	try{
		Connection con = DBConnection.getCon();
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("select *from products where ID = '"+id+"'");
		while(rs.next())
		{
			product_price = rs.getInt(6);
			product_total = product_price;
			
		}
		ResultSet rs1= st.executeQuery("select * from carts where product_id = '"+id+"' and email = '"+email+"' and  address is NULL");

		while(rs1.next())
		{
			cart_total = rs1.getInt(5);
			cart_total=cart_total+product_total;
			quantity=rs1.getInt(3);
			quantity=quantity+1;
			z=1;
		}
		if(z == 1 )
		{
			st.executeUpdate("update carts set total ='"+cart_total+"',quantity='"+quantity+"' where product_id='"+id+"' and email ='"+email+"' and address is null");
			response.sendRedirect("UserAddProductCart.jsp?msg=exist");
		}
		
		if(z==0)
		{
			PreparedStatement ps=con.prepareStatement("insert into carts(email,product_id,quantity,price,total)values(?,?,?,?,?)");
			ps.setString(1,email);
			ps.setString(2,id);
			ps.setInt(3,quantity);
			ps.setInt(4,product_price);
			ps.setInt(5,product_total);
			
			ps.executeUpdate();
			response.sendRedirect("UserAddProductCart.jsp?msg=added");
		}
	}catch(Exception e){
		
			System.out.println(e);
			response.sendRedirect("UserAddProductCart.jsp?msg=invalid");
	}
%>