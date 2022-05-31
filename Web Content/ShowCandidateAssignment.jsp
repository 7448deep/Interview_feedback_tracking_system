<%@page import="com.dao.AssignmentsDao"%>
<%@page import="com.model.Assignments"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment Page</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
</head>	

<body style="background-color: skyblue">
<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<%
		int candidate_id = (int) session.getAttribute("candidate_id");
		Candidate candidate = CandidateDao.getCandidateById(candidate_id);		
	%>
	<div class="container-fluid" >
		<div class="row " >
			<h1 >Assignment</h1>
		</div>
		<div class="row">
			<%
				if(candidate.getAssignment_status()==0)
				{%>
					<div class="row p-2" style="background-color: skyblue">	
						<div class="col offset-2">
							<h3>Assignment is Not Given</h3>
						</div>				
					</div>
				<% }
				else
				{
					int assignment_id=candidate.getAssignment_id();
					
					%>
						<div class="row p-3" >
							<div class="col-6" >
								 <embed src="ShowCandidateAssignment" width="90%" height="650px"></embed>
							</div>
							<div class="col-6 ">
								<%
									if(candidate.getAssignment_status()==1)
									{%>
										<div class="row p-2">										
											<h4>Solution is not submitted yet</h4>
											<div class="row p-3" style="background-color:grey">
												<form onsubmit="return validateSolutionFile()" action="saveAssignmentSolution" method="post" enctype="multipart/form-data">
													<div class="row mb-3">
														<div class="col offset-3" >
															<input type="file" name="assignment_solution" id="assignment_solution" onclick="removeError('assignment_solution')">
															<br>
															<span class="inputError" id="assignment_solutionError"></span>
														</div>
													</div>
													
													<div class="row p-2">
														<div class="col-4 offset-5">
															
															<input type="submit"  class="btn btn-primary" value="Submit">
														</div>
													</div>
												</form>
											</div>
										</div>
									<%}
									else
									{%>
										<embed src="ShowCandidateAssignmentSolution" height="650px" width="90%"></embed>
									<%}
								%>
							</div>
						</div>
					<%
				}
			
			
			%>
		</div>
		
	
	</div>
	<script>
		function removeError(id) 
		{
			document.getElementById(id + "Error").innerHTML = "";
		}
		function validateSolutionFile()
		{
			
			var assignment_solution=document.getElementById("assignment_solution");
			let files=assignment_solution.files;
			if(files.length>0)
			{
				if(files[0].size>200*1024)
				{
					document.getElementById("assignment_solutionError").innerHTML = "*File size Too Much";	
					return false;
				}
			}
			else
			{
				document.getElementById("assignment_solutionError").innerHTML = "*Plese Select File";
				return false;
			}
		}
	</script>
	
</body>
</html>