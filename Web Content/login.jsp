<%@page import="com.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
						<form onsubmit="return validateLoginForm()" action="Login" method="post" name="loginform">

							<h2 class="text-center text-success">Login</h2>
							<%
							//checks is username password valid
							String invalidMsg = (String) session.getAttribute("invalidMsg");
							if (invalidMsg != null) {
							%>
							<p class=" text-danger text-center"><%=invalidMsg%></p>
							<%
							session.removeAttribute("invalidMsg");
							}
							%>
							<div class="mb-3">
								<label for="inputusername" class="form-label">User Name: </label> <input name="username" id="username" type="text" class="form-control" onclick="removeError('username')" autocomplete="off">
								<span class="inputError" id="usernameError"></span>
							</div>

							<div class="mb-3">
								<label for="inputPassword" class="form-label">Password</label> <input name="password" id="password" type="password" class="form-control" onclick="removeError('password')"> <span
									class="inputError" id="passwordError"></span>
							</div>

							<div class="text-center">
								<input class="btn btn-primary" id="submit" type="submit" value="Login">
							</div>
							<br>
							<div>
								<h6>
									<a href="forgetPassword.jsp">Forget Password?</a> &nbsp; &nbsp; &nbsp; <a href="employeeRegister.jsp">New User</a>
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
			document.loginform.reset();
		}
		//this fun removes error msg and change css of input field to original
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";

		}

		//this function checks all the  inputs are valid
		function validateLoginForm() {
			var username = document.getElementById("username");
			var password = document.getElementById("password");

			//cnt is used to count the error
			var cnt = 0;

			//checks is username field empty
			if (username.value.trim() == "") {
				username.style.border = "solid 2px red";
				document.getElementById("usernameError").innerHTML = "*Please Enter username";
				cnt++;
			} else {
				username.style.border = "solid 2px green";
			}

			//checks is password field empty
			if (password.value.trim() == "") {
				password.style.border = "solid 2px red"
				document.getElementById("passwordError").innerHTML = "*Please Enter Password";
				cnt++;
			} else {
				password.style.border = "solid 2px green";
			}

			//(cnt==0 - no error )(cnt!=0 -error)
			if (cnt != 0) {
				return false;
			}
		}
	</script>
</body>
</html>