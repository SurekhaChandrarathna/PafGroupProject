<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<%
	String email= session.getAttribute("email").toString();
	
	String status = "processing";
	
	try{
		Connection con = DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("update carts set status=? where email=? and status='bil'");
		ps.setString(1,status);
		ps.setString(2,email);

		ps.executeUpdate()
;		
		response.sendRedirect("UserAddProductCart.jsp");

	}catch(Exception e){
		
		System.out.println(e);
		
	}
	%>
	