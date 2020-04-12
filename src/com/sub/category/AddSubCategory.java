package com.sub.category;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class AddSubCategory
 */
@WebServlet("/addSubcategory")
public class AddSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cat_id = Integer.parseInt(request.getParameter("select_cat"));
		String subCategory = request.getParameter("subCategory");
		
		PrintWriter out = response.getWriter();
//		out.println(cat_id);
//		out.println(subCategory);
		
		Dao dao = new Dao();
		
		if(dao.addSubCategory(cat_id,subCategory)) {
			response.sendRedirect("admin/addSubcategory.jsp");
		}else {
			response.sendRedirect("admin/addSubcategory.jsp");
		}
		
	}

}
