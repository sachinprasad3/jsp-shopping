<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.dao.Dao,com.order.Order,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
</head>
<%@ include file="Layouts/headerlink.jsp" %>
<body>


<%
	response.addHeader("Cache-Control","na-cache, no-store, must-revalidate"); //http 1.1
	response.addHeader("Pragma", "no-cache"); //Http 1.0
	response.addHeader("Expires","0"); //proxy server
	
	if(session.getAttribute("useremail")==null){
		response.sendRedirect("index.jsp");
	}

%>

<%
Dao dao = new Dao();

String useremail = (String)request.getSession(false).getAttribute("useremail");

List<Order> Orderlist = dao.getOrderList(useremail); 
request.setAttribute("Orderlist",Orderlist);

%>

<%@ include file="Layouts/Header.jsp" %>

	<div>
		<center> <h3>My Orders</h3> </center>
	</div>
	
	<c:if test="${fn:length(Orderlist) == 0}">
		<div class="container">
			<h3>Your have not shopping yet</h3>
		</div>
	</c:if>
	
	<c:if test="${fn:length(Orderlist) > 0}">
	
		<div class="container">
		<h2>My Orders</h2>
		
		<c:forEach items="${Orderlist}" var="u" varStatus="counter">  
		<div class="card mb-3">
		  <div class="card-header">
		  	<ul class="list-inline">
			  <li class="list-inline-item">
			  	<p>ORDER PLACED<br> ${u.getOrderDate()}</p>
		      </li>
			  <li class="list-inline-item">
			  	<p>TOTAL<br><i class="fa fa-inr" aria-hidden="true"></i>${u.getProductPrice()}</p>
			  </li>
			</ul>    
		  </div><!-- /card-header -->
		  <div class="card-body">
		    <table class="table">
			  <tbody>
			    <tr>
			      <td><img src="./ImageHandler?id=${u.getProductId()}" class="card-img-top" alt="images/p1.jpeg" style="height:100px; width: 80px; " width="100" hieght="150"></td>
			      <td> <p> ${u.getProductName()} <br> <i class="fa fa-inr" aria-hidden="true"></i> <span style="color:red"> ${u.getProductPrice()}</span> </p></td>
			      <td>${u.getDeliveryAddress()}</td>    
			    </tr>  
			  </tbody>
			</table>   
		  </div><!-- /card-body -->
		</div><!-- /card -->
		
		</c:forEach>
	</div>
	</c:if>

<%@ include file="Layouts/footerlink.jsp" %>
</body>
</html>