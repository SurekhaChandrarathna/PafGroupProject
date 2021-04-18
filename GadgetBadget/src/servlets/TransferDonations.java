package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it19132938.DbUtill;


@WebServlet("/TransferDonations")
public class TransferDonations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String donationID= request.getParameter("donationID");
		 boolean isTrue;
		 
		 isTrue = DbUtill.TransferDonations(donationID);
		 
		 if(isTrue== true)
		 {
			 RequestDispatcher dis = request.getRequestDispatcher("AdminDonations.jsp");
			 dis.forward(request, response);
		 }
		 else {
			 RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			 dis2.forward(request, response);
		 }
		
	}

}
