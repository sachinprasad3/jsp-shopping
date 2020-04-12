<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.category.Category,com.product.Product,java.util.*"%>
    <%@page import="com.sub.category.Subcategory"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product | admin</title>
<%@ include file="layout/headlink.jsp" %>
</head>
<body>

<%
response.addHeader("Cache-Control","na-cache, no-store, must-revalidate"); //http 1.1
response.addHeader("Pragma", "no-cache"); //Http 1.0
response.addHeader("Expires","0"); //proxy server

	if(session.getAttribute("adminEmail")==null){		
		response.sendRedirect("login.jsp");
	}

%>

<%  
int p_id = Integer.parseInt(request.getParameter("product_id"));
Dao dao = new Dao();

Product prd = dao.getProductById(p_id);

//System.out.print(prd.getCat_id());

List<Category> list=dao.getCategory(); 
request.setAttribute("list",list);

int cat_id = prd.getCat_id();
//System.out.println(cat_id);
List<Subcategory> sublist=dao.getSubCategory(cat_id);
request.setAttribute("sublist",sublist); 

%>
<%@ include file="layout/header.jsp" %>
<%@ include file="layout/sidebar.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content pt-5">

      <!-- general form elements -->
            <div class="card card-warning col-6">
              <div class="card-header">
                <h3 class="card-title">Add new Product</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->


		<form  action="../UpdateProduct" method="post">
		<div class="card-body">
		<input type="hidden" name="productId" value="<%=prd.getId() %>"/>
		
			<div class="form-group">
				<label>Product Category</label>
					<select class="custom-select" id="category" required name="select_cat">
	
				       
				       <c:set var="catId" value="<%=prd.getCat_id() %>" scope="session" />
				        <c:forEach items="${list}" var="u"> 
				        <option value="${u.getId()}" ${u.getId() == sessionScope.catId ? 'selected="selected"' : ''} >${u.getCategory()}</option> 			
						</c:forEach>
						
				     </select>
			</div>
			
			<div class="form-group">
				<label>Sub Category</label>
					<select class="custom-select" id="subCategory" required name="select_subCat">

				       <c:set var="subCatId" value="<%=prd.getSub_cat_id() %>" scope="session" />
				        <c:forEach items="${sublist}" var="sub"> 
				        <option value="${sub.getId()}" ${sub.getId() == sessionScope.subCatId ? 'selected="selected"' : ''} >${sub.getTitle()}</option> 			
						</c:forEach>
						
				     </select>
			</div>
			
			<div class="form-group">
				<label>Product Title</label>
				<input type="text" class="form-control" name="title" value="<%=prd.getProduct_name() %>" >
			</div>
			
			<div class="form-group">
				<label>Product Details</label>
				<textarea class="form-control" rows="3" name="detail" value=""><%=prd.getProduct_detail() %></textarea>
			</div>
			
			<div class="form-group">
				<label>Price</label>
				<input type="text" class="form-control" name="price" value="<%=prd.getPrice() %>">
			</div>
			
			 <div class="card-footer">
	             <button type="submit" class="btn btn-primary">Add</button>
	          </div>
	          
	         </div>
		</form>
		
		</div><!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	

<%@ include file="layout/footerlink.jsp" %>
<script>
	$(document).ready(function(){
		$("#category").on("change",function(){
			var category_id = $("#category").val();
			console.log(category_id);
			$.ajax({
				url: "subcat.jsp",
				data: {cat_id:category_id},
				method: "POST",
				success: function(data)
				{
					$("#subCategory").html(data);
				}
			});
			
		});
		
	});
</script>
</body>
</html>