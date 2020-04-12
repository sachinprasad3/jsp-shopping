package com.category;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cat = request.getParameter("cat");
		PrintWriter  out = response.getWriter();
		
		Dao dao = new Dao();
		
		if(dao.addCategory(cat)) {
			response.sendRedirect("admin/addCategory.jsp");
		}else {
			out.print("something went wrong");
			response.sendRedirect("admin/addCategory.jsp");
		}
	}

}
