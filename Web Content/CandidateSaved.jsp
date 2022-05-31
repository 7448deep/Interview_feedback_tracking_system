<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate Saved</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
</head>
<body style="background-color: #f0f0f0">

	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-6 offset-2 mt-5">
				<div class="card p-3">
					<div class="card-body text-center">
						<h2 class="text-success">Candidate Saved Successfully</h2>
					</div>
				</div>
				<div class="row mt-5 text-center">
					<div class="col">
						<a href="HomePage.jsp" class="btn btn-primary">Goto Home</a>
					</div>
					<div class="col">
						<a href="AddNewCandidate.jsp" class="btn btn-primary">Add New Candidate</a>
					</div>
					<div class="col">
						<a href="ScheduleInterview.jsp" class="btn btn-primary">Goto Schedule</a>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>