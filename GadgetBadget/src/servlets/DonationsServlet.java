package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it19132938.DbUtill;


@WebServlet("/DonationsServlet")
public class DonationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name= request.getParameter("name");
		String email=request.getParameter("email");
		String amount=request.getParameter("amount");
		String cardNumber =request.getParameter("cardNumber");
		String CVC=request.getParameter("CVC");
		
		boolean isTrue;
		
		isTrue=DbUtill.insertDonation(name, email, amount, cardNumber, CVC);
		
		if(isTrue==true) {
			RequestDispatcher dis= request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis2= request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
