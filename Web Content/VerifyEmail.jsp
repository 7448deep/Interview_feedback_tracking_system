<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Employee</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body style="background-color: #f0f0f0">
	<%@ include file="DesignCdnLinks/allCdn.jsp"%>
	<%
	String isValid = (String)session.getAttribute("isValid");
	%>
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-4 offset-4">
				<div class="card p-4">
					<%
					if(isValid=="No")
					{%>
						<h5 class="text-danger"> You have Entered Wrong code</h5>	
					<%}
					%>
					<h4 > Verification code sent to your email.</h4>
					<h6>Enter 4 digit code</h6>
					<form onsubmit="return validateForm()" action="VerifyCode" method="post">		
						<div class="p-3">
							<input name="userEnteredCode" id="userEnteredCode" type="text" class="form-control" onclick="removeError('verifycode')"> 
							<span class="inputError" id="verifycodeError"></span>
						</div>
						<div class="p-3 text-center">
							<input class="btn btn-primary" id="submit" type="submit" value="Verify">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	

	<script>
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";

		}
		function validateForm() {
			var code = document.getElementById("userEnteredCode");
			if (code.value.length == 0) {
				verifycode.style.border = "solid 2px red";
				document.getElementById("verifycodeError").innerHTML = "*Please Enter code";

				return false;
			}
			if (code.value.length != 4) {
				verifycode.style.border = "solid 2px red";
				document.getElementById("verifycodeError").innerHTML = "*Please Enter valid 4 digit";

				return false;
			}
			if (isNaN(code.value)) {
				verifycode.style.border = "solid 2px red";
				document.getElementById("verifycodeError").innerHTML = "*Please Enter only number";
				return false;
			} else {
				verifycode.style.border = "solid 2px green";
			}

		}
	</script>
</body>
</html>