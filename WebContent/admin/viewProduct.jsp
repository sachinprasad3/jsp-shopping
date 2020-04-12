<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.product.Product,java.util.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Products</title>

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
	int pages = 1;
	int recordsPerPage = 5;
	
	if(request.getParameter("page")!= null) {
		pages = Integer.parseInt(request.getParameter("page"));
	}
	
	Dao dao = new Dao();
	List<Product> list=dao.getAllProduct((pages-1)*recordsPerPage, recordsPerPage);
	int noOfRecords = dao.getNumberOfProducts();
	
	int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	
	request.setAttribute("list", list);
	request.setAttribute("noOfPages", noOfPages);
	request.setAttribute("currentPage", pages);
%>

<%@ include file="layout/header.jsp" %>
<%@ include file="layout/sidebar.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content pt-5">

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">View Products</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th scope="col">S.No.</th>
		      <th scope="col">Product Id</th>
		      <th scope="col">Category Id</th>
		      <th scope="col">Sub-Category Id</th>
		      <th scope="col">Product Name</th>
		      <th scope="col">Product Details</th>
		      <th scope="col">price</th>
		      <th scope="col">Created At</th>
		      <th scope="col">Operations</th>

            </tr>
            </thead>
            <tbody>
              <c:forEach items="${list}" var="u" varStatus="counter">  
			    <tr>
			      <th scope="row">${counter.count}</th>
			      <td>${u.getId()}</td>
			      <td>${u.getCat_id()}</td>
			      <td>${u.getSub_cat_id()}</td>
			      <td>${u.getProduct_name()}</td>
			      <td>${u.getProduct_detail()}</td>
			      <td>${u.getPrice()}</td>
			      <td>${u.getCreated_at()}</td>
			      <td> <a class="btn btn-primary" href="admin/updateProduct.jsp?product_id=${u.getId()}">Edit</a> <a class="btn btn-danger" href="../DeleteProduct?product_id=${u.getId()}">Del</a> </td>
			    </tr>
		    </c:forEach>
            </tbody>

          </table>
        </div>
        <!-- /.card-body -->
         <div class="card-footer">
            <%--For displaying Previous link except for the 1st page --%>
			<c:if test="${currentPage != 1}">
				<td><a href="viewProduct.jsp?page=${currentPage - 1}">Previous</a></td>
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
		                        <td><a href="viewProduct.jsp?page=${i}">${i}</a></td>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
		        </tr>
		    </table>
		    
		     <%--For displaying Next link --%>
		    <c:if test="${currentPage lt noOfPages}">
		        <td><a href="viewProduct.jsp?page=${currentPage + 1}">Next</a></td>
		    </c:if>
	
         </div>
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