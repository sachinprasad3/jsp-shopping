package com.payment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaymentMethod
 */
@WebServlet("/PaymentMethod")
public class PaymentMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paymentType = request.getParameter("paymentMethod");
		String cod = "COD";
		//String paymentType = null;
		
		if(paymentType == cod) {
			paymentType = "Pay on delivery";
		}
		
		HttpSession paySession = request.getSession();
		paySession.setAttribute("payMethod", paymentType);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("CheckoutConfirm.jsp");
        //dispatcher.forward(request, response);
		
			response.sendRedirect("checkoutConfirm.jsp");
		
	}

}
