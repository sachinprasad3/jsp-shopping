<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.category.Category,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
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

Dao dao = new Dao();
List<Category> list=dao.getCategory(); 
//System.out.println(list);
request.setAttribute("list",list); 

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

				<form  action="../AddProduct" method="post" enctype="multipart/form-data">
					<div class="card-body">
					
					<div class="form-group">
						<label>Product Category</label>
						<select class="custom-select" id="category" required name="select_cat">
						   <option selected disabled value="">Choose...</option>
						   <c:forEach items="${list}" var="u"> 
						   <option value="${u.getId()}">${u.getCategory()}</option> 			
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
						<label>Sub Category</label>
						<select class="custom-select" id="subCategory" required name="select_subCat">
						   <option selected disabled value="">Choose...</option>					   
						</select>
					</div>
					<div class="form-group">
						<label>Product Title</label>
						<input type="text" class="form-control" name="title" >
					</div>
					
					<div class="form-group">
						<label>Product Details</label>
						<textarea class="form-control" rows="3" name="detail"></textarea>
					</div>
					
					<div class="form-group">
						<label>Price</label>
						<input type="text" class="form-control" name="price" >
					</div>
					
					<div class="form-group">
						<label>Image</label>
						<input type="file" name="img" >
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
			//console.log(category_id);
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