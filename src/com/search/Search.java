package com.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
import com.product.Product;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		int page = 1;
		int recordsPerPage = 5;
		
		String cat = request.getParameter("cat");
		if(cat.equalsIgnoreCase("all")) {
			cat = "0";
		}
		
		
		if(request.getParameter("page")!= null)  {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		if(request.getParameter("query")!=null && request.getParameter("query").length()>=3) {
			String searchQuery = request.getParameter("query");
			
			
			Dao dao = new Dao();
			List<Product> list = null;
						
			list=dao.searchProduct(cat,searchQuery, (page-1)*recordsPerPage, recordsPerPage);
			
			int noOfRecords = dao.getNumberOfSearchProducts(cat, searchQuery);
			
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			
			request.setAttribute("query", searchQuery);
			request.setAttribute("list", list);
	        request.setAttribute("noOfPages", noOfPages);
	        request.setAttribute("currentPage", page);
	        
	        HttpSession sessionSort = request.getSession();
	        sessionSort.removeAttribute("productSortBy");
	        
			HttpSession sessionQuery = request.getSession();
			sessionQuery.setAttribute("searchQuery", searchQuery);

			HttpSession  sessionCat = request.getSession();
			sessionCat.setAttribute("sessionCat", cat);
		
			RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
			rd.forward(request, response);

		}else {
			
			response.sendRedirect("index.jsp");
		} 
		
	}

	

}
