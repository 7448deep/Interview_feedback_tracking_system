<%@page import="org.apache.el.parser.AstDiv"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>
<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Candidate</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row ">
			<div class="col-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-10 ">
				<!-- back to profile btn -->
				<div class="row m-2">
					<div class="col-2">
						<a href="CandidateProfile.jsp" class="btn btn-primary">Go-Back-To Profile</a>
					</div>
				</div>
				<div class="row">
					<%
						int candidate_id = (int) session.getAttribute("candidate_id");
		
						Candidate candidate = CandidateDao.getCandidateById(candidate_id);
						JobRole job_role = JobRoleDao.getJobRoleByid(candidate.getAppliedforrole());
						%>
					<!-- Update profile form -->
					<div class="col">
						<h5 class="text-primary mb-1">Update Personal Info</h5>
						<div class="card_body p-4 ms-1 me-1" style="border: 1px solid #c7c5c5;">
							<form onsubmit="return validateCandidateForm()" action="updatecandidate" method="post">
								<!-- Name -->
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputfname" class="form-label"><span class="inputError">*</span>Name: </label>
									</div>
									<div class="col-4">
										<input name="fname" id="fname" type="text" class="form-control" value="<%=candidate.getFname()%>" onclick="removeError('fname')"> <span class="inputError" id="fnameError"></span>
									</div>
									<div class="col-4 ">
										<input name="lname" id="lname" type="text" class="form-control" value="<%=candidate.getLname()%>" onclick="removeError('lname')"> <span class="inputError" id="lnameError"></span>
									</div>
								</div>
								<!-- Mobile -->
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputmobileno" class="form-label"><span class="inputError">*</span>MobileNo</label>
									</div>
									<div class="col-8">
										<input name="mobileno" id="mobileno" type="number" class="form-control" value="<%=candidate.getMobileno()%>" onclick="removeError('mobileno')"> <span class="inputError"
											id="mobilenoError"></span>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputemailid" class="form-label"><span class="inputError">*</span>Email Id</label>
									</div>
									<div class="col-8">
										<input name="emailid" id="emailid" type="email" class="form-control" value="<%=candidate.getEmailid()%>" onclick="removeError('emailid')"> <span class="inputError" id="emailidError"></span>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputhighqualification" class="form-label"><span class="inputError">*</span>Highest Qualification</label>
									</div>
									<div class="col-8">
										<input name="highqualification" id="highqualification" type="text" class="form-control" value="<%=candidate.getHighqualification()%>" onclick="removeError('highqualification')"> <span
											class="inputError" id="highqualificationError"></span>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputappliedforrole" class="form-label"><span class="inputError">*</span>Applied For Role</label>
									</div>
									<div class="col-8">
										<select class="form-select" name="appliedforrole" class="form-control" id="appliedforrole" onchange="removeError('appliedforrole')">
											<option value="<%=job_role.getJob_role_id()%>" selected><%=job_role.getJob_title()%></option>
											<%
											ArrayList joblist = JobRoleDao.getListJob();
											for (int i = 0; i < joblist.size(); i++) {
												JobRole job = (JobRole) joblist.get(i);
											%>
											<option value="<%=job.getJob_role_id()%>"><%=job.getJob_title()%></option>
											<%
											}
											%>
										</select> <span class="inputError" id="appliedforroleError"></span>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputtotalyearofexperience" class="form-label"><span class="inputError">*</span>Experience</label>
									</div>
									<div class="col-8">
										<input name="totalyearofexperience" id="totalyearofexperience" type="number" class="form-control" min="0" value="<%=candidate.getTotalyearofexperience()%>"
											onclick="removeError('totalyearofexperience')" onchange="checkexp()"> <span class="inputError" id="totalyearofexperienceError"></span>
									</div>
								</div>
								<div class="row mb-3" id="preorg">
									<div class="col-4">
										<label for="inputpreviousorg" class="form-label"><span class="inputError">*</span>Pre-Organization</label>
									</div>
									<div class="col-8">
										<input name="previousorg" id="previousorg" type="text" class="form-control" value="<%=candidate.getPreviousorg()%>" onclick="removeError('previousorg')"> <span class="inputError"
											id="previousorgError"></span>
									</div>

								</div>
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputcoreskills" class="form-label"><span class="inputError">*</span>Core Technical Skills</label>
									</div>
									<div class="col-8">
										<textarea rows="3" cols="2" name="coreskills" id="coreskills" class="form-control" onclick="removeError('coreskills')"><%=candidate.getCoreskills()%></textarea>
										<span class="inputError" id="coreskillsError"></span>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-4">
										<label for="inputinitialfeedback" class="form-label"><span class="inputError">*</span>Initial Feedback</label>
									</div>
									<div class="col-8">
										<textarea rows="2" cols="2" name="initialfeedback" id="initialfeedback" class="form-control" onclick="removeError('initialfeedback')"><%=candidate.getInitialfeedback()%></textarea>
										<span class="inputError" id="initialfeedbackError"></span>
									</div>
								</div>
								<div class="text-center mt-2">
									<input type="hidden" name="candidate_id" value="<%=candidate_id%>"> <input class="btn btn-primary" id="submit" type="submit" value="Update">
								</div>
							</form>
						</div>
					</div>
					<!-- update status -->
					<div class="col">
						<!-- update Candidate status -->
						<div class="row">
							<div class="col-10 offset-1">
								<h5 class="text-primary">Update Candidate Status</h5>
								<div class="card_heading row p-4 " >
									<div class="col-4 offset-1">
										<strong>Current Status</strong>
									</div>
									<div class="col-7">
										<%
										if (candidate.getCandidate_status() == 0) {
										%>
										<h4>No Schedules</h4>
										<%
										} else if (candidate.getCandidate_status() == 1) {
										%>
										<h4>Interview -Ongoing</h4>
										<%
										} else if (candidate.getCandidate_status() == 2) {
										%>
										<h4>Rejected</h4>
										<%
										} else if (candidate.getCandidate_status() == 3) {
										%>
										<h4>Selected</h4>
										<%
										} else if (candidate.getCandidate_status() == 4) {
										%>
										<h4>Offer-Letter-Given</h4>
										<%
										}else if (candidate.getCandidate_status() == 5) {
										%>
										<h4>Offer-Letter-Accepted</h4>
										<%
										} else if (candidate.getCandidate_status() == 6) {
										%>
										<h4>Offer-Letter-Rejected by Candidate</h4>
										<%
										} else if (candidate.getCandidate_status() == 7) {
										%>
										<h4>On-Notice-Period</h4>
										<%
										} else if (candidate.getCandidate_status() == 8) {
										%>
										<h4>Joined-Team</h4>
										<%
										}
										%>
		
									</div>
								</div>
								<div class="card_body row p-4 mt-1" >
									<form action="change_candidate_status" method="post">
										<div class="row mb-4 p-3">
											<div class="col-4 offset-1">
												<strong>ChangeTo</strong>
											</div>
											<div class="col-7">
												<select class="form-select" name="candidate_status" style="width: 100%;">
													<option value="">-select-</option>
													<option value="1">Interview-On</option>
													<option value="2">Rejected</option>
													<option value="3">Selected</option>
													<option value="4">Offer-letter-Given</option>
													<option value="5">Offer-letter-Accepted</option>
													<option value="6">Offer-letter-Rejected</option>
													<option value="7">On-Notice-Period</option>
													<option value="8">Joined-Team</option>
													
												</select>
											</div>
		
										</div>
										<div class="row text-center">
											<div class="col-4 offset-4">
												<input type="hidden" name="candidate_id" value="<%=candidate_id%>"> <input class="btn btn-success" type="submit" value="Submit">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- update Assignment status -->
						<div class="row mt-2">
							<div class="col-10 offset-1">
								<h5 class="text-primary">Update Assignment Status</h5>
								<div class="card_heading row p-4 " >
									<div class="col-4 offset-1">
										<strong>Current Status</strong>
									</div>
									<div class="col-7">
										<%
										if (candidate.getAssignment_status() == 0) {
										%>
											<strong>Assignment not Given to Candidate</strong>
										<%
										} else if (candidate.getAssignment_status() == 1) {
										%>
											<strong>Assignment has Given to Candidate</strong>
										<%
										} else if (candidate.getAssignment_status() == 2) {
										%>
											<strong>Assignment Completed by Candidate</strong>
										<%
										} 
										%>
									</div>
								</div>
								<div class="card_body row p-4 " >
									<form action="change_candidate_assignment_status" method="post">
										<div class="row mb-4 p-3">
											<div class="col-4 offset-1">
												<strong>ChangeTo</strong>
											</div>
											<div class="col-7">
												<select class="form-select" name="assignment_status" style="width: 100%;">
													<option value="">-select-</option>
													<option value="0">Not-Given</option>
													<option value="1">Given</option>
													<option value="2">Completed</option>
													
												</select>
											</div>
										</div>
										<div class="row text-center">
											<div class="col-4 offset-4">
												<input type="hidden" name="candidate_id" value="<%=candidate_id%>"> <input class="btn btn-success" type="submit" value="Submit">
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
	</div>
				
			
	<script>
	$( document ).ready(function() {
		var candidate_status='<%=candidate.getCandidate_status()%>';
			if (candidate_status == 0) {
				$(".card_heading").css({
					backgroundColor : "#b3b4b5", "border":"1px solid #c7c5c5","border-radius":"8px"
				});
				$(".card_body").css({
					backgroundColor : "#e1e1e3","border":"1px solid #c7c5c5","border-radius":"8px"
				})

			} else if (candidate_status == 1) {
				$(".card_heading").css({
					backgroundColor : "#5cd1f7","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#e3f4fc","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 2) {
				$(".card_heading").css({
					backgroundColor : "#f72862","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#fc7276","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 3) {
				$(".card_heading").css({
					backgroundColor : "#a6fa82","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#dbfccc","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 4) {
				$(".card_heading").css({
					backgroundColor : "#5effda","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#c0faed","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 5) {
				$(".card_heading").css({
					backgroundColor : "#a6fa82","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#dbfccc","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 6) {
				$(".card_heading").css({
					backgroundColor : "#f72862","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#fc7276","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 7) {
				$(".card_heading").css({
					backgroundColor : "#5cd1f7","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#e3f4fc","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			} else if (candidate_status == 8) {
				$(".card_heading").css({
					backgroundColor : "#dd7efc","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
				$(".card_body").css({
					backgroundColor : "#f2ccff","border":"1px solid #c7c5c5", "border-radius":"8px"
				})
			}
			
		});

		//this fun checks exp 
		function checkexp() {
			//if exp=0 previous organization field will hide
			if (document.getElementById("totalyearofexperience").value == 0) {
				document.getElementById("preorg").style.display = "none";
			} else {
				document.getElementById("preorg").style.display = "block";
			}
		}

		//checks email is valid

		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}

		//this fun remove error msg from input field
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";
		}

		//checks all data is valid format
		function validateCandidateForm() {
			var fname = document.getElementById("fname");
			var lname = document.getElementById("lname");
			var mobileno = document.getElementById("mobileno");
			var emailid = document.getElementById("emailid");
			var highqualification = document
					.getElementById("highqualification");
			var totalyearofexperience = document
					.getElementById("totalyearofexperience");
			var previousorg = document.getElementById("previousorg");
			var coreskills = document.getElementById("coreskills");
			var appliedforrole = document.getElementById("appliedforrole");
			var initialfeedback = document.getElementById("initialfeedback");

			var cnt = 0;

			//checks is fname empty
			if (fname.value.trim() == "") {
				fname.style.border = "solid 2px red";
				document.getElementById("fnameError").innerHTML = "*Please Enter First Name";

				cnt++;
			} else {
				fname.style.border = "solid 2px green";
			}

			//checks is lname empty 
			if (lname.value.trim() == "") {
				lname.style.border = "solid 2px red";
				document.getElementById("lnameError").innerHTML = "*Please Enter Last Name";

				cnt++;
			} else {
				lname.style.border = "solid 2px green";
			}

			//checks is lname empty 
			if (mobileno.value.length<10||mobileno.value.length>10) {
				mobileno.style.border = "solid 2px red";
				document.getElementById("mobilenoError").innerHTML = "*Please Enter 10 digit valid mobileNo";

				cnt++;
			} else {
				mobileno.style.border = "solid 2px green";
			}

			//checks is email valid
			var validemaild = validateEmail(emailid.value);
			if (validemaild == false) {
				emailid.style.border = "solid 2px red";
				document.getElementById("emailidError").innerHTML = "*Please Enter valid EmailId";
				cnt++;
			} else {
				emailid.style.border = "solid 2px green";
			}

			//checks is highest qualification empty
			if (highqualification.value.trim() == "") {
				highqualification.style.border = "solid 2px red";
				document.getElementById("highqualificationError").innerHTML = "*Please Enter Highest qualification";

				cnt++;
			} else {
				highqualification.style.border = "solid 2px green";
			}

			//checks is Experience empty
			if (totalyearofexperience.value.trim() == "") {
				totalyearofexperience.style.border = "solid 2px red";
				document.getElementById("totalyearofexperienceError").innerHTML = "*Please Enter Exp If no enter 0";

				cnt++;
			} else {
				totalyearofexperience.style.border = "solid 2px green";
			}

			if (totalyearofexperience.value != 0) {
				//checks if org is empty
				if (previousorg.value.trim() == "") {
					previousorg.style.border = "solid 2px red";
					document.getElementById("previousorgError").innerHTML = "*Please Enter previous Org If no enter Freelancer";

					cnt++;
				} else {
					previousorg.style.border = "solid 2px green";
				}
			}

			//checks is core skills empty
			if (coreskills.value.trim() == "") {
				coreskills.style.border = "solid 2px red";
				document.getElementById("coreskillsError").innerHTML = "*Please Enter Atleast 1 Coreskill";

				cnt++;
			} else {
				coreskills.style.border = "solid 2px green";
			}

			//checks is applied for empty
			if (appliedforrole.value.trim() == "") {
				appliedforrole.style.border = "solid 2px red";
				document.getElementById("appliedforroleError").innerHTML = "*Please Select role";

				cnt++;
			} else {
				document.getElementById("appliedforroleError").innerHTML = "";
				appliedforrole.style.border = "solid 2px green";
			}

			//check is initial feedback empty 
			if (initialfeedback.value.trim() == "") {
				initialfeedback.style.border = "solid 2px red";
				document.getElementById("initialfeedbackError").innerHTML = "*Please Enter Initial Feedback";

				cnt++;
			} else {
				initialfeedback.style.border = "solid 2px green";
			}

			//cnt==0==noError
			if (cnt != 0) {
				return false;
			}

		}
	</script>
</body>
</html>