function validate(){
		
		if(document.login.email.value == "")
			{
				//alert("email is required");
				document.login.email.focus() ;
				$('#InputEmail1').css("border", "1px solid red");
				$("#InputEmail1").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter email address</div>");
			       
				return false;
			}
		if(document.login.password.value == "")
		{
			//alert("password is required");
			document.login.password.focus() ;
			$('#InputPassword1').css("border", "1px solid red");
			$("#InputPassword1").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter password</div>");
		       
			return false;
		}
	}
