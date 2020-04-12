package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

@WebServlet("/ViewProducts")
public class ViewProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 1;
		int recordsPerPage = 5;
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Dao dao = new Dao();
		List<Product> list=dao.getAllProduct((page-1)*recordsPerPage, recordsPerPage);
		int noOfRecords = dao.getNumberOfProducts();
		
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		
		request.setAttribute("list", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin/viewProduct.jsp");
        rd.forward(request, response);
		
	}


}

/****************** we are not using this *************/
