<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.category.Category,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Categories</title>

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
	request.setAttribute("list",list);
%>
<%@ include file="layout/header.jsp" %>
<%@ include file="layout/sidebar.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content pt-5">

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">View Categories</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th scope="col">S.No.</th>
		      <th scope="col">Category Id</th>
		      <th scope="col">Category Name</th>
		      <th scope="col">Operations</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach items="${list}" var="u" varStatus="counter">  
			    <tr>
			      <th scope="row">${counter.count}</th>
			      <td>${u.getId()}</td>
			      <td>${u.getCategory()}</td>
			      <td> <a class="btn btn-primary" href="updateCategory.jsp?category_id=${u.getId()}">Edit</a> <a class="btn btn-danger" href="../DeleteCategory?category_id=${u.getId()}">Del</a> </td>
			    </tr>
		    </c:forEach>
            </tbody>

          </table>
        </div>
        <!-- /.card-body -->
         
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="layout/footer.jsp" %>
<%@ include file="layout/footerlink.jsp" %>

<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>