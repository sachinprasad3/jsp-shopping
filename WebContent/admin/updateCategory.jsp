<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.category.Category,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Category</title>
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
int c_id = Integer.parseInt(request.getParameter("category_id"));
Dao dao = new Dao();
Category cat = dao.getCategoryById(c_id);
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
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" action="../UpdateCategory" method="post">
              <input type="hidden" name="catId" value="<%=cat.getId() %>"/>
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Category Name</label>
                    <input type="text" class="form-control" name="catName" value="<%=cat.getCategory() %>">
                  </div>   
                </div><!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div><!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	

<%@ include file="layout/footer.jsp" %>
<%@ include file="layout/footerlink.jsp" %>

</body>
</html>