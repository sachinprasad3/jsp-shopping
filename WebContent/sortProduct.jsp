<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.dao.Dao,com.product.Product,java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	int sort = Integer.parseInt(request.getParameter("sort"));
	String search_query = request.getParameter("query");
	String cat = request.getParameter("category");
//	System.out.println(sort);
//	System.out.println(search_query);
//	System.out.println(cat);
	Dao dao = new Dao();
	
	HttpSession sessionSort = request.getSession();
	sessionSort.setAttribute("productSortBy", sort);
	
	List<Product> prd=dao.getSortedProduct(sort,search_query,cat); 
	//System.out.println(list);
	request.setAttribute("list",prd);
	
%>

			 	<ul class="list-inline"  id="product-list">
				  <c:forEach items="${list}" var="u" varStatus="counter"> 
				  
					  <li class="list-item mb-2">
								  
					  	<div class="card"> 	
						  <div class="card-body">
						  	<div class="row">
						  	
						  		<div class="col-3">
						  			 <img src="./ImageHandler?id=${u.getId()}" class="card-img-top" alt="..." style="height:250px;">
						  		</div>
						  		
						  		<div class="col-6">
						  			<input type="hidden" id="custId" name="custId" value="${u.getId()}">
						  			<h5 class="card-title">${u.getProduct_name()}</h5>
									<p class="card-text">${u.getProduct_detail()}</p>  
						  		</div>
						  		
						  		<div class="col-3">
						  			 <p class="price"> <i class="fa fa-inr"></i>  &nbsp ${u.getPrice()}</p>
						    		<a href="AddToCart?product_id=${u.getId()}" class="btn btn-primary">Add to Cart</a>
						  		</div>
						  		
						  	</div><!-- row -->			  	
					  	 </div><!-- card-body -->			  
						</div><!-- card -->		
					  </li>
				  </c:forEach>
	  
				</ul>

</body>
</html>