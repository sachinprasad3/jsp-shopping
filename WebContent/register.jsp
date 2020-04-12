<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
</head>
<body>

<%

	if(session.getAttribute("useremail")!=null){
		
		response.sendRedirect("index.jsp");
	}

%>

	<div class="container">
		<h3 class="brand">Shoppy</h3>
		<div class="frm col-6">
			<div class="card">
				<div class="card-body">
					<h3>Create Account</h3>
	
					<form action="Register" method="post" onsubmit="return validate()" name="frm">
					  <div class="form-group">
					    <label for="exampleInputEmail1">Name</label>
					    <input type="text" class="form-control" name="uname"  id="uname">
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email</label>
					    <input type="text" class="form-control" name="email" id="email">
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">Phone</label>
					    <input type="text" class="form-control" name="phone" id="phone">
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputPassword1">Password</label>
					    <input type="password" class="form-control" name="password" id="password">
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputPassword1">Confirm Password</label>
					    <input type="password" class="form-control" name="confirm_password" id="confirm_password">
					  </div>
					  <button type="submit" class="btn btn-primary">Submit</button>
					  
					  <hr class="a-divider a-divider-break"></hr>
					  <p>Already have an account <a class="" href="login.jsp">Sign in</a> </p>
					</form>
					
				</div>				
			</div>
			
			
		</div>
	</div>
	

<script type="text/javascript">
	
	function validate() {
		
		if(document.frm.uname.value == "")
		{
			document.frm.uname.focus() ;
			$('#uname').css("border", "1px solid red");
			$("#uname").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter name</div>");
		       
			return false;
		}
		
		if(document.frm.email.value == "")
		{
			document.frm.email.focus() ;
			$('#email').css("border", "1px solid red");
			$("#email").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter email address</div>");
		       
			return false;
		}
		
		if(document.frm.phone.value == "")
		{
			document.frm.phone.focus() ;
			$('#phone').css("border", "1px solid red");
			$("#phone").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter phone number</div>");
		       
			return false;
		}
		
		if(document.frm.password.value == "")
		{
			document.frm.password.focus() ;
			$('#password').css("border", "1px solid red");
			$("#password").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter password</div>");
		       
			return false;
		}
		
		if(document.frm.password.value != document.frm.confirm_password.value)
		{
			document.frm.confirm_password.focus() ;
			$('#confirm_password').css("border", "1px solid red");
			$("#confirm_password").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter password</div>");
		       
			return false;
		}
}
	
</script>
	
<%@ include file="Layouts/footerlink.jsp" %>
</body>
</html>