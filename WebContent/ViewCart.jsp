<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.cart.Cart,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shoppy | Cart</title>
</head>
<%@ include file="Layouts/headerlink.jsp" %>
<body>
<%@ include file="Layouts/Header.jsp" %>
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

List<Cart> Cartlist = dao.getCart(useremail); 
request.setAttribute("Cartlist",Cartlist);

HttpSession sessions = request.getSession();
sessions.setAttribute("CartItem", Cartlist);
%>
	<div>
		<center> <h3>Your Shopping Cart</h3> </center>
	</div>
	
	<c:if test="${fn:length(Cartlist) == 0}">
		<div class="container">
			<h3>Your Cart is empty :(</h3>
		</div>
	</c:if>
	
	<c:if test="${fn:length(Cartlist) > 0}">
	
		<div class="container">
		<h2>My Cart</h2>
		<div class="row">
			<div class="col-8">
				<ul class="list-inline">
					<c:set var="total" value="${0}"/>
		  			<c:set var="item" value="${0}"/>
		  			
				  <c:forEach items="${Cartlist}" var="u" varStatus="counter"> 
				  	<c:set var="total" value="${total + u.price}" />
			 		<c:set var="item" value="${item + 1}"/>
			 		
					  <li class="list-item mb-2">
								  
					  	<div class="card"> 	
						  <div class="card-body">
						  	<div class="row">
						  	
						  		<div class="col-3">
						  			 <img src="./ImageHandler?id=${u.getProduct_id()}" class="card-img-top" alt="..." style="height:150px;" width="100" hieght="150">
						  		</div>
						  		
						  		<div class="col-6">
						  			<input type="hidden" id="custId" name="custId" value="${u.getProduct_id()}">
						  			<h5 class="card-title">${u.getProduct_name()}</h5> 
						  		</div>
						  		
						  		<div class="col-3">
						  			 <p class="price"> <i class="fa fa-inr"></i>  &nbsp ${u.getPrice()}</p>	
						  			 <a class="btn btn-danger" href="../DeleteFromCart?product_id=${u.getProduct_id()}">Delete</a>					    		
						  		</div>
						  		
						  	</div><!-- row -->			  	
					  	 </div><!-- card-body -->			  
						</div><!-- card -->		
					  </li>
				  </c:forEach>	  
				</ul>
			</div>
			<div class="col-4 pice-calculation">
				<div class="card"> 	
					<div class="card-body">
						<h5>PRICE DETAILS</h5>
						<table>
							<tbody>
								<tr>
							    	<td><p>Price(<c:out value="${item}"/> items)</p></th>
							    	<td class="pl-5"><p><i class="fa fa-inr"></i>&nbsp<c:out value="${total}"/></p></td>
							    	<c:set var="itemCount" value="${item}" scope="session"/>	
							    </tr>
							</tbody>
						</table>					
						<a class="btn btn-success" href="AddAddress.jsp">Proceed to Buy</a>
					</div>
				</div>
			</div>
		</div>

	</div>	
	</c:if>
	
<%@ include file="Layouts/footer.jsp" %>

</body>
</html>