<%@page import="com.dao.Hr_SkillsDao"%>
<%@page import="com.model.Hr_Skills"%>
<%@page import="com.dao.FeedbackDao"%>
<%@page import="com.model.JobRole"%>
<%@page import="com.dao.JobRoleDao"%>
<%@page import="com.model.Feedback"%>
<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.dao.SkillsDao"%>
<%@page import="com.model.Skills"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>
<%@page import="com.dao.Interview_ScheduleDao"%>
<%@page import="com.model.Interview_Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Form</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.prefeedbacktables {
	overflow-x: auto;
	overflow-y: hidden;
	text-align: justify;
}

.preform {
	width: 500px;
}
</style>
</head>
<body style="background-color: #f0f0f0">
<script>
function validateForm()
{
	document.getElementById("submit").disabled=true;	
}
</script>
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-10">
				<div class="row">
					<%
					int id = (int) session.getAttribute("schedule_id");
					Interview_Schedule schedule = (Interview_Schedule) Interview_ScheduleDao.getSchedulebySchedule_id(id);
					Candidate candidate = (Candidate) CandidateDao.getCandidateById(schedule.getCandidate_id());
					int jobId = candidate.getAppliedforrole();
					Employee employee = (Employee) EmployeeDao.getEmployeeById(schedule.getEmployee_id());
					%>
					<div class="row p-3" style="background-color: #5cd1f7">
						<div class="col-4">
							<form  action="openprofilepage" method="post">
								<input class="btn btn-primary" type="submit" value="Goto Candidate Profile"> <input type="hidden" name="candidate_id" value="<%=candidate.getCandidate_id()%>">
							</form>
						</div>
						<div class="col-4">
							<strong>Interview Platform:-<%=schedule.getPlatform() %></strong>
						</div>
						<div class="col-4">
							<strong>Goto Meeting:-</strong>
							<%
								if(schedule.getMeetingLink().equals("No-Link"))
								{%>
									<strong>No-Link</strong>	
								<%}
								else
								{%>									
									 <a href="<%=schedule.getMeetingLink() %>" target="_blank" class="btn btn-primary">Click Me</a> 
								<%}
							%>
						</div>
					</div>
					
					<div class="col-6 offset-md-1">

						<h3>Feedback Form</h3>
						<%
						if (schedule.getRound_type() == 2)
						{ //hr feedback form
							ArrayList<Hr_Skills> Hr_Skills_list = Hr_SkillsDao.getHR_SkillList();
						%>

						<div class="card" style="background-color: #e3f4fc">
							<div class="card-body">
								<form onsubmit="return validateForm()" action="save_hr_feedback" method="post">
									<!-- Heading Row -->
									<div class="row">
										<div class="row">
											<div class="col-md-6">
												<strong>Candidate - </strong><%=candidate.getFname() + " " + candidate.getLname()%>
											</div>
											<div class="col-md-6">
												<strong>Round No - </strong><%=schedule.getRound_no()%>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<strong>Interviewer -</strong>
												<%=employee.getEmployee_name()%>
											</div>
											<div class="col-md-6">
												<%
												if (schedule.getRound_type() == 1)
												{
												%>
												<strong>Technical </strong>
												<%
												} else if (schedule.getRound_type() == 2)
												{
												%>
												<strong>HR Round </strong>
												<%
												}
												%>

											</div>
										</div>
										<span style="color: red; font-size: 12px">*Rating for skill 1-10 (10-Highest and 1-Lowest)</span>
									</div>
									<hr>
									<!-- Table Heading row -->
									<div class="row">
										<div class="col-md-5">
											<strong>Skills</strong>
										</div>
										<div class="col-md-2">
											<strong>Rating</strong>
										</div>
										<div class="col-md-5">
											<strong>Comments</strong>
										</div>
									</div>
									<!-- Table body -->
									<%
									for (int i = 0; i < Hr_Skills_list.size(); i++)
									{
										Hr_Skills skill = Hr_Skills_list.get(i);
									%>
									<div class="row p-2">
										<div class="col-md-5">
											<%=skill.getHr_skill_name()%>
										</div>
										<div class="col-md-2">
											<input type="number" max="10" min="0" name="rating_<%=skill.getSkill_id()%>" style="width: 50px; height: 25px" required="required" autocomplete="off">
										</div>
										<div class="col-md-5">
											<input type="text" name="comment_<%=skill.getSkill_id()%>" style="height: 25px" required="required" autocomplete="off">
										</div>
									</div>
									<%
									}
									%>
									<!-- for saving and redirecting -->
									<div>
										<input type="hidden" name="schedule_id" value="<%=schedule.getInterview_schedule_id()%>"> <input type="hidden" name="candidate_id" value="<%=candidate.getCandidate_id()%>">
									</div>
									<hr>
									<!-- Round Note -->
									<div class="row p-2">
										<div class="col-3">
											<strong> Round <%=schedule.getRound_no() + " "%>Note
											</strong>
										</div>
										<div class="col-9">
											<textarea class="form-control" name="roundFeedback" rows="3" id="round<%=schedule.getRound_no()%>" placeholder="Enter round  <%=schedule.getRound_no()%>  Notes"></textarea>
										</div>
									</div>
									<!-- save btn -->
									<div class="row p-2">
										<div class="col-2 offset-4">
											<input class="btn btn-primary "id="submit"  type="submit" value="Save Feedback">
										</div>
									</div>
								</form>
							</div>
						</div>
						<%
						} else if (schedule.getRound_type() == 1)
						{ //technical feedback form
						ArrayList<Skills> tech_skillslist = (ArrayList<Skills>) SkillsDao.getSkillList(jobId);
						if (tech_skillslist.isEmpty())
						{
							JobRole job = JobRoleDao.getJobRoleByid(jobId);
						%>
						<h3>
							No Skills Available For
							<%=job.getJob_title()%></h3>
						<a href="JobRole_Skill.jsp"><button>Goto Add Skills</button></a>
						<%
						} else
						{
						%>
						<div>


							<form onsubmit="return validateForm()" action="savefeedback" method="post">
								<div class="card" style="background-color: #e3f4fc">
									<div class="card-body">
										<div class="row">
											<div class="row">
												<div class="col-md-6">
													<strong>Candidate - </strong><%=candidate.getFname() + " " + candidate.getLname()%>
												</div>
												<div class="col-md-6">
													<strong>Round No - </strong><%=schedule.getRound_no()%>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<strong>Interviewer -</strong>
													<%=employee.getEmployee_name()%>
												</div>
												<div class="col-md-6">
													<%
													if (schedule.getRound_type() == 1)
													{
													%>
													<strong>Technical </strong>
													<%
													} else if (schedule.getRound_type() == 2)
													{
													%>
													<strong>HR Round </strong>
													<%
													}
													%>

												</div>
											</div>
											<span style="color: red; font-size: 12px">*Rating for skill 1-10 (10-Highest and 1-Lowest)</span>
										</div>

										<hr>
										<div class="row">
											<div class="row">
												<div class="col-md-5">
													<strong>Skills</strong>
												</div>
												<div class="col-md-2">
													<strong>Rating</strong>
												</div>
												<div class="col-md-5">
													<strong>Comments</strong>
												</div>
											</div>

											<%
											for (int i = 0; i < tech_skillslist.size(); i++)
											{
												Skills skill = (Skills) tech_skillslist.get(i);
											%>
											<div class="row p-2">
												<div class="col-md-5">
													<%=skill.getSkill_name()%>
												</div>
												<div class="col-md-2">
													<input type="number" max="10" min="0" name="rating_<%=skill.getSkill_id()%>" style="width: 50px; height: 25px" required="required" autocomplete="off">
												</div>
												<div class="col-md-5">
													<input type="text" name="comment_<%=skill.getSkill_id()%>" style="height: 25px" required="required" autocomplete="off">
												</div>
											</div>
											<%
											}
											%>
											<div>
												<input type="hidden" name="schedule_id" value="<%=schedule.getInterview_schedule_id()%>"> <input type="hidden" name="candidate_id" value="<%=candidate.getCandidate_id()%>">
											</div>
										</div>
										<hr>
										<div class="row p-2">
											<div class="col-3">
												<strong> Round <%=schedule.getRound_no() + " "%>Note
												</strong>
											</div>
											<div class="col-9">
												<textarea class="form-control" name="roundFeedback" required rows="3" id="round<%=schedule.getRound_no()%>" placeholder="Enter round  <%=schedule.getRound_no()%>  Notes"></textarea>
											</div>

										</div>
										<div class="row p-2">
											<div class="col-2 offset-4">
												<input class="btn btn-primary " id="submit" type="submit" value="Save Feedback">
											</div>
										</div>

									</div>
								</div>
							</form>
						</div>

						<%
						}
						}
						%>

					</div>
					<div class="col-5">
						<h2>Previous Feedback</h2>
						<div class="prefeedbacktables">
							<div class="d-flex ">
								<%
								ArrayList<Interview_Schedule> isCompleteList = (ArrayList<Interview_Schedule>) Interview_ScheduleDao
										.getCompletedInterviewScheduleListByCandidateId(candidate.getCandidate_id());
								if (isCompleteList.isEmpty())
								{
								%>
								<h5>No records Available</h5>

								<%
								} else
								{
								for (int i = 0; i < isCompleteList.size(); i++)
								{
									Interview_Schedule completedSchedule = isCompleteList.get(i);
									int completedScheduleId = completedSchedule.getInterview_schedule_id();
									int employee_id = completedSchedule.getEmployee_id();
									Employee emp = EmployeeDao.getEmployeeById(employee_id);
								%>
								<div>
									<div class="preform card" style="background-color: #e3f4fc">
										<div class="card-body">
											<div class="row">
												<div class="row">
													<div class="col-md-6">
														<strong>Round No - </strong><em><%=completedSchedule.getRound_no()%></em>
													</div>
													<div class="col-md-6">
														<strong>Date - </strong><em><%=completedSchedule.getDate()%></em>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<strong>Interviewer - </strong><em><%=emp.getEmployee_name()%></em>
													</div>
													<div class="col-md-6">
														<%
														if (completedSchedule.getRound_type() == 1)
														{
														%>
														<strong>Technical Round </strong>
														<%
														} else if (completedSchedule.getRound_type() == 2)
														{
														%>
														<strong>HR Round </strong>
														<%
														}
														%>

													</div>
												</div>
												<span style="color: red; font-size: 12px">*Rating for skill 1-10 (10-Highest and 1-Lowest)</span>
											</div>

											<hr>
											<div class="row">
												<div class="row">
													<div class="col-md-5 text-center">
														<strong>Rating</strong>
													</div>
													<div class="col-md-7">
														<strong>Comments</strong>
													</div>
												</div>
												<%
												ArrayList<Feedback> feedbackList = FeedbackDao.getFeedbackListByScheduleId(completedScheduleId);
												for (int j = 0; j < feedbackList.size(); j++)
												{

													Feedback feedback = feedbackList.get(j);
												%>
												<div class="row p-2">
													<div class="col-md-5 text-center">
														<%=feedback.getRating()%>
													</div>
													<div class="col-md-7 ">
														<%=feedback.getComment()%>
													</div>

												</div>
												<%
												}
												%>

											</div>
											<hr>
											<div class="nroundnote m-4">
												<strong>* Round <%=completedSchedule.getRound_no() + " "%>Note
												</strong>
												<%=completedSchedule.getRoundFeedback()%>
											</div>
										</div>
									</div>
								</div>
								<%
								}
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>