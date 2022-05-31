<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Registration</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body onload="clearform()" style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-1">
			<div class="col-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-success">Register Here</h2>
						<form onsubmit="return validateForm()" action="registeremployee" method="post" name="registeremployee">

							<div class="mb-3">
								<label for="inputname" class="form-label"><span class="inputError">*</span>Name</label> <input name="employeename" id="employeename" type="text" class="form-control"
									onclick="removeError('employeename')" autocomplete="off"> <span class="inputError" id="employeenameError"></span>
							</div>

							<div class="mb-3">
								<label for="inputusername" class="form-label"><span class="inputError">*</span>User Name </label> <input name="username" id="username" type="text" class="form-control"
									onclick="removeError('username')" autocomplete="off" onblur="checkusername()"> <span class="inputError" id="usernameError"></span>
							</div>

							<div class="mb-3">
								<label for="inputemail" class="form-label"><span class="inputError">*</span>Email </label> <input name="email" id="email" type="email" class="form-control" onclick="removeError('email')"
									autocomplete="off" onblur="checkEmail()"> <span class="inputError" id="emailError"></span>
							</div>
							
							<div class="mb-3">
								<label for="inputPassword" class="form-label"><span class="inputError">*</span>Password</label> <input name="password" id="password" type="password" class="form-control"
									onclick="removeError('password')" autocomplete="off"> <span class="inputError" id="passwordError"></span>
							</div>
							<div class="mb-3">
								<label for="inputPassword" class="form-label"><span class="inputError">*</span>Confirm Password</label> <input name="confirmpassword" id="confirmpassword" type="password" class="form-control"
									onclick="removeError('confirmpassword')" autocomplete="off"> <span class="inputError" id="confirmpasswordError"></span>
							</div>
							<div class="text-center">
								<input class="btn btn-primary" id="submit" type="submit" value="Register">
							</div>
							<br>
							<div>
								<h6>
									<a href="login.jsp">Already Register</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	
		var isUsernameValid=null;
	
		function checkusername() 
		{	
			
			var userName = $("#username").val();	
			datastring = "data=" + 1+""+userName;
			$.ajax({
						type : "post",
						url : "EmployeeRegistrationService",
						data : datastring,
						dataType : "json",
						success : function(data) 
						{
							isUsernameValid=data.isUsernameValid;
							if(data.isUsernameValid=="invalid")
							{
								username.style.border = "solid 2px red";
								document.getElementById("usernameError").innerHTML = "*This UserName is alredy Exist Choose Different Username";
							}
						}
					})	
		}
		var isEmailidValid=null;
		function checkEmail() 
		{			
			var Email = $("#email").val();	
			datastring = "data=" + 2+""+Email;
			$.ajax({
						type : "post",
						url : "EmployeeRegistrationService",
						data : datastring,
						dataType : "json",
						success : function(data) 
						{
							isEmailidValid=data.isEmailidValid;
							if(data.isEmailidValid=="invalid")
							{
								email.style.border = "solid 2px red";
								document.getElementById("emailError").innerHTML = "*This Email_Id is alredy Exist Choose Different Email_Id";
							}
						}
					})	
		}
	
	
	
		//empty form
		function clearform() {
			document.registeremployee.reset();
		}
		//this function check if email is valid or not
		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}

		//this fun remove error msg from input field
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";
			if(id=="username")
			{
				isUsernameValid=null;
			}
		}

		//this function checks all fields validation
		function validateForm() {
			var name = document.getElementById("employeename");
			var username = document.getElementById("username");
			var emailid = document.getElementById("email");
			var password = document.getElementById("password");
			var cpassword = document.getElementById("confirmpassword");

			var cnt = 0;

			if (name.value.trim() == "") {
				employeename.style.border = "solid 2px red";
				document.getElementById("employeenameError").innerHTML = "*Please Enter Name";

				cnt++;
			} else {
				employeename.style.border = "solid 2px green";
			}

			if (username.value.trim() == "") {
				username.style.border = "solid 2px red";
				document.getElementById("usernameError").innerHTML = "*Please Enter username";

				cnt++;
			} else {

				username.style.border = "solid 2px green";
			}

			if (emailid.value.trim() == "") {
				emailid.style.border = "solid 2px red";
				document.getElementById("emailError").innerHTML = "*Please Enter EmailId";

				cnt++;
			}

			var validemaild = validateEmail(emailid.value);
			if (validemaild == false) {
				emailid.style.border = "solid 2px red";
				document.getElementById("emailError").innerHTML = "*Please Enter valid EmailId";
				cnt++;
			} else {

				emailid.style.border = "solid 2px green";

			}

			if (password.value.trim() == "") {
				password.style.border = "solid 2px red";
				document.getElementById("passwordError").innerHTML = "*Please Enter Password";
				cnt++;
			} else {
				password.style.border = "solid 2px green";
			}

			if (cpassword.value.trim() == "") {
				confirmpassword.style.border = "solid 2px red";
				document.getElementById("confirmpasswordError").innerHTML = "*Please Confirm Password";
				cnt++;
			}

			if (cpassword.value != password.value) {
				confirmpassword.style.border = "solid 2px red";
				document.getElementById("confirmpasswordError").innerHTML = "*Confirm password not matched";
				cnt++;
			} else {
				confirmpassword.style.border = "solid 2px green";
			}
			//cnt==0==noError
			if (cnt != 0 || isUsernameValid !="valid" || isEmailidValid !="valid")
			{
				return false;
			}
			if (cnt == 0) {
				document.getElementById("submit").disabled = true;
			}

		}
	</script>
</body>
</html>