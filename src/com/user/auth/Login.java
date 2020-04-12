package com.user.auth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Dao dao = new Dao();
		
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		if(dao.login(email,pass)) {
			String userName = dao.getUserName(email);
			HttpSession session = request.getSession();
			session.setAttribute("useremail", email);
			session.setAttribute("userName", userName);
			//RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
			response.sendRedirect("index.jsp");
			
		}
		else {
			request.setAttribute("msg", "email or password invalid");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
			//out.print("something went wrong");
			//response.sendRedirect("login.jsp"); 
		}
		
		
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//doPost(request,response);
		
		//RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		//rd.include(request, response);
		
		response.sendRedirect("login.jsp");
	}


}
