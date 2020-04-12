<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Choose Payment option</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

	

<%
	response.addHeader("Cache-Control","na-cache, no-store, must-revalidate"); //http 1.1
	response.addHeader("Pragma", "no-cache"); //Http 1.0
	response.addHeader("Expires","0"); //proxy server
	
	if(session.getAttribute("useremail")==null){
		response.sendRedirect("index.jsp");
	}

%>

	<div class="container">
		<h3>Select a payment method</h3>
		<div class="row">
			<div col-8>
			
				<form action="PaymentMethod" method="post">
				<div class="form-group">
				    <input type="radio" name="paymentMethod" value="COD" checked="checked">&nbsp Cash on delivery
				  </div>
				  <div class="form-group">
				    <input type="radio" name="paymentMethod" value="onilePayment" disabled="disabled">&nbsp Online payment
				  </div>
				
				<input type="submit" class="btn btn-info" name="paymentOption" value="continue">
				</form>
				
			</div>
		</div>
	
	</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>