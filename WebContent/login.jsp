<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login User</title>
<%@ include file="Layouts/headerlink.jsp" %>
</head>
<body>
<%

	if(session.getAttribute("useremail")!=null){	
		response.sendRedirect("index.jsp");
	}

%>

<% String msg = (String)request.getAttribute("msg"); %>

	<div class="container">
		<h3 class="brand">Shoppy</h3>
		<div class="frm col-6">
			<div class="card">
				<div class="card-body">
					<h3>Login</h3>
					<p class="error" style="color:red;"><c:out value="${msg}"/></p>
			
					<form action="Login" method="post" onsubmit="return validate()" name="login">
					
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email address</label>
					    <input type="email" class="form-control" name="email" id="InputEmail1" aria-describedby="emailHelp">
					    
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">Password</label>
					    <input type="password" class="form-control" name="password" id="InputPassword1">
					  </div>
					  <button type="submit" class="btn btn-primary">Submit</button>
					  
					</form>
				</div>				
			</div>
			<hr class="a-divider a-divider-break"><h5>New to Shoppy?</h5></hr>
			<a class="btn btn-primary" href="register.jsp">Create your Shoppy account</a>
		</div>
	</div>


<script src="assets/js/formValidation.js"></script>

<%@ include file="Layouts/footerlink.jsp" %>
</body>
</html>