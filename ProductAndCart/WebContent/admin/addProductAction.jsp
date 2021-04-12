<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<% 
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String active = request.getParameter("active");
		
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into products values(?,?,?,?,?,?,?)");
			ps.setString(1,id);
			ps.setString(2,name);
			ps.setString(3,category);
			ps.setString(4,description);
			ps.setString(5,price);
			ps.setString(6,quantity);
			ps.setString(7,active);
			ps.executeUpdate();
		
			response.sendRedirect("AddProduct.jsp?msg=done");
			
		}catch(Exception e){
			
			System.out.println(e);

			response.sendRedirect("AddProduct.jsp?msg=notdone");

		}
%>