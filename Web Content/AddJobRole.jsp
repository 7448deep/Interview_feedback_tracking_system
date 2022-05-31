<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add JobRole</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.joblist {
	height: 450px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}

.card {
	width: 450px;
}
</style>
</head>

<body style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<!--End of sidenav  -->
			<div class="col-md-5">
				<div class="card p-3" style="background-color: #e3f4fc">
					<div class="card-body">

						<!-- this form takes jobrole  and goto saveJobRole Servlet-->
						<form onsubmit="return validateJobrole()" name="addJobRoleForm" action="savejobrole" method="post">
							<div class="row m-2">
								<div class="col-4">
									<strong>Add JobRole</strong>
								</div>
								<div class="col-8">
									<input type="text" name="Job" id="job" required autocomplete="off">
								</div>
							</div>
							<div class="text-center m-2 p-2">
								<input class="btn btn-primary" type="submit" value="Add JobRole">
							</div>
						</form>

					</div>
				</div>
			</div>
			<!--End of JOB role card  -->

			<!-- JobList -->
			<div class="col-md-5 ">
				<h5>
					<strong>Vacancy</strong>
				</h5>
				<div class="joblist">
					<%
					//getting jobrole list available in DBMS		
					ArrayList<JobRole> joblist = JobRoleDao.getListJob();

					//if DBMS dont have JobRole
					if (joblist.isEmpty()) {
					%>
					<h4>No Record Available</h4>

					<%
					} //	<!--End of if   -->
						//if Dbms have list of jobs									
					else {
					%>
					<div class="row  ">
						<div class="col-1">
							<Strong>#</Strong>
						</div>
						<div class="col-6">
							<strong>JobRoles</strong>
						</div>
						<div class="col-5">
							<strong>Applied Candidates</strong>
						</div>
					</div>
					<hr>

					<%
					for (int i = 0; i < joblist.size(); i++) {
						JobRole job = (JobRole) joblist.get(i); //taking one job from list
					%>
					<div class="row">
						<div class="col-1"><%=i + 1%></div>
						<div class="col-6">
							<%=job.getJob_title()%>
						</div>
						<div class="col-5">
							<%
							int appliedCnt = CandidateDao.getAppliedCountForJobRole(job.getJob_role_id()); //total applied count
							if (appliedCnt == 0) {
								out.print("No Applicant");
							} else {
								out.print(appliedCnt);
							}
							%>
						</div>
					</div>
					<hr>


					<%
					} //End of For Loop
					%>

					<%
					} //End of Else part
					%>


				</div>
			</div>

		</div>
		<!-- End Of Row class -->
	</div>
	<!-- End Of container class -->
	<script>
	//add values to list
	var list = [<%for (int i = 0; i < joblist.size(); i++) {
	JobRole jobrole = (JobRole) joblist.get(i);%>
	            	"<%=jobrole.getJob_title().toLowerCase()%>"
	            	<%=i + 1 < joblist.size() ? "," : ""%>
	            <%}%>];
	//check is User entered Job already Available
	function validateJobrole() {
		var job=document.getElementById("job");
		if(list.includes(job.value.toLowerCase()))
		{
			alert(job.value +" is Already available");
			document.addJobRoleForm.reset();	
			return false;
		}
	
	}
	
</script>
</body>

</html>