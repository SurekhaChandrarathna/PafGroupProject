package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it19132938.DbUtill;
import it19132938.Donations;


@WebServlet("/DonationList")
public class DonationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List<Donations> getDonationList = DbUtill.getDonationList();
			request.setAttribute("getDonationList", getDonationList);
					
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("AdminDonations.jsp");
		dis.forward(request, response);
		
	}

}
