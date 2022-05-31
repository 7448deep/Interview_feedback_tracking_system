<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Success</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
</head>
<body>
<%@ include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3 offset-4" >
				<div class="row mt-5 " >
					<div class="card p-4" style="background-color: #dbfccc">
						<div class="row p-2">
							<%
								
								String name=(String)session.getAttribute("employeeName");
							%>
							<h4>Welcome &emsp;<%=name %></h4>
						</div>
						<div class="row p-1">
							<h5>You Have Successfully Registered</h5>
						</div>
						<div class="row p-2">
							<div class="col-6 offset-4">
								<a href="login.jsp" class="btn btn-primary">GoTo Login </a>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>		
</body>
</html>