
<%@page import="com.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title></title>
<%@include file="DesignCdnLinks/allCdn.jsp"%>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String Loggeduser = "";
	if (session.getAttribute("Loggeduser") == null) {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	} else {
		Employee user = (Employee) session.getAttribute("Loggeduser");
		Loggeduser = user.getEmployee_username();
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<div class="sidenav">
					<div class="employee">
						<button class="dropdown-btn">
							Welcome
							<%=Loggeduser%>
						</button>
						<div class="dropdown-container">
							<form action="logout" method="post">
								<a> <input class="btn btn-danger" type="submit" value="logout">
								</a>
							</form>
						</div>
					</div>
					<!-- menus present in Sidenav bar -->
					<!--  Menu-->
					<a href="HomePage.jsp">Home</a>

					<!-- Menu -->
					<button class="dropdown-btn">
						JobRole <i class="fa fa-caret-down"></i>
					</button>
					<!--  SubMenu of Jobrole-->
					<div class="dropdown-container">
						<a href="AddJobRole.jsp">Add JobRole</a> <a href="JobRole_Skill.jsp">Add Skills</a>
					</div>

					<!-- Menu -->
					<button class="dropdown-btn">
						Candidate <i class="fa fa-caret-down"></i>
					</button>
					<!-- SubMenu of Candidate -->
					<div class="dropdown-container">
						<a href="AddNewCandidate.jsp">Add Candidate</a>
						 <a href="SearchCandidatePage.jsp">Goto Profile</a>
					</div>

					<!-- Menu -->
					<a href="ScheduleInterview.jsp">Schedule Interview</a>

					<!-- Menu -->
					<button class="dropdown-btn">
						Assignments <i class="fa fa-caret-down"></i>
					</button>
					<!-- SubMenu of Assignment -->
					<div class="dropdown-container">
						<a href="Assignment.jsp">Give Assignments</a>
						 
					</div>
					
					<!-- Menu -->
					<button class="dropdown-btn">
						Interviewer <i class="fa fa-caret-down"></i>
					</button>
					<!-- SubMenu of Interviewer-->
					<div class="dropdown-container">
						<a href="EmployeeList.jsp">Interviewer List</a>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<%
	}
	%>

	<script>
		/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>
</body>
</html>