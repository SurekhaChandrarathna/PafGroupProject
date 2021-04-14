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
			Statement st = con.createStatement();
			st.executeUpdate("update products set name='"+name+"',category='"+category+"',Description='"+description+"',price='"+price+"',quantity='"+quantity+"',active='"+active+"' where ID='"+id+"'");
			
			if(active.equals("No")){
				
				st.executeUpdate("delete from products where ID='"+id+"'");
			}
			response.sendRedirect("AllProductEditProduct.jsp?msg=done");
			
		}catch(Exception e){
			
			System.out.println(e);

			response.sendRedirect("AllProductEditProduct.jsp?msg=wrong");

		}
%>