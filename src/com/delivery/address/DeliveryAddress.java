package com.delivery.address;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class DeliveryAddress
 */
@WebServlet("/DeliveryAddress")
public class DeliveryAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullName = request.getParameter("enterAddressFullName");
		String mobileNo = request.getParameter("enterAddressMobileNumber");
		String pincode =  request.getParameter("enterAddressPincode");
		String addressLine1 =  request.getParameter("enterAddressLine1");
		String addressLine2 =  request.getParameter("enterAddressLine2");
		String landmark =  request.getParameter("enterAddressLandmark");
		String city =  request.getParameter("enterAddressCity");
		String state =  request.getParameter("enterAddressState");
		
		String fullAddress = fullName+","+addressLine1+","+addressLine2+","+landmark+","+city+","+state+","+pincode;
		String addressMobileNo = mobileNo;
		
		HttpSession fullAddressSession = request.getSession();
		fullAddressSession.setAttribute("fullAddress", fullAddress);
		
		HttpSession mobileNoSession = request.getSession();
		mobileNoSession.setAttribute("addressMobileNo", addressMobileNo);
		
		Address address = new Address();
		
		address.setFullName(fullName);
		address.setMobileNo(mobileNo);
		address.setPincode(pincode);
		address.setAddressLine1(addressLine1);
		address.setAddressLine2(addressLine2);
		address.setLandmark(landmark);
		address.setCity(city);
		address.setState(state);
		
				
		List<Address> list = new ArrayList<Address>();
		list.add(address);
		
		HttpSession addressSession = request.getSession();
		addressSession.setAttribute("addr", list);
		
			response.sendRedirect("ShipOption.jsp");
		
		//PrintWriter out = response.getWriter();
		//out.print(list);

	}

}
