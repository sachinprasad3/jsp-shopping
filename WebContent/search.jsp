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

//String searchQuery = request.getParameter("query");

//HttpSession sessionQuery = request.getSession();
//sessionQuery.setAttribute("searchQuery", searchQuery);
//Dao dao = new Dao();
//List<Product> list=dao.searchProduct(searchQuery); 
//request.setAttribute("list",list);
%>
<%@ include file="Layouts/Header.jsp" %>

<div>
	 <div class="loading-bar" id="loadingBar"></div>
</div>
<div class="container-fluid product-price-filter">
	<div class=" container product-filter">
		<ul class="list-inline pl-5">
				
			<li class="list-inline-item">
		        <p>result for "<c:out value="${sessionScope.searchQuery}"/>" <p>
		    </li>
		      	
			<li class="list-inline-item ml-auto">
				
					<select name="product-filter" id="product-sort-price">
						<option value="1" ${1 == sessionScope.productSortBy ? 'selected="selected"' : '' }>Featured</option>
						<option value="2" ${2 == sessionScope.productSortBy ? 'selected="selected"' : '' } >Price: Low to High</option>
						<option value="3" ${3 == sessionScope.productSortBy ? 'selected="selected"' : '' } >Price: High to Low</option>
						<option value="4" ${4 == sessionScope.productSortBy ? 'selected="selected"' : '' } >Newest Arrivals</option>
					</select>
				 
			</li>
	   	</ul>  		
	</div>
</div>			
			<!-- show product section -->
			<div class="container-fluid">
			
			
			 
			 <div class="content">
			 	<div class="row">
			 	
				    <div class="col-sm-4">
				      <p>Filter</p>	      
				    </div>
	  
			 <div class="container col-sm-8 view-products">
			 
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
			 </div><!-- col-sm-8 -->
			 </div><!-- row -->
	 
			</div><!-- content -->
		</div><!-- container-fluid -->
			 
			 <%--For displaying Previous link except for the 1st page --%>
		<c:if test="${currentPage != 1}">
			<td><a href="Search?query=${query}&page=${currentPage - 1}">Previous</a></td>
		</c:if>
	
	<%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
    <table border="1" cellpadding="5" cellspacing="5">
        <tr>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <td>${i}</td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="Search?query=${query}&page=${i}">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tr>
    </table>
    
     <%--For displaying Next link --%>
    <c:if test="${currentPage lt noOfPages}">
        <td><a href="Search?query=${query}&page=${currentPage + 1}">Next</a></td>
    </c:if>



<%@ include file="Layouts/footerlink.jsp" %>


<script>
	$(document).ready(function(){
		$("#product-sort-price").on("change",function(){
			var sort = $("#product-sort-price").val();
			var query = '<c:out value="${sessionScope.searchQuery}"/>';
			var cat_id = '<c:out value="${sessionScope.sessionCat}"/>';
			
			//document.loading-bar.className = "loading";
			document.getElementById('loadingBar').className += ' loading';
			
			//console.log(sort);
			//console.log(query);
			//console.log(cat_id);
			$.ajax({
				url: "sortProduct.jsp",
				data: {sort:sort,query:query,category:cat_id},
				method: "POST",
				success: function(data)
				{
					$("#product-list").html(data);
					document.getElementById('loadingBar').className += 'abc';
				}
				
			}); 
		
			
			
		});
			
	});
</script>

</body>
</html>