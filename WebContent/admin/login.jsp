<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Krona+One|Lato|Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/style.css" type="text/css" />
</head>
<body>

<%
	response.addHeader("Cache-Control","na-cache, no-store, must-revalidate"); //http 1.1
	response.addHeader("Pragma", "no-cache"); //Http 1.0
	response.addHeader("Expires","0"); //proxy server
%>

<%

	if(session.getAttribute("adminEmail")!=null){
		
		response.sendRedirect("dashboard.jsp");
	}

%>

	<div class="container">
		<h3 class="brand">Shoppy</h3>			
		<div class="frm col-6">
			<div class="card">
				<div class="card-body">
					<h3>Admin Login</h3>
					<p class="error" style="color:red;"><c:out value="${msg}"/></p>
			
					<form action="../adminlogin" method="post" onsubmit="return validate()" name="login">
					
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
			
		</div>
	
	</div>

<script src="../assets/js/formValidation.js"></script>
<%@ include file="../Layouts/footerlink.jsp" %></body>
</html>