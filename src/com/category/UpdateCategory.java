package com.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int c_id = Integer.parseInt(request.getParameter("catId"));
		String catName = request.getParameter("catName");
		Dao dao = new Dao();
		if(dao.updateCategory(c_id,catName)) {		
			response.sendRedirect("admin/viewCategory.jsp");
		}else {
			response.sendRedirect("admin/viewCategory.jsp");
		}
		
	}

}
