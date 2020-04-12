package com.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.Dao;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class AddProduct extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cat_id = Integer.parseInt(request.getParameter("select_cat"));
		int subCatId = Integer.parseInt(request.getParameter("select_subCat"));
		//String cat_id = request.getParameter("select_cat");
		String title = request.getParameter("title");
		String details = request.getParameter("detail");
		String price = request.getParameter("price");
		
		//getting img
		Part part = request.getPart("img");

		Dao dao = new Dao();
		
		 if(dao.addProduct(cat_id,subCatId,title,details,price,part)) {
			
			response.sendRedirect("admin/addProduct.jsp");
		}else {
			response.sendRedirect("admin/addProduct.jsp");
		} 


		
		
	}

}
