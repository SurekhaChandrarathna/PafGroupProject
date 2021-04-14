package servletsIT19132938;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it19132938.DbUtill;
import it19132938.Projects;

@WebServlet("/GetProjects")
public class GetProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("UserEmail");
		
		boolean isTrue;
		
		try {
			
			List<Projects> Showprojects = DbUtill.getProjects(email);
			request.setAttribute("Showprojects", Showprojects);
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("MyProjects.jsp");
		dis.forward(request, response);
		
	}

}
