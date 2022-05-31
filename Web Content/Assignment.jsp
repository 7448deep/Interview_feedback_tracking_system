<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Role</title>
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
				<div class="row">
					<h3>Give Assignments</h3>
					<div class="row">
						<div class="col-6 offset-2">
							<div class="card p-2" style="background-color: #5cd1f7">												
								<form action="getcandidatelistforassignment" method="post">
									<div class="row p-3" >
										<div class="col-3">Select JobRole</div>
										<div class="col-5"> 
											<select class="form-select" required name="job_role_id" id="job_role_id" onchange="populateCandidateList()" style="width:100%">
												<option value="" class="text-center">--select role--</option>
													<%
													ArrayList<JobRole> joblist = JobRoleDao.getListJob();
													for (int i = 0; i < joblist.size(); i++) {
														JobRole job = (JobRole) joblist.get(i);
													%>
													<option value="<%=job.getJob_role_id()%>"><%=job.getJob_title()%></option>
													<%
													}
													%>										
											</select>					
										</div>
										<div class="col-3">
											<input type="submit"  value="Submit" class="btn btn-primary">
										</div>
									</div>
								</form>
										
							</div>
						</div>
					</div>
					
					
				</div>	
			</div>
		</div>
	</div>
	
	
</body>
</html>