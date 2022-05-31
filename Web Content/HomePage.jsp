<%@page import="com.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.logo {
	position: absolute;
	top: 8px;
	
}
.heading {
	position: absolute;
	top: 8px;
	left: 40%;
}
</style>
</head>
<body>
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col">
				<div class="logo">
					<img alt="img" height="50px" src="images/sparsolutions.png">
				</div>
				<div class="heading">
					<h3>Welcome To Interview Feedback Tracking System</h3>
				</div>
				<img alt="img" style="width: 100%;" src="images/homeimg.jpg">

			</div>
		</div>
	</div>

</body>
</html>