<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>


<%
	String email= session.getAttribute("email").toString();
	String product_id = request.getParameter("ID");
	
	try{
		Connection con = DBConnection.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("delete from carts where email = '"+email+"' and product_id ='"+product_id+"' and address is null");
		
		response.sendRedirect("myCart.jsp?msg=removed");

		
	}catch(Exception e){
		
			System.out.println(e);
	}
%>