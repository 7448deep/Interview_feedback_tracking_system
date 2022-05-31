
<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="com.dao.Interview_ScheduleDao"%>
<%@page import="com.model.Interview_Schedule"%>
<%@page import="com.model.Employee"%>
<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule Interview</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.schedule_list {
	height: 600px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}

.inputError {
	color: red;
	font-size: 12px;
	
}
</style>



</head>
<body style="background-color: #f0f0f0">

	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-md-6">
				<div class="schedule_list">
					<%
					ArrayList<Candidate> candidates = CandidateDao.getCandidateList();
					ArrayList<Employee> employees = EmployeeDao.getEmployeeList();
					ArrayList<Interview_Schedule> scheduleList = Interview_ScheduleDao.getInterviewScheduleList();
					%>
					<h3>Interview Schedule</h3>
					<%
					if (scheduleList.isEmpty()) {
					%>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>No Records available</td>
							</tr>
						</tbody>
					</table>
					<%
					} else {
					%>



					<div id="Ongoing_Schedule">
					
						<div class="row p-1">
							<div class="col-3">
								<button onclick="showCompletedtable()" id="complted-btn" class="btn btn-primary">Goto Completed</button>	
							</div>
						</div>
						<div  class="card p-3 mb-1" style="background-color: #5cd1f7">
							<div class="row">
								<div class="col-2"><strong>Panel</strong></div>
								<div class="col-2"><strong>Candidate</strong></div>
								<div class="col-1"><strong>RNo</strong></div>
								<div class="col-2"><strong>Date</strong></div>
								<div class="col-3"><strong>Time</strong></div>
								<div class="col-2"><strong>Action</strong></div>
							</div>
						</div>
								<%
								int cnt1 = 0;
								for (int i = scheduleList.size() - 1; i >= 0; i--) {
									Interview_Schedule schedule = scheduleList.get(i);
									if (schedule.getIscomplete() == 1) {
										continue;
									}
									Employee emp = EmployeeDao.getEmployeeById(schedule.getEmployee_id());
									Candidate candidate = CandidateDao.getCandidateById(schedule.getCandidate_id());
									int iscomplte = schedule.getIscomplete();
									
								%>
								<div  class="card p-3" style="background-color: #e3f4fc">
									<div class="row">
										<div class="col-2"><%=emp.getEmployee_name()%></div>
										<div class="col-2"><%=candidate.getFname() + " " + candidate.getLname()%></div>
										<div class="col-1"><%=schedule.getRound_no()%></div>
										<div class="col-2"><%=schedule.getDate()%></div>
										<div class="col-3"><%=schedule.getStart_time()+"-"+schedule.getEnd_time() %></div>
										<div class="col-2">
											<form action="gotoreschedule" method="post">
												<input type="hidden" name="schedule_id" value="<%=schedule.getInterview_schedule_id()%>"> <input class="btn btn-primary" type="submit" value="Update">
											</form>
										</div>
									</div>
								</div>
								
								<%
								}
								%>
						
					</div>


					<div id="Completed_Schedule" style="display: none">
						<div class="row p-1">
							<div class="col-3">
								<button onclick="showOngoingtable()" id="ongoing-btn" class="btn btn-primary">Goto OnGoing</button>
							</div>
						</div>
						<div  class="card p-3 mb-1" style="background-color: #5cd1f7">
							<div class="row">
								<div class="col-2"><strong>Panel</strong></div>
								<div class="col-3"><strong>Candidate</strong></div>
								<div class="col-2"><strong>Round No.</strong></div>
								<div class="col-2"><strong>Date</strong></div>
								<div class="col-3"><strong>Time</strong></div>
								
							</div>
						</div>
						<%
								int cnt2 = 0;
								for (int i = scheduleList.size() - 1; i >= 0; i--) {
									Interview_Schedule schedule = scheduleList.get(i);
									if (schedule.getIscomplete() == 0) {
										continue;
									}
									Employee emp = EmployeeDao.getEmployeeById(schedule.getEmployee_id());
									Candidate candidate = CandidateDao.getCandidateById(schedule.getCandidate_id());
									int iscomplte = schedule.getIscomplete();
								%>
								<div  class="card p-3" style="background-color: #e3f4fc">
									<div class="row">
										<div class="col-2"><%=emp.getEmployee_name()%></div>
										<div class="col-3"><%=candidate.getFname() + " " + candidate.getLname()%></div>
										<div class="col-2"><%=schedule.getRound_no()%></div>
										<div class="col-2"><%=schedule.getDate()%></div>
										<div class="col-3"><%=schedule.getStart_time()+"-"+schedule.getEnd_time() %></div>
										
									</div>
								</div>
								
								<%
								}
								%>
						
					</div>

					<%
					}
					%>
				</div>
			</div>
			<div class="col-md-4">

				<%
				String scheduleType = (String) session.getAttribute("scheduleType");
				if (scheduleType == null) {
				%>
				<div class="card m-1 p-2" style="background-color: #5cd1f7">
					<div class="row text-center">
						<h1>Schedule Interview</h1>
					</div>
				</div>
				<div class="card m-1 " style="background-color: #e3f4fc">
					<div class="card-body">


						<form onsubmit="return validateSchedule()" action="scheduleinterview" method="post">
							<div class="row p-2">
								<div class="col-4">Select Candidate</div>
								<div class="col-8">
									<select class="form-select" name="candidate_id" id="candidate_id" onchange="checkcandidatedetails()" style="width: 100%;">
										<option value="" class="text-center">--Select--</option>
										<%
										for (int i = 0; i < candidates.size(); i++)
										{
											Candidate c = (Candidate) candidates.get(i);
											if (c.getCandidate_status() == 0 || c.getCandidate_status() == 1)
											{
												String firstname = c.getFname();
												String lastname = c.getLname();

												int Field = c.getCandidate_id();
												JobRole jobrole=JobRoleDao.getJobRoleByid(c.getAppliedforrole());
										%>
										<option value="<%=Field%>">
											<%
											out.print(firstname + " " + lastname+"  ["+jobrole.getJob_title()+"]");
											%>
										</option>
										<%
											}
										}
										%>
									</select>
								</div>
								<span class="inputError" id="candidate_idError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Select Type</div>
								<div class="col-8">
									<select class="form-select" name="round_type" id="round_type" style="width: 100%;" onchange="removeError('round_type')">
										<option value="" class="text-center">--Select--</option>
										<option value="1">Technical</option>
										<option value="2">MGMT/HR Round</option>
									</select>
								</div>
								<span class="inputError" id="round_typeError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Select Employee</div>
								<div class="col-8">
									<select class="form-select" name="employee_id" id="employee_id" style="width: 100%;" onchange="removeError('employee_id')">
										<option value="" class="text-center">--Select--</option>
										<%
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
								<span class="inputError" id="employee_idError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Round</div>
								<div class="col-8">
									<select class="form-select" name=round_no id="round_no" style="width: 100%;" onchange="removeError('round_no')">
									</select>
								</div>
								<span class="inputError" id="round_noError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Date</div>
								<div class="col-8">
									<input class="form-control" type="date" name="date" id="date" style="width: 100%;" onchange="removeError('date')">
								</div>
								<span class="inputError" id="dateError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Time</div>
								<div class="col-8">
									<div class="row">
										<div class="col-6">
											<input class="form-control" type="time" name="stime" id="stime" style="width: 100%;" onchange="removeError('date')">
										</div>
										<div class="col-6">
											<input class="form-control" type="time" name="etime" id="etime" style="width: 100%;" onchange="removeError('date')">
										</div>
									</div>
								</div>
								<span class="inputError" id="timeError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Select Platform</div>
								<div class="col-8">
									<select class="form-select" name="platform" id="platform" style="width: 100%;" onchange="checkMeetingLinkRequired()">
										<option value="" selected class="text-center">--Select--</option>
										<option value="F2F">F2F</option>
										<option value="Telephonic">Telephonic</option>
										<option value="Zoom-Meet">Zoom-Meet</option>
										<option value="Google-Meet">Google-Meet</option>
									</select>
								</div>
								<span class="inputError" id="platformError"></span>
							</div>
							<div class="row p-2" id="meetingLinkDiv">
								<div class="col-4">Meeting Link</div>
								<div class="col-8">
									<input class="form-control" type="text" id="meetingLink" name="meetingLink" autocomplete="off" style="width: 100%;" onclick="removeError('meetingLink')">
								</div>
								<span class="inputError" id="meetingLinkError"></span>
							</div>
							<hr>
							<div class="row m-4">
								<div class="col-4 offset-4">
									<input class="btn btn-success" id="scheduleSubmit" type="submit" value="Submit">
								</div>

							</div>
						</form>
					</div>
				</div>
				<%
				} else if (scheduleType.equals("reschedule")) {
				%>
				<%
				int schedule_id = (int) session.getAttribute("schedule_id");
				Interview_Schedule schedule = Interview_ScheduleDao.getSchedulebySchedule_id(schedule_id);
				Candidate candidate_res = CandidateDao.getCandidateById(schedule.getCandidate_id());
				Employee emp_res = EmployeeDao.getEmployeeById(schedule.getEmployee_id());
				int round_res = schedule.getRound_no();
				%>
				<div class="m-3">
					<button class="btn btn-primary" onclick="changeToSchedule()">Schedule New One</button>
				</div>
				<div class="card m-1 p-2" style="background-color: #5cd1f7">
					<div class="row text-center">
						<h1>Reschedule Interview</h1>
					</div>
				</div>
				<div class="card m-1" style="background-color: #e3f4fc">
					<div class="card-body">
						<form onsubmit="return validateReSchedule()" action="rescheduleinterview" method="post">
							<div class="row p-2">
								<div class="col-4">Candidate</div>
								<div class="col-8">
									<%=candidate_res.getFname() + " " + candidate_res.getLname()%>
								</div>
								<span class="inputError" id="canidate_idError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Round</div>
								<div class="col-8">
									<%=round_res%>
								</div>
								<span class="inputError" id="round_noError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Select Type</div>
								<div class="col-8">
									<select class="form-select" name="round_type" id="round_type" style="width: 100%;" onchange="removeError('round_type')">
										<%
										String roundtype;
										if (schedule.getRound_type() == 1) {
											roundtype = "Technical";
										} else {
											roundtype = "MGMT/HR Round";
										}
										%>
										<option value="<%=schedule.getRound_type()%>"><%=roundtype%></option>
										<option value="1">Technical</option>
										<option value="2">MGMT/HR Round</option>
									</select>
								</div>
								<span class="inputError" id="round_typeError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Select Employee</div>
								<div class="col-8">
									<select class="form-select" name="employee_id" id="employee_id" style="width: 100%;">
										<option value="<%=emp_res.getEmployee_id()%>" selected><%=emp_res.getEmployee_name()%></option>
										<%
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
								<span class="inputError" id="employee_idError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Date</div>
								<div class="col-8">
									<input class="form-control" type="date" name="date" id="date" value="<%=schedule.getDate()%>" style="width: 100%;">
								</div>
								<span class="inputError" id="dateError"></span>
							</div>
							
							<div class="row p-2">
								<%
								//convert  StratTime to 24 hours
								String startTime=schedule.getStart_time();
								
								if(startTime.charAt(6)=='A')
								{
									if(startTime.charAt(0)=='1'&& startTime.charAt(1)=='2')
									{
										startTime="00:"+startTime.charAt(3)+startTime.charAt(4);
										
									}
									else
									{
										startTime=startTime.charAt(0)+""+startTime.charAt(1)+":"+startTime.charAt(3)+""+startTime.charAt(4);	
									}
								}
								else
								{
									int startHours=Integer.parseInt(""+startTime.charAt(0)+startTime.charAt(1));
									startTime=(12+startHours)+":"+startTime.charAt(3)+startTime.charAt(4);
								}
								
								
								//convert end Time to 24 hours
								
								String endTime=schedule.getEnd_time();
								
								
								if(endTime.charAt(6)=='A')
								{
									if(endTime.charAt(0)=='1'&& endTime.charAt(1)=='2')
									{
										endTime="00:"+endTime.charAt(3)+endTime.charAt(4);
										
									}
									else
									{
										endTime=endTime.charAt(0)+""+endTime.charAt(1)+":"+endTime.charAt(3)+""+endTime.charAt(4);	
										
									}
								}
								else
								{
									int endHours=Integer.parseInt(""+endTime.charAt(0)+endTime.charAt(1));
									endTime=(12+endHours)+":"+endTime.charAt(3)+endTime.charAt(4);
								}
								
								%>
								<div class="col-4">Time</div>
								
								<div class="col-8">
									<div class="row">
										<div class="col-6">
											<input class="form-control" type="time" name="stime" id="stime"  value="<%=startTime%>"style="width: 100%;" onchange="removeError('date')">
										</div>
										<div class="col-6">
											<input class="form-control" type="time" name="etime" id="etime" value="<%=endTime%>"style="width: 100%;" onchange="removeError('date')">
										</div>
									</div>
								</div>
								<span class="inputError" id="timeError"></span>
							</div>
							<div class="row p-2">
								<div class="col-4">Select Platform</div>
								<div class="col-8">
									<select class="form-select" name="platform" id="platform" style="width: 100%;" onchange="checkMeetingLinkRequired()">
										<option value="<%=schedule.getPlatform() %>" selected><%=schedule.getPlatform() %></option>
										<option value="F2F">F2F</option>
										<option value="Telephonic">Telephonic</option>
										<option value="Zoom-Meet">Zoom-Meet</option>
										<option value="Google-Meet">Google-Meet</option>
									</select>
								</div>
								<span class="inputError" id="platformError"></span>
							</div>
							<div class="row p-2" id="meetingLinkDiv">
								<div class="col-4">Meeting Link</div>
								<div class="col-8">
									<input class="form-control" type="text" id="meetingLink" value="<%=schedule.getMeetingLink()%>" name="meetingLink" autocomplete="off" style="width: 100%;" onclick="removeError('meetingLink')" >
								</div>
								<span class="inputError" id="meetingLinkError"></span>
							</div>
							<hr>
							<div class="row m-3">
								<div class="col-6 offset-4">
									<input type="hidden" name="schedule_id" value="<%=schedule.getInterview_schedule_id()%>"> <input type="hidden" name="candidate_id" value="<%=schedule.getCandidate_id()%>"> <input
										class="btn btn-success" id="rescheduleSubmit" type="submit" value="Reschedule">
								</div>

							</div>

						</form>
					</div>
				</div>
				<%
				}
				%>


			</div>
		</div>
	</div>


	<script>
	
		function checkMeetingLinkRequired() {
			
			document.getElementById("platformError").innerHTML = "";
			var platform= document.getElementById("platform");
			if(platform.value=="F2F"|| platform.value=="Telephonic")
			{
				meetingLinkDiv.style.display="none";
			}
			else
			{
				meetingLinkDiv.style.display="flex";
			}
		}
		//this fun remove error msg from input field
		function removeError(id) {
			document.getElementById(id + "Error").innerHTML = "";

		}

		var maxCompletedRound;
		var maxScheduledRound;
		function checkcandidatedetails() {
			document.getElementById("candidate_idError").innerHTML = "";
			var id = $("#candidate_id").val();
			console.log("in script" + id);
			datastring = "candidate_id=" + id;
			$
					.ajax({
						type : "post",
						url : "candidateservice",
						data : datastring,
						dataType : "json",
						success : function(data) {
							if (data.success) {
								//console.log("c "+data.candidateRoundInfo.maxCompletedRound);
								//	console.log("s "+data.candidateRoundInfo.maxScheduledRound);
								maxCompletedRound = data.candidateRoundInfo.maxCompletedRound;
								maxScheduledRound = data.candidateRoundInfo.maxScheduledRound;

								var rounds = document
										.getElementById("round_no");
								rounds.innerHTML = "";

								var newOption = document
										.createElement("option");
								
								newOption.value = "";
								newOption.innerHTML = "--Select--"
								rounds.options.add(newOption);

								var newOption = document
										.createElement("option");
								newOption.value = maxScheduledRound + 1
								newOption.innerHTML = maxScheduledRound + 1
								rounds.options.add(newOption);
							}
						}

					})
		}
		//cheching card to schedule
		function changeToSchedule() {
	<%session.setAttribute("scheduleType", null);%>
		location.reload();
		}

		//Restricting previous date (can select todays date onwords)
		var date = new Date();

		var todayDate = date.getDate();
		if (todayDate < 10) {
			todayDate = "0" + todayDate;
		}
		var month = date.getMonth() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		var year = date.getFullYear();

		var minDate = year + "-" + month + "-" + todayDate;

		document.getElementById("date").setAttribute("min", minDate);

		//function shows ongoing interview schedules
		function showOngoingtable() {
			Completed_Schedule.style.display = "none";
			Ongoing_Schedule.style.display = "block";
		}
		function showCompletedtable() {
			Ongoing_Schedule.style.display = "none";
			Completed_Schedule.style.display = "block";
		}
		//this fun run is schedule is completed in list and clicks on  complted btn

		function validateSchedule()
		{
			var candidate_id = document.getElementById("candidate_id");
			var round_type = document.getElementById("round_type");
			var employee_id = document.getElementById("employee_id");
			var round_no = document.getElementById("round_no");
			var date = document.getElementById("date");
			var startTime = document.getElementById("stime");
			var endTime = document.getElementById("etime");
			var platform= document.getElementById("platform");
			var meetingLink= document.getElementById("meetingLink");
			
			var cnt = 0;
			if (candidate_id.value == "") {
				document.getElementById("candidate_idError").innerHTML = "*Please select Candidate";
				cnt++;
			}
			if (round_type.value == "") {
				document.getElementById("round_typeError").innerHTML = "*Please select Type of Round";
				cnt++;
			}

			if (employee_id.value == "") {
				document.getElementById("employee_idError").innerHTML = "*Please select Employee";
				cnt++;
			}

			if (date.value == "") {
				document.getElementById("dateError").innerHTML = "*Please select Date";
				cnt++;
			}
			if(startTime.value=="" && endTime.value=="")
			{
				document.getElementById("timeError").innerHTML = "*Please select Time";
				cnt++;
			}
			if(startTime.value=="" )
			{
				document.getElementById("timeError").innerHTML = "*Please select Start Time";
				cnt++;
			}
			if( endTime.value=="")
			{
				document.getElementById("timeError").innerHTML = "*Please select End Time";
				cnt++;
			}

			if (round_no.value == "") {
				document.getElementById("round_noError").innerHTML = "*Please select Round no";
				cnt++;
			}
			if (round_no.value != "") {
				console.log("c " + maxCompletedRound);
				console.log("s " + maxScheduledRound)
				if (maxCompletedRound == maxScheduledRound
						&& maxScheduledRound == 0) {

				} else if (maxCompletedRound < maxScheduledRound) {
					alert("Can not Schedule Next round Before previous round is complete");
					cnt++;
				}
				document.getElementById("round_noError").innerHTML = "";
			}
			if(platform.value=="")
			{
				document.getElementById("platformError").innerHTML = "*Please select Platform";
				cnt++;
			}
			if(platform.value!="F2F" && platform.value!="Telephonic")
			{
				if(meetingLink.value=="")
				{
					document.getElementById("meetingLinkError").innerHTML = "*Please Give Link";
					cnt++;
				}
			}
			
			if (cnt != 0) {
				return false;
			}
			if(cnt==0)
			{
				document.getElementById("scheduleSubmit").disabled=true;		
			}

		}
		
		function validateReSchedule()
		{
			var round_type = document.getElementById("round_type");
			var employee_id = document.getElementById("employee_id");
			var date = document.getElementById("date");
			var startTime = document.getElementById("stime");
			var endTime = document.getElementById("etime");
			var platform= document.getElementById("platform");
			var meetingLink= document.getElementById("meetingLink");
			
			var cnt = 0;
			
			if (round_type.value == "") {
				document.getElementById("round_typeError").innerHTML = "*Please select Type of Round";
				cnt++;
			}

			if (employee_id.value == "") {
				document.getElementById("employee_idError").innerHTML = "*Please select Employee";
				cnt++;
			}

			if (date.value == "") {
				document.getElementById("dateError").innerHTML = "*Please select Date";
				cnt++;
			}
			if(startTime.value=="" && endTime.value=="")
			{
				document.getElementById("timeError").innerHTML = "*Please select Time";
				cnt++;
			}
			if(startTime.value=="" )
			{
				document.getElementById("timeError").innerHTML = "*Please select Start Time";
				cnt++;
			}
			if( endTime.value=="")
			{
				document.getElementById("timeError").innerHTML = "*Please select End Time";
				cnt++;
			}
			if(platform.value=="")
			{
				document.getElementById("platformError").innerHTML = "*Please select Platform";
				cnt++;
			}
			if(platform.value!="F2F" && platform.value!="Telephonic")
			{
				if(meetingLink.value=="")
				{
					document.getElementById("meetingLinkError").innerHTML = "*Please Give Link";
					cnt++;
				}
			}
			
			if(cnt==0)
			{
				document.getElementById("rescheduleSubmit").disabled=true;		
			}
			else
			{
				return false;
			}
			

		}
	</script>


</body>
</html>