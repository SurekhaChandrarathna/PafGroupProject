<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<%
	String ID = request.getParameter("ID");
	String email = request.getParameter("email");
	String status="Cancel";
	
	try{
		Connection con = DBConnection.getCon();
		
		Statement st = con.createStatement();
		st.executeUpdate("update carts set status='"+status+"' where product_id='"+ID+"' and email='"+email+"' and address is not NULL");
		
	
		response.sendRedirect("ordersReceived.jsp?msg=cancel");

		}catch(Exception e){
			
			System.out.println(e);
			response.sendRedirect("ordersReceived.jsp?msg=wrong");
			
		}
	%>