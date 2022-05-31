<%@page import="com.dao.SkillsDao"%>
<%@page import="com.model.Skills"%>
<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Skills</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.skill_list {
	height: 450px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
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

			<div class="col-md-4 ">
				<%
				int job_role_id = (int) session.getAttribute("job_role_id");

				JobRole job = JobRoleDao.getJobRoleByid(job_role_id);
				ArrayList<Skills> skillList = SkillsDao.getSkillList(job_role_id);
				%>
				<h2><%=job.getJob_title()%></h2>
				<div class="card " style="background-color: #e3f4fc">
					<div class="card-body">
						<div class="text-center p-2">
							<form onsubmit="return validateSkill()" name="addSkillForm" action="saveskill" method="post">
								<div class="row m-2">
									<div class="col-4">
										<strong>Add Skill</strong>
									</div>
									<div class="col-8">
										<input type="text" name="skill" id="skill" required autocomplete="off"> <input type="hidden" name="job_role_id" value="<%=job_role_id%>">
									</div>
								</div>

								<div class="text-center p-2 m-3">
									<input class="btn btn-primary" type="submit" value="Add skill">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- End Of Card -->
			</div>

			<div class="col-md-5 offset-1">
				<div class="skill_list">
					<%
					if (skillList.isEmpty()) {
					%>
					<h5>no record available</h5>

					<%
					} //End of if

					else {
					%>
					<table class="table">
						<tr>
							<th>#</th>
							<th>Skills</th>
						</tr>
						<%
						for (int i = 0; i < skillList.size(); i++) {
							Skills skill = skillList.get(i);
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><%=skill.getSkill_name()%></td>
							<td>
								<!-- this form update skill name goto UpdateSkillName servlet -->
								<form action="gotoupdateskillname" method="post">
									<input class="btn btn-info" type="submit" value="Update Name"> <input type="hidden" name="skill_name" value="<%=skill.getSkill_name()%>"> <input type="hidden" name="skill_id"
										value="<%=skill.getSkill_id()%>"> <input type="hidden" name="job_role_id" value="<%=job_role_id%>">
								</form>
							</td>
						</tr>

						<%
						} //End of for loop
						%>
					</table>
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
	var list = [<%for (int i = 0; i < skillList.size(); i++) {
	Skills skill = (Skills) skillList.get(i);%>
	            	"<%=skill.getSkill_name().toLowerCase()%>"
	            	<%=i + 1 < skillList.size() ? "," : ""%>
	            <%}%>];
	//check avability of job
	function validateSkill() {
		var skill=document.getElementById("skill");
		
		if(list.includes(skill.value.toLowerCase()))
		{
			alert(skill.value +" is Already available");
			document.addSkillForm.reset();	
			return false;
		}
	
	}
	
</script>
</body>
</html>