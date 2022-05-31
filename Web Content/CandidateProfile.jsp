<%@page import="com.dao.Hr_SkillsDao"%>
<%@page import="com.model.Hr_Skills"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Skills"%>
<%@page import="com.dao.SkillsDao"%>
<%@page import="com.model.Feedback"%>
<%@page import="com.dao.FeedbackDao"%>
<%@page import="com.dao.Interview_ScheduleDao"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="com.model.JobRole"%>
<%@page import="com.model.Employee"%>
<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.model.Interview_Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Candidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate Profile</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">

</head>
<body style="background-color: #f0f0f0">
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<!--End of sidenav  -->
			<div class="col-4">
				<div class="card_heading  p-3 mb-1">
					<div class="row">
						<div class="col-9">
							<h3>Candidate Profile</h3>
						</div>
						<div class="col-3">
							<%
							int candidate_id = (int) session.getAttribute("candidate_id");
							Candidate candidate = CandidateDao.getCandidateById(candidate_id);
							JobRole job = JobRoleDao.getJobRoleByid(candidate.getAppliedforrole());
							%>
							<!-- this form goto gotoupdateCandidatePage servlet -->
							<form action="gotoupdatecandidate">
								<input type="hidden" name="candidate_id" value="<%=candidate.getCandidate_id()%>"> <input class="btn btn-primary" type="submit" value="Update">
							</form>
						</div>

					</div>
				</div>
				<div class="card_body p-4">
					<div class="row mb-3">
						<div class="col-5 offset-1">Name:</div>
						<div class="col-6">
							<%=candidate.getFname() + " " + candidate.getLname()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">MobileNo:</div>
						<div class="col-6">
							<%=candidate.getMobileno()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Email-Id:</div>
						<div class="col-6">
							<%=candidate.getEmailid()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Highest Qualification:</div>
						<div class="col-6">
							<%=candidate.getHighqualification()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">TotalExp:</div>
						<div class="col-6">
							<%=candidate.getTotalyearofexperience()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Previous Org:</div>
						<div class="col-6">
							<%=candidate.getPreviousorg()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Core Skills</div>
						<div class="col-6">
							<%=candidate.getCoreskills()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Applied For:</div>
						<div class="col-6">
							<%=job.getJob_title()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Initial Feedback:</div>
						<div class="col-6">
							<%=candidate.getInitialfeedback()%>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-5 offset-1">Resume:</div>
						<div class="col-6">
							<a href="ShowCandidateResume.jsp" target="_blank" class="btn btn-primary">open</a>

						</div>
					</div>


				</div>

			</div>
			<div class="col-6">
				<div class="card_heading   p-3 mb-1">
					<div class="row">
						<div class="col-3">
							<h4>Status:</h4>
						</div>
						<div class="col-9 ">
							<div class="row">
								<div class="col-4">
									<h6>Assignment-Status</h6>
								</div>
								<div class="col-4">
									<%
									if (candidate.getAssignment_status() == 0) {
									%>
									<strong> Not Given</strong>
									<%
									} else if (candidate.getAssignment_status() == 1) {
									%>
									<strong>Given</strong>
									<%
									} else if (candidate.getAssignment_status() == 2) {
									%>
									<strong>Completed</strong>
									<%
									}
									%>

								</div>
								<div class="col-4">
									<a href="ShowCandidateAssignment.jsp" target="_blank" class="btn btn-primary">To-Assignment</a>
								</div>
							</div>
							<hr>
							<div class="row">
								<%
								Interview_Schedule status_schedule = Interview_ScheduleDao.getLastestScheduleByCandidateId(candidate.getCandidate_id());

								if (candidate.getCandidate_status() == 0) {
								%>
								<h6>Just New/Zero Schedule</h6>

								<%
								} else if (candidate.getCandidate_status() == 1) {
								%>
								<div class="row">
									<div class="col">
										<h6>Interviews_OnGoing</h6>
									</div>


									<%
									if (status_schedule.getRound_type() == 1) {

										if (status_schedule.getIscomplete() == 1) {
									%>
									<div class="col">
										<h6>
											Technical Round-
											<%=status_schedule.getTech_round_no()%>
											Completed
										</h6>
									</div>
									<%
									} else {
									%>
									<div class="col">
										<h6>
											Technical Round-
											<%=status_schedule.getTech_round_no()%>
											OnGoing
										</h6>
									</div>
									<%
									}
									} else if (status_schedule.getRound_type() == 2) {
									if (status_schedule.getIscomplete() == 1) {
									%>
									<div class="col">
										<h6>
											HR Round-
											<%=status_schedule.getHr_round_no()%>
											Completed
										</h6>
									</div>
									<%
									} else {
									%>
									<div class="col">
										<h6>
											HR Round-
											<%=status_schedule.getHr_round_no()%>
											OnGoing
										</h6>
									</div>
									<%
									}
									}
									%>
								</div>
								<%
								} else if (candidate.getCandidate_status() == 2) {
								%>
								<h6>Rejected</h6>
								<%
								} else if (candidate.getCandidate_status() == 3) {
								%>
								<h6>**Selected**</h6>
								<%
								} 
								else if (candidate.getCandidate_status() == 4) {
								%>
								<h6>Offer-Letter-Given</h6>
								<%
								}else if (candidate.getCandidate_status() == 5) {
								%>
								<h6>Offer-Letter-Accepted</h6>
								<%
								} else if (candidate.getCandidate_status() == 6) {
								%>
								<h6>Offer-Letter-Rejected by Candidate</h6>
								<%
								} else if (candidate.getCandidate_status() == 7) {
								%>
								<h6>On-Notice-Period</h6>
								<%
								} else if (candidate.getCandidate_status() == 8) {
								%>
								<h6>Joined-Team</h6>
								<%
								}
							
								
								%>
							</div>


						</div>
					</div>
				</div>
				<div class="card_heading text-center p-3 mb-1">
					<h3>Interview Schedule</h3>
				</div>
				<div class="card_body p-4">
					<%
					ArrayList<Interview_Schedule> list = Interview_ScheduleDao.getinterviewScheduleListByCandidateId(candidate_id);
					if (list.isEmpty()) {
					%>
					<h5>No Records available</h5>

					<%
					} //End of if

					else {
					%>
					<div class="row ">

						<div class="col-1">
							<strong>RNo.</strong>
						</div>
						<div class="col-2">
							<strong>Panel</strong>
						</div>
						<div class="col-2">
							<strong>Type</strong>
						</div>
						<div class="col-2">
							<strong>Date</strong>
						</div>
						<div class="col-3">
							<strong>Time</strong>
						</div>
						<div class="col-2">
							<strong>Feedback</strong>
						</div>
					</div>
					<hr>

					<%
					//this loop iterate schedules of candidate
					for (int i = 0; i < list.size(); i++) {
						Interview_Schedule schedule = list.get(i);
						int employee_id = schedule.getEmployee_id();
						Employee emp = EmployeeDao.getEmployeeById(employee_id);
					%>
					<div class="row mb-3">

						<div class="col-1"><%=schedule.getRound_no()%></div>
						<div class="col-2"><%=emp.getEmployee_name()%></div>
						<div class="col-2">
							<%
							if (schedule.getRound_type() == 1) {
							%>
							<span>Technical</span>
							<%
							} else if (schedule.getRound_type() == 2) {
							%>
							<span>HR</span>
							<%
							}
							%>
						</div>
						<div class="col-2"><%=schedule.getDate()%></div>
						<div class="col-3"><%=schedule.getStart_time() + "-" + schedule.getEnd_time()%></div>
						<div class="col-2">
							<%
							int iscomplete = schedule.getIscomplete();
							if (iscomplete == 0) {
								int employeeId = schedule.getEmployee_id();
							%>
							<form onsubmit="return checkValidInterviewer('<%=employeeId%>')" action="gotofeedbackform" method="post">
								<input class="btn btn-primary" type="submit" value="Add"> <input type="hidden" name="schedule_id" value="<%=schedule.getInterview_schedule_id()%>">
							</form>
							<%
							} //End of if
							else {
							%>
							<button onclick="AlreadySaved()" class="btn btn-success">Saved</button>
							<%
							} //End of Else
							%>
						</div>
					</div>

					<%
					} //End of for loop
					%>

					<%
					} //End of else part
					%>

				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-2"></div>
			<div class="col-md-7 offset-md-1">

				<div class="feedbacktables">
					<h2>Feedback Records</h2>
					<%
					ArrayList<Interview_Schedule> isCompleteList = Interview_ScheduleDao
							.getCompletedInterviewScheduleListByCandidateId(candidate.getCandidate_id());
					if (isCompleteList.isEmpty()) {
					%>
					<h5>No records Available</h5>

					<%
					} else {
					for (int i = 0; i < isCompleteList.size(); i++) {
						Interview_Schedule completedSchedule = isCompleteList.get(i);
						int completedScheduleId = completedSchedule.getInterview_schedule_id();
						int employee_id = completedSchedule.getEmployee_id();
						Employee emp = EmployeeDao.getEmployeeById(employee_id);
					%>
					<div class="card_heading p-3 mb-1">
						<div class="row">
							<div class="col">
								<strong>Round No&emsp;</strong><%=completedSchedule.getRound_no()%>
							</div>
							<div class="col">
								<strong>Date &emsp;</strong><%=completedSchedule.getDate()%>
								&emsp;<strong>Time</strong>&emsp;
								<%=completedSchedule.getStart_time() + "-" + completedSchedule.getEnd_time()%>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<strong>Interviewer &emsp;</strong><%=emp.getEmployee_name()%>
							</div>
							<div class="col">
								<%
								if (completedSchedule.getRound_type() == 1) {
								%>
								<strong>Technical Round </strong>
								<%
								} else if (completedSchedule.getRound_type() == 2) {
								%>
								<strong>HR Round </strong>
								<%
								}
								%>

							</div>
						</div>
					</div>
					<div class="card_body p-3 mb-4">

						<div class="row">
							<div class="col">
								<strong>Skill</strong>
							</div>
							<div class="col">
								<strong>Rating</strong>
							</div>
							<div class="col">
								<strong>Comments</strong>
							</div>
						</div>
						<hr>
						<%
						if (completedSchedule.getRound_type() == 1) {
							ArrayList<Feedback> feedbackList = FeedbackDao.getFeedbackListByScheduleId(completedScheduleId);
							for (int j = 0; j < feedbackList.size(); j++) {

								Feedback feedback = feedbackList.get(j);

								Skills skill = SkillsDao.getSkill(Integer.parseInt(feedback.getSkill_id()));
						%>
						<div class="row mb-3">
							<div class="col"><%=skill.getSkill_name()%>
							</div>
							<div class="col"><%=feedback.getRating()%>
							</div>
							<div class="col"><%=feedback.getComment()%>
							</div>
						</div>

						<%
						}
						//End of For Loop
						} else if (completedSchedule.getRound_type() == 2) {
						ArrayList<Hr_Skills> hr_skill_list = Hr_SkillsDao.getHR_SkillList();
						ArrayList<Feedback> feedbackList = FeedbackDao.getFeedbackListByScheduleId(completedScheduleId);
						for (int j = 0; j < feedbackList.size(); j++) {

						Feedback feedback = feedbackList.get(j);
						Hr_Skills skill = hr_skill_list.get(j);
						%>
						<div class="row mb-3">
							<div class="col"><%=skill.getHr_skill_name()%>
							</div>
							<div class="col"><%=feedback.getRating()%>
							</div>
							<div class="col"><%=feedback.getComment()%>
							</div>
						</div>

						<%
						}
						}
						%>
						<hr>

						<div class="nroundnote mb-2">
							<strong>* Round <%=completedSchedule.getRound_no() + " "%>Note
							</strong>
							<%=completedSchedule.getRoundFeedback()%>
						</div>

					</div>
					<%
					} //End of For Loop
					} //End of else
					%>
				</div>
			</div>

		</div>
	</div>
	<script>
	$(document).ready(function() {
		var candidate_status='<%=candidate.getCandidate_status()%>';
		if(candidate_status==0)
		{
			$(".card_heading").css({backgroundColor:"#b3b4b5", "border":"1px solid #c7c5c5","border-radius":"8px"});//grey
			$(".card_body").css({backgroundColor:"#e1e1e3","border":"1px solid #c7c5c5","border-radius":"8px"});//lite-grey
			
			
		}
		else if(candidate_status==1)
		{
			$(".card_heading").css({backgroundColor:"#5cd1f7","border":"1px solid #c7c5c5", "border-radius":"8px"})//sky-blue
			$(".card_body").css({backgroundColor:"#e3f4fc","border":"1px solid #c7c5c5", "border-radius":"8px"})//lite-sky-blue
			
		}
		else if(candidate_status==2)
		{
			$(".card_heading").css({backgroundColor:"#f72862","border":"1px solid #c7c5c5", "border-radius":"8px"})//red
			$(".card_body").css({backgroundColor:"#fc7276","border":"1px solid #c7c5c5", "border-radius":"8px"})//lite-red
		}
		else if(candidate_status==3)
		{
			$(".card_heading").css({backgroundColor:"#a6fa82","border":"1px solid #c7c5c5", "border-radius":"8px"})//green
			$(".card_body").css({backgroundColor:"#dbfccc","border":"1px solid #c7c5c5", "border-radius":"8px"})//lite green
		}
		else if (candidate_status == 4) 
		{
			$(".card_heading").css({
				backgroundColor : "#5effda","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
			$(".card_body").css({
				backgroundColor : "#c0faed","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
		} 
		else if (candidate_status == 5) 
		{
			$(".card_heading").css({
				backgroundColor : "#a6fa82","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
			$(".card_body").css({
				backgroundColor : "#dbfccc","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
		} else if (candidate_status == 6) 
		{
			$(".card_heading").css({
				backgroundColor : "#f72862","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
			$(".card_body").css({
				backgroundColor : "#fc7276","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
		} else if (candidate_status == 7) 
		{
			$(".card_heading").css({
				backgroundColor : "#5cd1f7","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
			$(".card_body").css({
				backgroundColor : "#e3f4fc","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
		} else if (candidate_status == 8) 
		{
			$(".card_heading").css({
				backgroundColor : "#dd7efc","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
			$(".card_body").css({
				backgroundColor : "#f2ccff","border":"1px solid #c7c5c5", "border-radius":"8px"
			})
		}
	});
	//btn of feedback alredy saved
	function AlreadySaved() 
	{
		alert("This Feedback is Alredy Submited");	
	}
	
	//checks login user and interview schedule - interviewer (matching) 
	function checkValidInterviewer(id) 
	{
		<%Employee isvalidemp = (Employee) session.getAttribute("Loggeduser");%>
		var	sessionEmp='<%=isvalidemp.getEmployee_id()%>';

			var schedule_empid = id;
			if (sessionEmp != schedule_empid) {
				alert("You dont have access to submit this feedback");
				return false;
			}

		}
	</script>
</body>
</html>