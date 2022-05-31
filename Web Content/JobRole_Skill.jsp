<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Select JobRole</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col">
				<div class="row m-4">
					<div class="col-6 offset-3">					
						<form onsubmit="return validateForm()" action="gotoaddskills" method="post">
							<div class="card"  style="background-color: #5cd1f7;">
								<div class="row p-4">
									<div class="col-8">
										<select class="form-select" name="job_role_id" required id="job_role_id" style="width: 100%">
											<option value="0" class="text-center">-select jobrole-</option>
											<%
											ArrayList<JobRole> joblist = JobRoleDao.getListJob();
											for (int i = 0; i < joblist.size(); i++) {
												JobRole job = (JobRole) joblist.get(i);
											%>
											<option  value="<%=job.getJob_role_id()%>" class="text-center"><%=job.getJob_title()%></option>
											<%
											}
											%>
										</select> 
									</div>
									<div class="col-4">
										<input class="btn btn-primary" type="submit" value="Submit">
									</div>
								</div>
							</div>
							
						</form>
					</div>
					<div class="col-4 offset-3">
						<span class="inputError" id="job_role_idError"></span> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
			var job = document.getElementById("job_role_id");
			if (job.value < 1) {
				document.getElementById("job_role_idError").innerHTML = "*Please Select JobRole";

				return false;
			}
		}
	</script>
</body>
</html>