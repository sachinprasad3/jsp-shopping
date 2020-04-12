package com.admin.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Dao dao = new Dao();
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		if(dao.adminAuth(email,pass)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("adminEmail", email);
			response.sendRedirect("admin/dashboard.jsp");
		}
		else {
			request.setAttribute("msg", "email or password invalid");
			RequestDispatcher rd = request.getRequestDispatcher("admin/login.jsp");
			rd.include(request, response);
			//response.sendRedirect("login.jsp");
		}
	}

}
