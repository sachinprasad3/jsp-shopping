<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select a delivery address</title>
<%@ include file="Layouts/headerlink.jsp" %>
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
	 <h3 class="brand">Shoppy</h3> 
	 
	 <div class="Address-form frm col-6">
	 	<div class="card">
			<div class="card-body">
	 
			 <form action="DeliveryAddress" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Full Name</label>
			    <input type="text" class="form-control" name="enterAddressFullName">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Mobile number</label>
			    <input type="text" class="form-control" name="enterAddressMobileNumber" maxlength="10">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Pincode</label>
			    <input type="text" class="form-control" name="enterAddressPincode" maxlength="6">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Flat, House no, Building</label>
			    <input type="text" class="form-control" name="enterAddressLine1" maxlength="50">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Area, Street, Village, Colony</label>
			    <input type="text" class="form-control" name="enterAddressLine2" maxlength="60">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Landmark</label>
			    <input type="text" class="form-control" name="enterAddressLandmark" maxlength="60" placeholder="E.g. Near Life Line Hospital">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Town/City</label>
			    <input type="text" class="form-control" name="enterAddressCity" maxlength="60">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">State</label>
			    <input type="text" class="form-control" name="enterAddressState" maxlength="60">
			  </div>
			  <div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck1">
			    <label class="form-check-label" for="exampleCheck1">Check me out</label>
			  </div>
			  <button type="submit" class="btn btn-primary">Deliver to this address</button>
			</form>
		</div>
		</div>
	</div>

	</div>



<%@ include file="Layouts/footerlink.jsp" %>
</body>
</html>