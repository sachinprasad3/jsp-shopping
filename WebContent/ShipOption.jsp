<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Ship Option</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<%
	response.addHeader("Cache-Control","na-cache, no-store, must-revalidate"); //http 1.1
	response.addHeader("Pragma", "no-cache"); //Http 1.0
	response.addHeader("Expires","0"); //proxy server

	if(session.getAttribute("useremail")==null){		
		response.sendRedirect("index.jsp");
	}

%>

	<div class="container">
		<div>
		<div class="row">
			<div class="col-8">
				<h3>Choose your shipment option</h3>
			</div>
			
			<div col-4> 
				<a class="btn btn-info">Continue</a>
			 </div>
			 
		</div>
		</div><!--  -->
		
		<div>
			<div class="row">
				<div class="col-8">
					<div>
						<h3>Shipmemt 2 of 2</h3>
						<p>Deliver to: </p>
							<c:forEach items="${addr}" var="u" varStatus="counter">  
								<span>${u.getFullName()}, ${u.getLandmark()}, ${u.getAddressLine1()}, ${u.getAddressLine2()}, ${u.getCity()}, ${u.getState()}, ${u.getPincode()}</span>					 
						    
							</c:forEach>
					</div>
					<div>
						<ul>
							<c:forEach items="${CartItem}" var="u" varStatus="counter">  
								 <c:set var="total" value="${total + u.price}" />
								 <c:set var="item" value="${item + 1}"/>
								 
								 <li> 
								 	<b><p>${u.getProduct_name()}</p></b>
								 	<p>INR: ${u.getPrice()}</p>
								 	<p>Quantity : 1</p>
								 </li>
						    
							    </c:forEach>
						</ul>
					</div>
					
				</div><!-- col-8 -->
				
				<div col-4> 
				<h4>Choose a deliver speed</h4>
				<input type="radio" name="deliverType">
			 </div><!-- col-4 -->
			 
			</div>
		</div><!--  -->
		
		<div>
			<div>
				<a class="btn btn-info" href="PaymentMethod.jsp">Continue</a>
			</div>
		</div>
		
	</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>