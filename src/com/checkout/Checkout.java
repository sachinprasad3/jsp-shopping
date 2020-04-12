package com.checkout;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String payMode = (String)request.getSession(false).getAttribute("payMethod");
		
		String fullAddress = (String)request.getSession(false).getAttribute("fullAddress");
		String addressMobileNo = (String)request.getSession(false).getAttribute("addressMobileNo");
		String useremail = (String)request.getSession(false).getAttribute("useremail");
		
		
		/* PrintWriter out = response.getWriter();
		out.println(payMode);
		out.println(fullAddress);
		out.println(addressMobileNo); */
		
		Dao dao = new Dao();
		
		if(dao.checkout(fullAddress,addressMobileNo,payMode,useremail)) {
			
			response.sendRedirect("ViewCart.jsp");
		}else {
			response.sendRedirect("ViewCart.jsp");
		}
		
		
		
		
	}

}
