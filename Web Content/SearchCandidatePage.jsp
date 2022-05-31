
<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="com.model.Employee"%>
<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.model.Candidate"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Candidate</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>

</head>
<body style="background-color: #f0f0f0">
	<script>
		function changeSearchByDiv() {
			var select_value = document.getElementById("searchby");
			if (select_value.value == "") {
				SearchByCandidateDiv.style.display = "none";
				SearchByInterviewerDiv.style.display = "none";
				SearchByJobRoleDiv.style.display = "none";
				SearchByDateDiv.style.display = "none";
				SearchBySelectedDiv.style.display = "none";
				SearchByRejectedDiv.style.display = "none";
			} else if (select_value.value == 1) {
				SearchByCandidateDiv.style.display = "block";
				SearchByInterviewerDiv.style.display = "none";
				SearchByJobRoleDiv.style.display = "none";
				SearchByDateDiv.style.display = "none";
				SearchBySelectedDiv.style.display = "none";
				SearchByRejectedDiv.style.display = "none";
			} else if (select_value.value == 2) {
				SearchByInterviewerDiv.style.display = "block";
				SearchByCandidateDiv.style.display = "none";
				SearchByJobRoleDiv.style.display = "none";
				SearchByDateDiv.style.display = "none";
				SearchBySelectedDiv.style.display = "none";
				SearchByRejectedDiv.style.display = "none";
			} else if (select_value.value == 3) {
				SearchByJobRoleDiv.style.display = "block";
				SearchByCandidateDiv.style.display = "none";
				SearchByInterviewerDiv.style.display = "none";
				SearchByDateDiv.style.display = "none";
				SearchBySelectedDiv.style.display = "none";
				SearchByRejectedDiv.style.display = "none";
			} else if (select_value.value == 4) {
				SearchByDateDiv.style.display = "block";
				SearchByCandidateDiv.style.display = "none";
				SearchByInterviewerDiv.style.display = "none";
				SearchByJobRoleDiv.style.display = "none";
				SearchBySelectedDiv.style.display = "none";
				SearchByRejectedDiv.style.display = "none";
			} else if (select_value.value == 5) {
				SearchBySelectedDiv.style.display = "block";
				SearchByCandidateDiv.style.display = "none";
				SearchByInterviewerDiv.style.display = "none";
				SearchByJobRoleDiv.style.display = "none";
				SearchByDateDiv.style.display = "none";
				SearchByRejectedDiv.style.display = "none";
			} else if (select_value.value == 6) {
				SearchByRejectedDiv.style.display = "block";
				SearchByCandidateDiv.style.display = "none";
				SearchByInterviewerDiv.style.display = "none";
				SearchByJobRoleDiv.style.display = "none";
				SearchByDateDiv.style.display = "none";
				SearchBySelectedDiv.style.display = "none";
			}
		}
	</script>
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row ">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col">
				<div class="card p-4 mt-2" style="background-color: #5cd1f7">				
					<div class="row ">
						<div class="col-5">
							<div class="row">
								<div class="col-4"><strong>Select Search By</strong></div>
								<div class="col-5">
									<select class="form-select" name="searchby" id="searchby" style="width: 100%" onchange="changeSearchByDiv()">
										<option value="" class="text-center">-Select-</option>
										<option value="1" >Candidate</option>
										<option value="2" >Interviewer</option>
										<option value="3" >JobRole</option>
										<option value="4" >Date</option>
										<option value="5" >Selected</option>
										<option value="6" >Rejected</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-7">
							<div id="SearchByCandidateDiv" style="display: none">
								<div class="row">
									<div class="col-3"><strong>Search by Candidate</strong></div>
									<div class="col-7">
										<form onsubmit="return validateSearchByCandidateForm()" action="searchcandidate" method="post">
											<input type="hidden" name="searchby" value="candidate">
											<div class="row">
												<div class="col-10">
													<select class="form-select" name="candidate_id" class="custom-select" id="candidate_id" onchange="removeError('candidate_id')" style="width: 100%">
														<option value=0 class="text-center">--Select Candidate--</option>
														<%
														ArrayList<Candidate> candidates = CandidateDao.getCandidateList();
														for (int i = 0; i < candidates.size(); i++) {
															Candidate c = (Candidate) candidates.get(i);
								
															String firstname = c.getFname();
															String lastname = c.getLname();
	
															int candidate_id = c.getCandidate_id();
															JobRole job=JobRoleDao.getJobRoleByid(c.getAppliedforrole());
														%>
														<option value="<%=candidate_id%>">
															<%
															out.print(firstname + " " + lastname+" [ "+job.getJob_title()+" ]");
															%>
														</option>
														<%
														}
														%>
													</select>
												</div>
												<div class="col-2">
													<input class="btn btn-primary" type="submit" value="Submit">
												</div>
											</div>
										</form>
									</div>
									<div>
										<span class="inputError" id="candidate_idError"></span>
									</div>
								</div>
							</div>
							<div id="SearchByInterviewerDiv" style="display: none">
								<div class="row">
									<div class="col-4"><strong>Search by Interviewer</strong></div>
									<div class="col-7">
										<form onsubmit="return validateSearchByInterviewerForm()" action="searchcandidate" method="post">
											<input type="hidden" name="searchby" value="interviewer">
											<div class="row">
												<div class="col-10">
													<select class="form-select" name="employee_id" class="custom-select" id="employee_id" onchange="removeError('employee_id')" style="width: 100%">
														<option value=0 class="text-center">--Select Interviewer--</option>
														<%
														ArrayList<Employee> employees = EmployeeDao.getEmployeeList();
														for (int i = 0; i < employees.size(); i++) {
															Employee c = (Employee) employees.get(i);
	
															int employee_id = c.getEmployee_id();
															String name = c.getEmployee_name();
														%>
														<option value="<%=employee_id%>">
															<%
															out.print(name);
															%>
														</option>
														<%
														}
														%>
													</select>
												</div>
												<div class="col-2">
													<input class="btn btn-primary" type="submit" value="Submit">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div>
									<span class="inputError" id="employee_idError"></span>
								</div>
	
							</div>
							<div id="SearchByJobRoleDiv" style="display: none">
								<div class="row">
									<div class="col-3"><strong>Search By JobRole</strong></div>
									<div class="col-7">
										<form onsubmit="return validateSearchByJobRoleForm()" action="searchcandidate" method="post">
											<input type="hidden" name="searchby" value="jobrole">
											<div class="row">
												<div class="col-10">
													<select class="form-select" name="Job_role_id" class="custom-select" id="Job_role_id" onchange="removeError('Job_role_id')" style="width: 100%">
														<option value=0 class="text-center">--Select Role--</option>
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
												<div class="col-2">
													<input class="btn btn-primary" type="submit" value="Submit">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div>
									<span class="inputError" id="Job_role_idError"></span>
								</div>
							</div>
							<div id="SearchByDateDiv" style="display: none">
								<div class="row">
									<div class="col-3"><strong>Search By Date</strong></div>
									<div class="col-9" >
										<form onsubmit="return validateSearchByDateForm()" action="searchcandidate" method="post">
											<input type="hidden" name="searchby" value="date">
	
											<div class="row" >
												<div class="col-10" >
													<div class="row">
														<div class="col-5">
															<input class="form-control" type="date" name="sdate" id="sdate" onchange="removeErrorofDate('date')"> 														
														</div>
														<div class="col-2">
															<strong>To</strong>
														</div>
														<div class="col-5">
															 <input class="form-control"   type="date" name="edate" id="edate" onchange="removeErrorofDate('date')">
														</div>													
													</div>
	
												</div>
												<div class="col-2">
													<input class="btn btn-primary" type="submit" value="Submit">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div>
									<span class="inputError" id="dateError"></span>
								</div>
							</div>
							<div id="SearchBySelectedDiv" style="display: none">
								<div class="row">
									<div class="col-3"><strong>Search By Selected</strong></div>
									<div class="col-7">
										<form onsubmit="return validateSearchBySelectedForm()" action="searchcandidate" method="post">
											<input type="hidden" name="searchby" value="candidate">
											<div class="row">
												<div class="col-10">
													<select class="form-select"  name="candidate_id" class="custom-select" id="selected_candidate_id" onchange="removeError('selected_candidate_id')" style="width: 100%">
														<option value=0 class="text-center">--Select Candidate--</option>
														<%
														ArrayList<Candidate> selectedcandidateList = CandidateDao.getSelectedCandidateList();
														for (int i = 0; i < selectedcandidateList.size(); i++) {
															Candidate c = (Candidate) selectedcandidateList.get(i);
	
															String firstname = c.getFname();
															String lastname = c.getLname();
	
															int candidate_id = c.getCandidate_id();
															JobRole job=JobRoleDao.getJobRoleByid(c.getAppliedforrole());
														%>
														<option value="<%=candidate_id%>">
															<%
															out.print(firstname + " " + lastname+" [ "+job.getJob_title()+" ]");
															%>
														</option>
														<%
														}
														%>
													</select>
												</div>
												<div class="col-2">
													<input class="btn btn-primary" type="submit" value="Submit">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div>
									<span class="inputError" id="selected_candidate_idError"></span>
								</div>
							</div>
							<div id="SearchByRejectedDiv" style="display: none">
								<div class="row">
									<div class="col-3"><strong>Search By Rejected</strong></div>
									<div class="col-7">
										<form onsubmit="return validateSearchByRejectedForm()" action="searchcandidate" method="post">
											<input type="hidden" name="searchby" value="candidate">
											<div class="row">
												<div class="col-10">
													<select class="form-select" name="candidate_id" class="custom-select" id="rejected_candidate_id" onchange="removeError('rejected_candidate_id')" style="width: 100%">
														<option value=0 class="text-center">--Select Candidate--</option>
														<%
														ArrayList<Candidate> rejectedcandidateList = CandidateDao.getRejectedCandidateList();
														for (int i = 0; i < rejectedcandidateList.size(); i++) {
															Candidate c = (Candidate) rejectedcandidateList.get(i);
	
															String firstname = c.getFname();
															String lastname = c.getLname();
	
															int candidate_id = c.getCandidate_id();
															JobRole job=JobRoleDao.getJobRoleByid(c.getAppliedforrole());
														%>
														<option value="<%=candidate_id%>">
															<%
															out.print(firstname + " " + lastname+" [ "+job.getJob_title()+" ]");
															%>
														</option>
														<%
														}
														%>
													</select>
												</div>
												<div class="col-2">
													<input class="btn btn-primary" type="submit" value="Submit">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div>
									<span class="inputError" id="rejected_candidate_idError"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function removeErrorofDate(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById("sdate").style.border = "solid 1px #d9d9d9";
			document.getElementById("edate").style.border = "solid 1px #d9d9d9";

		}
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";

		}
		function validateSearchByCandidateForm() {
			var candidate_id = document.getElementById("candidate_id");
			if (candidate_id.value == 0) {
				candidate_id.style.border = "solid 2px red";
				document.getElementById("candidate_idError").innerHTML = "*Please Select Candidate";

				return false;
			}

		}

		function validateSearchByInterviewerForm() {
			var employee_id = document.getElementById("employee_id");
			if (employee_id.value == 0) {
				employee_id.style.border = "solid 2px red";
				document.getElementById("employee_idError").innerHTML = "*Please Select Employee";

				return false;
			}

		}

		function validateSearchByJobRoleForm() {
			var Job_role_id = document.getElementById("Job_role_id");
			if (Job_role_id.value == 0) {
				Job_role_id.style.border = "solid 2px red";
				document.getElementById("Job_role_idError").innerHTML = "*Please Select JobRole";

				return false;
			}

		}

		function validateSearchByDateForm() {
			var startDate = document.getElementById("sdate");
			var endDate = document.getElementById("edate");

			if (startDate.value == "") {
				sdate.style.border = "solid 2px red";
				document.getElementById("dateError").innerHTML = "*Please Select Starting Date";
				return false;

			}
			if (endDate.value == "") {
				edate.style.border = "solid 2px red";
				document.getElementById("dateError").innerHTML = "*Please Select Ending Date";
				return false;

			}

		}

		function validateSearchBySelectedForm() {
			var candidate_id = document.getElementById("selected_candidate_id");
			if (candidate_id.value == 0) {
				Job_role_id.style.border = "solid 2px red";
				document.getElementById("selected_candidate_idError").innerHTML = "*Please Select Candidates";

				return false;
			}

		}
		function validateSearchByRejectedForm() {
			var candidate_id = document.getElementById("rejected_candidate_id");
			if (candidate_id.value == 0) {
				Job_role_id.style.border = "solid 2px red";
				document.getElementById("rejected_candidate_idError").innerHTML = "*Please Select Candidates";

				return false;
			}

		}
	</script>
</body>
</html>