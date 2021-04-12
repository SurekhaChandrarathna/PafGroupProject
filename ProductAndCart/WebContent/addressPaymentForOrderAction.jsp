<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<%
	String email= session.getAttribute("email").toString();
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String mobile_number = request.getParameter("mobile_number");
	String payment_method = request.getParameter("payment_method");
	String transaction_id = "";
	transaction_id=request.getParameter("transaction_id");
	String status = "bill";
	
	try{
		Connection con = DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("update carts set address =?, city =? , mobile_number =?, order_date = now(),delivary_date= DATE_ADD(order_date, INTERVAL 7 DAY),payment_method=?,transaction_id = ?,status=? where email=? and address is NULL");

		ps.setString(1,address);
		ps.setString(2,city);
		ps.setString(3,mobile_number);
		ps.setString(4,payment_method);
		ps.setString(5,transaction_id);
		ps.setString(6,status);
		ps.setString(7,email);
		ps.executeUpdate();
		
		response.sendRedirect("bill.jsp");

	}catch(Exception e){
		
		System.out.println(e);
		
	}
	%>
	