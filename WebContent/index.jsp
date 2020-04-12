<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.dao.Dao,com.product.Product,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Shoppy | Online Shopping Site</title>
<%@ include file="Layouts/headerlink.jsp" %>
</head>
<body>
<%
	response.addHeader("Cache-Control","na-cache, no-store, must-revalidate"); //http 1.1
	response.addHeader("Pragma", "no-cache"); //Http 1.0
	response.addHeader("Expires","0"); //proxy server
%>

<%
HttpSession sessionQuery = request.getSession();
sessionQuery.removeAttribute("searchQuery");
sessionQuery.removeAttribute("sessionCat");
sessionQuery.removeAttribute("productSortBy");
Dao dao = new Dao();
List<Product> list=dao.getProduct(); 
request.setAttribute("list",list);
%>

<%@ include file="Layouts/Header.jsp" %>

	<div>

		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		    
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="images/b1.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">   
		    <img src="images/b2.png" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
			</div>
			
			<!-- show product section -->
			<div class="container-fluid">
			<center>
			 	<h1>Top Products</h1>
			 </center>
			 
			 <div class="container products">
			 
			 	<ul class="list-inline">
				  
				  <c:forEach items="${list}" var="u" varStatus="counter">  
				  <li class="list-inline-item mb-3">
				  <input type="hidden" id="custId" name="custId" value="${u.getId()}">
				  	<div class="card" style="width: 15rem;">
				  		<div class="card-img">
				  			<img src="./ImageHandler?id=${u.getId()}" class="card-img-top center" alt="images/p1.jpeg" width="100" hieght="150">	
				  		</div>
					  <div class="card-body details">
					       					
    					<c:set var="title" value="${u.getProduct_name()}"/>
					    <c:set var="Tlen" value="${fn:length(title)}"/>
					    <c:if test="${Tlen > 20}">  
						   <p class="card-text title">${fn:substring(u.getProduct_name(), 0, 20)}...</p>  
						</c:if>
						<c:if test="${Tlen < 20}">  
						   <p class="card-text title">${u.getProduct_name()}</p>  
						</c:if>
    					
					    <c:set var="des" value="${u.getProduct_detail()}"/>
					    <c:set var="len" value="${fn:length(des)}"/>
					    <c:if test="${len > 25}">  
						   <p class="card-text">${fn:substring(u.getProduct_detail(), 0, 20)}...</p>  
						</c:if>
						<c:if test="${len < 25}">  
						   <p class="card-text">${u.getProduct_detail()}</p>  
						</c:if>
					    <p class="price"><i class="fa fa-inr"></i>&nbsp ${u.getPrice()}</p>
					    <a href="AddToCart?product_id=${u.getId()}" class="btn btn-primary">Add to Cart</a>
					  </div>
					</div>
					
				  </li>
				  </c:forEach>
			  
				</ul>
			 
			 </div>
			</div>

<%@ include file="Layouts/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>