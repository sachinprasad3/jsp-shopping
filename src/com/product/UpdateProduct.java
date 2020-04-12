package com.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int p_id = Integer.parseInt(request.getParameter("productId"));
		int cat_id = Integer.parseInt(request.getParameter("select_cat"));
		int subCatId = Integer.parseInt(request.getParameter("select_subCat"));
		String title = request.getParameter("title");
		String details = request.getParameter("detail");
		String price = request.getParameter("price");
		
		
		Dao dao = new Dao();
		
		if(dao.updateProduct(p_id,cat_id,subCatId,title,details,price)) {
			
			response.sendRedirect("admin/viewProduct.jsp");
		}else {
			response.sendRedirect("admin/viewProduct.jsp");
		}
		
	}

}
