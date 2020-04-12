package com.cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int p_id = Integer.parseInt(request.getParameter("product_id"));
		
		String useremail = (String)request.getSession(false).getAttribute("useremail");
		
		if(request.getSession(false).getAttribute("useremail")!=null){
			
			Dao dao = new Dao();
			if(dao.addToCart(p_id, useremail)) {
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("index.jsp");
			}
			
		}else {
			response.sendRedirect("login.jsp");
		}
		
		//PrintWriter out = response.getWriter();
		//out.print(p_id);
		
	}

}
