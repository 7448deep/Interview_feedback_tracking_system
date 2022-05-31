<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment Given</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
</head>
<body>
<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-10">
				<div class="row mt-5">
					<div class="col-6 offset-3">
						<div class="card p-5" style="background-color: #dbfccc">
							<div class="row">
								<div class="col text-center"><h4>Task Assigned Successfully</h4></div>
							</div>
						</div>
						<div class="row text-center p-3">
							<div class="col"><a href="HomePage.jsp" class="btn btn-primary"> GoTo Home</a></div>
							<div class="col"><a href="Assignment.jsp" class="btn btn-primary"> Assign Task</a></div>
							<div class="col"><a href="SearchCandidatePage.jsp" class="btn btn-primary"> GoTo Candidate</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>