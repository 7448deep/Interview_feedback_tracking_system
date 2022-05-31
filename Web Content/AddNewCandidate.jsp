<%@page import="com.model.JobRole"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.JobRoleDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Candidate</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body onload="clearform()" style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<!--End of sidenav  -->

			<!-- Candidate Form -->
			<div class="col-md-8 offset-1 mt-4">
				<div class="card p-3" style="background-color: #e3f4fc">
					<h2 class="text-center text-primary mb-2">Add New Candidate</h2>
					<div class="card-body p-4">

						<form onsubmit="return validateCandidateForm()" action="savecandidate" method="post" name="candidateform" enctype="multipart/form-data">
							<div class="row mb-3">
								<div class="col-2">
									<label for="inputresume" class="form-label"><span class="inputError">*</span>Upload Resume: </label>
								</div>
								<div class="col-6">
									<input type="file" name="resume" id="resume" onclick="removeError('resume')"> <span class="inputError" id="resumeError"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-2">
									<label for="inputfname" class="form-label"><span class="inputError">*</span>Name: </label>
								</div>
								<div class="col-2">
									<input name="fname" id="fname" type="text" class="form-control" placeholder="First Name" onclick="removeError('fname')" autocomplete="off"> <span class="inputError" id="fnameError"></span>
								</div>
								<div class="col-2 ">
									<input name="lname" id="lname" type="text" class="form-control" placeholder="Last Name" onclick="removeError('lname')" autocomplete="off"> <span class="inputError" id="lnameError"></span>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-2">
									<label for="inputmobileno" class="form-label"><span class="inputError">*</span>MobileNo</label>
								</div>
								<div class="col-4">
									<input name="mobileno" id="mobileno" type="number" class="form-control" placeholder="Mobile no" onclick="removeError('mobileno')" autocomplete="off"> <span class="inputError"
										id="mobilenoError"></span>
								</div>
								<div class="col-2">
									<label for="inputemailid" class="form-label"><span class="inputError">*</span>Email Id</label>
								</div>
								<div class="col-4">
									<input name="emailid" id="emailid" type="email" class="form-control" placeholder="Email Id" onclick="removeError('emailid')" autocomplete="off"> <span class="inputError"
										id="emailidError"></span>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-2">
									<label for="inputhighqualification" class="form-label"><span class="inputError">*</span>Highest Qualification</label>
								</div>
								<div class="col-4">
									<input name="highqualification" id="highqualification" type="text" class="form-control" placeholder="Enter Qualification" onclick="removeError('highqualification')" autocomplete="off">
									<span class="inputError" id="highqualificationError"></span>
								</div>
								<div class="col-2">
									<label for="inputappliedforrole" class="form-label"><span class="inputError">*</span>Applied For Role</label>
								</div>
								<div class="col-4">
									<select name="appliedforrole" class="form-select" id="appliedforrole" onchange="removeError('appliedforrole')">
										<option value="">-Select Role-</option>
										<%
										ArrayList<JobRole> joblist = JobRoleDao.getListJob();
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
								<div class="col-2">
									<label for="inputtotalyearofexperience" class="form-label"><span class="inputError">*</span>Experience</label>
								</div>
								<div class="col-4">
									<input name="totalyearofexperience" id="totalyearofexperience" type="number" class="form-control" placeholder="Enter Total YOE" min="0" onclick="removeError('totalyearofexperience')"
										onchange="checkexp()"> <span class="inputError" id="totalyearofexperienceError"></span>
								</div>

								<div class="col-6" id="preorg">
									<div class="row">
										<div class="col-4">
											<label for="inputpreviousorg" class="form-label"><span class="inputError">*</span>Pre-Organization</label>
										</div>
										<div class="col-8">
											<input name="previousorg" id="previousorg" type="text" class="form-control" placeholder=" Previous Organization" onclick="removeError('previousorg')" autocomplete="off"> <span
												class="inputError" id="previousorgError"></span>
										</div>
									</div>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-2">
									<label for="inputcoreskills" class="form-label"><span class="inputError">*</span>Core Technical Skills</label>
								</div>
								<div class="col-4">
									<textarea rows="3" cols="2" name="coreskills" id="coreskills" class="form-control" placeholder="Enter core Skills" onclick="removeError('coreskills')" autocomplete="off"></textarea>
									<span class="inputError" id="coreskillsError"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-2">
									<label for="inputinitialfeedback" class="form-label"><span class="inputError">*</span>Initial Feedback</label>
								</div>
								<div class="col-4">
									<textarea rows="3" cols="2" name="initialfeedback" id="initialfeedback" class="form-control" placeholder="Enter initial feedback" onclick="removeError('initialfeedback')" autocomplete="off"></textarea>
									<span class="inputError" id="initialfeedbackError"></span>
								</div>
							</div>
							<div class="text-center mt-5">
								<input class="btn btn-primary" id="submit" type="submit" value="Submit">
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- End Of Row class -->
	</div>
	<!-- End Of container class -->

	<script>
		//this function clear form data after page reload
		function clearform() {
			document.candidateform.reset();
		}
		
		//this fun modify css of previous org field based on experience 
		function checkexp() {
			//if exp=0 previous organization field will hide
			if (document.getElementById("totalyearofexperience").value == 0) {
				document.getElementById("preorg").style.display = "none";
			} else {
				document.getElementById("preorg").style.display = "block";
			}
		}

		//this function checks is email valid
		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}

		//this fun remove error msg from input field
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";
			document.getElementById(id).style.border = "solid 1px #d9d9d9";
		}

		//	this function cheks all the data is valid from input
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

			//cnt is for check error count
			var cnt = 0;

			 //resume validation
		 	var inputfile=document.getElementById("resume");
			let files=resume.files;
			if(files.length>0)
			{
				//200*1024=200kb
				if(files[0].size>500*1024)
				{
					document.getElementById("resumeError").innerHTML = "*File size Too Much";	
					cnt++;
				}
			}
			else
			{
				document.getElementById("resumeError").innerHTML = "*Plese Select File";
				cnt++;;
			}
	        
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

			//checks is Experience zero
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

			//checks if error available (cnt==0 - no error )(cnt!=0 -error)
			if (cnt != 0) {
				return false;
			}
			if(cnt==0)
			{
				document.getElementById("submit").disabled=true;
			}
		}
	</script>
</body>
</html>