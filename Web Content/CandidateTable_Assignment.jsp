<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate List</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
</head>
<body>
<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row ">
			<div class="col-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-10 mt-3">
				<div class="row">
					<div class="col-7 offset-2">
						<form action="showselectedcandidate_assignment" method="post">
							<div class="card p-3" style="background-color: #5cd1f7">
								<h3>Select Candidates</h3>
								<div class="row">
									<div class="col-9">
										<strong>Name</strong>
									</div>
									<div class="col-3">
										<strong>Select</strong>
									</div>
								</div>
								
							</div>
							<div class="card p-3" style="background-color: #e3f4fc">
								<%
								ArrayList<Candidate> candidateList=CandidateDao.getZeroAssignment_CandidateListbyJobRole((int)session.getAttribute("job_role_id"));
								
								for(int i=0;i<candidateList.size();i++)
								{
									Candidate candidate=candidateList.get(i);
									%>
									<div class="row ">
										<div class="col-9">
											<%=candidate.getFname()+" "+candidate.getLname() %>
										</div>
										<div class="col-3">
											<input type="checkbox" name="checkbox_<%=candidate.getCandidate_id()%>">
										</div>
									</div>
									<% 
									if(i<candidateList.size()-1)
									{%>									
										<hr>
									<%}
								}
								%>
							</div>
							<div class="card p-3" style="background-color: #e3f4fc">
								<%if(candidateList.size()==0)
								{%>
									<h5>No Candidates Available</h5>
								<%}
								else
								{%>									
									<div class="row">
										<div class="col-2  offset-10">
											<input type="hidden" name="job_role_id" value="<%=(int)session.getAttribute("job_role_id")%>">
											<input type="submit" value="Next" class="btn btn-primary">
										</div>
									</div>
								<%}
								%>
							</div>
						</form>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>