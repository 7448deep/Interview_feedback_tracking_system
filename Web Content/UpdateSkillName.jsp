<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Skill</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
</head>
<body style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-md-5 offset-md-2">
				<div class="card p-4" style="background-color: #e3f4fc">
					<div class="card-body">
						<%
						int job_role_id = (int) session.getAttribute("job_role_id");
						%>
						<div class="row p-2 m-2">
							<div class="col-6">
								<label><strong>Previous Name:</strong></label>
							</div>
							<div class="col-6">
								<%=session.getAttribute("skillname")%>
							</div>

						</div>



						<form action="updateskilllname" method="post">

							<div class="row p-2 m-2">
								<div class="col-6">
									<label> <strong> Enter Updated Name</strong></label>
								</div>
								<div class="col-5">
									<input type="text" name="skill_name" required> <input type="hidden" name="skill_id" value="<%=session.getAttribute("skillid")%>"> <input type="hidden" name="job_role_id"
										value="<%=job_role_id%>">
								</div>
							</div>
							<div class="row p-2 m-2">
								<div class="col-2 offset-4">
									<input class="btn btn-primary" type="submit" value="Update">
								</div>
							</div>


						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>