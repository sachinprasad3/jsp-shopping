package com.image;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;


/**
 * Servlet implementation class ImageHandler
 */
@WebServlet("/ImageHandler")
public class ImageHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id =  Integer.parseInt(request.getParameter("id")) ;
		
		Dao dao = new Dao();
		
		byte[] image = dao.getImage(id);
		
		ServletOutputStream outputStream = response.getOutputStream();
		
		outputStream.write(image);
		outputStream.close();
		
		
	}

}
