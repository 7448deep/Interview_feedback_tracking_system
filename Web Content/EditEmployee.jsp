<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Interviewer</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.card tr {
	border: white;
}

.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body style="background-color: #f0f0f0">

	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-md-5 offset-2">
				<%
				int employee_id = (int) session.getAttribute("employee_id");
				Employee employee = EmployeeDao.getEmployeeById(employee_id);
				%>
				<div class="card p-5" style="background-color: #e3f4fc">
					<div class="card-body">
						<h4>Update Employee Details</h4>
						<form onsubmit="return validateForm()" action="updateemployee" method="post">
							<table class="table">
								<tr>
									<td>Name</td>
									<td><input type="text" id="employee_name" name="employee_name" value="<%=employee.getEmployee_name()%>" onclick="removeError('employee_name')"></td>
								</tr>
								<tr>
									<td></td>
									<td><span class="inputError" id="employee_nameError"></span></td>
								</tr>

								<tr>
									<td>Username</td>
									<td><input type="text" id="employee_username" name="employee_username" value="<%=employee.getEmployee_username()%>" onclick="removeError('employee_username')"></td>
								</tr>
								<tr>
									<td></td>
									<td><span class="inputError" id="employee_usernameError"></span></td>
								</tr>

								<tr>
									<td>Email</td>
									<td><input type="text" id="employee_email" name="employee_email" value="<%=employee.getEmployee_emailid()%>" onclick="removeError('employee_email')"></td>
								</tr>
								<tr>
									<td></td>
									<td><span class="inputError" id="employee_emailError"></span></td>
								</tr>

								<tr>
									<td><input type="hidden" name="employee_id" value="<%=employee.getEmployee_id()%>"></td>
									<td><input class="btn btn-primary" type="submit" value="Update"></td>
								</tr>

							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}

		//remove error msg
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";
		}
		function validateForm() {
			var name = document.getElementById("employee_name");
			var username = document.getElementById("employee_username");
			var email = document.getElementById("employee_email");
			
			var cnt = 0;
			//checks is name  empty
			if (name.value.trim() == "") {
				employee_name.style.border = "solid 2px red";
				document.getElementById("employee_nameError").innerHTML = "*Please Enter Name";

				cnt++;
			} else {
				employee_name.style.border = "solid 2px green";
			}

			//check is username  empty
			if (username.value.trim() == "") {
				employee_username.style.border = "solid 2px red";
				document.getElementById("employee_usernameError").innerHTML = "*Please Enter Username";

				cnt++;
			} else {
				employee_username.style.border = "solid 2px green";
			}

			//this condition checks email is valid
			if (email.value.trim() == "") {
				employee_email.style.border = "solid 2px red";
				document.getElementById("employee_emailError").innerHTML = "*Please Enter your Email";

				cnt++;
			}

			var validemaild = validateEmail(email.value);
			if (validemaild == false) {
				employee_email.style.border = "solid 2px red";
				document.getElementById("employee_emailError").innerHTML = "*Please Enter valid EmailId";
				cnt++;
			} else {
				emailid.style.border = "solid 2px green";
			}

			
			//cnt==0==noError
			if (cnt != 0) {
				return false;
			}
		}
	</script>


</body>
</html>