<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body onload="clearform()" style="background-color: #f0f0f0">
	<%@ include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-success">Reset Password</h2>
						<form onsubmit="return validateForm()" action="forgetpassword" method="post" name="forgetpassform">

							<div class="mb-3">
								<label for="inputusername" class="form-label">User Name: </label> <input name="username" id="username" type="text" class="form-control" onclick="removeError('username')" autocomplete="off">
								<span class="inputError" id="usernameError"></span>
							</div>

							<div class="mb-3">
								<label for="inputemailid" class="form-label">Email Id</label> <input name="email" id="emailid" type="email" class="form-control" onclick="removeError('emailid')" autocomplete="off"> <span
									class="inputError" id="emailidError"></span>
							</div>

							<div class="mb-3">
								<label for="inputnewpassword" class="form-label">New Password</label> <input name="newpassword" id="newpassword" type="password" class="form-control" onclick="removeError('newpassword')"
									autocomplete="off"> <span class="inputError" id="newpasswordError"></span>
							</div>

							<div class="mb-3">
								<label for="inputconfirmpassword" class="form-label">Confirm Password</label> <input name="confirmpassword" id="confirmpassword" type="password" class="form-control"
									onclick="removeError('confirmpassword')" autocomplete="off"> <span class="inputError" id="confirmpasswordError"></span>
							</div>
							<div class="text-center">
								<input class="btn btn-primary" id="submit" type="submit" value="Submit">
							</div>
							<br>
							<div>
								<h6>
									<a href="login.jsp">Goto Login</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		//empty form
		function clearform() {
			document.forgetpassform.reset();
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
		}

		//this function checks all fields validation
		function validateForm() {
			var username = document.getElementById("username");
			var emailid = document.getElementById("emailid");
			var password = document.getElementById("newpassword");
			var cpassword = document.getElementById("confirmpassword");

			var cnt = 0;
			if (username.value.trim() == "") {
				username.style.border = "solid 2px red";
				document.getElementById("usernameError").innerHTML = "*Please Enter username";

				cnt++;
			} else {
				username.style.border = "solid 2px green";
			}
			if (emailid.value.trim() == "") {
				emailid.style.border = "solid 2px red";
				document.getElementById("emailidError").innerHTML = "*Please Enter EmailId";

				cnt++;
			}
			var validemaild = validateEmail(emailid.value);
			if (validemaild == false) {
				emailid.style.border = "solid 2px red";
				document.getElementById("emailidError").innerHTML = "*Please Enter valid EmailId";
				cnt++;
			} else {
				emailid.style.border = "solid 2px green";
			}

			if (password.value.trim() == "") {
				newpassword.style.border = "solid 2px red"
				document.getElementById("newpasswordError").innerHTML = "*Please Enter Password";
				cnt++;
			} else {
				password.style.border = "solid 2px green";
			}

			if (cpassword.value.trim() == "") {
				confirmpassword.style.border = "solid 2px red"
				document.getElementById("confirmpasswordError").innerHTML = "*Please Confirm Password";
				cnt++;
			}
			if (cpassword.value != password.value) {
				confirmpassword.style.border = "solid 2px red"
				document.getElementById("confirmpasswordError").innerHTML = "*confirm password not matched";
				cnt++;
			}
			if (cnt != 0) {
				return false;
			}

		}
	</script>
</body>
</html>