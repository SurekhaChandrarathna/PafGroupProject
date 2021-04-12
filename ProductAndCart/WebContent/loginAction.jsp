<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>

<% 
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if("admin@gmail.com".equals(email) && "admi".equals(password)){
			
			session.setAttribute("email", email);
			response.sendRedirect("admin/AdminProductHome.jsp");
			
		}
		else{
			
			int z = 0;
			
		
		try{
			Connection con = DBConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("Select * from user where email ='"+email+"' and password = '"+password+"'");
			
			while(rs.next()){	
				z =1;
				session.setAttribute("email",email);
				response.sendRedirect("UserAddProductCart.jsp");
				
			}
			if(z == 0)
				response.sendRedirect("login.jsp?msg=notexist");
			
		}catch(Exception e){
			
			System.out.println(e);

			response.sendRedirect("login.jsp?msg=invalid");

		}
		}
%>