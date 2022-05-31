<%@page import="com.dao.JobRoleDao"%>
<%@page import="com.model.JobRole"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Already Applied</title>
</head>
<body>
	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-10">
				<%
				int candidate_id=(int)session.getAttribute("candidate_id");
				Candidate candidate=CandidateDao.getCandidateById(candidate_id);
				Timestamp previousTimestamp=candidate.getCreatedOn();
				JobRole job=JobRoleDao.getJobRoleByid(candidate.getAppliedforrole());
				%>
				<div class="row mt-3">
					<div class="col-10 offset-1">
						<div class="card" style="background-color: #e3f4fc">
							<div class="p-3 text-center"><strong>Candidate Already Applied</strong></div>
							<div class="row p-3">
								<div class="col-4">AppliedFor: </div>
								<div class="col-4"><%=job.getJob_title() %></div>
							</div>
							<div class="row p-3">
								<div class="col-4">Last Applied Date </div>
								<div class="col-4"><%=previousTimestamp %> </div>
							</div>
							<div class="row p-3">
								<div class="col-4">Duration </div>
								<div class="col-4"><%=session.getAttribute("days") %> Days</div>
							</div>
							<div class="row p-3">
								<div class="col-4">Open Profile </div>
								<div class="col-4"><a target="_blank" href="CandidateProfile.jsp">Open</a></div>
							</div>
							<div class="row p-3">
								<div class="col-4">Force ReApply </div>
								<div class="col-4">
									<form action="forceReApply" method="post">
										<input type="submit" value="ReApply">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>	
				
			</div>
		</div>
	</div>
</body>
</html>