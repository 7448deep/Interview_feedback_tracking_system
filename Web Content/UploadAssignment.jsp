<%@page import="com.model.Candidate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Assignment</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.inputError {
	color: red;
	font-size: 12px;
}
</style>
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
					<div class="row">
						<div class="col-6 offset-2">
							<form onsubmit="return validateUploadFile()" action="assigntask_to_candidate" method="post" enctype="multipart/form-data">
							
								<div class="card p-3" style="background-color: #5cd1f7">					
									<h3>Upload Assignments</h3>
								</div>
								<div class="card p-3" style="background-color: #e3f4fc">
									<div class="row">
										<div class="col-5">
											Select File:
										</div>
										<div class="col-5">
											<input name="assignment"  id="assignment" type="file" onclick="removeError('assignment')">
											<br>
											<span class="inputError" id="assignmentError"></span>
										</div>
									</div>
									
								</div>
								<div class="card p-3" style="background-color: #e3f4fc">
									<strong>Selected Candidates for Assignment</strong>
									<%ArrayList<Candidate>candidate_list=(ArrayList<Candidate>)session.getAttribute("list_of_selectedCandidateForAssignment"); 
									for(int i=0;i<candidate_list.size();i++)
									{ Candidate candidate=candidate_list.get(i);
									%>
										<div class="row p-3">
												<div class="col">
													<%=candidate.getFname()+" "+candidate.getLname() %>
												</div>
										</div>	
									<%}
									%>
									
								</div>
								<div class="card p-3" style="background-color: #e3f4fc">
									<div class="row">
										<div class="col-3  offset-9">
											<input type="submit" value="Assign Task" class="btn btn-primary">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function removeError(id) 
	{
		document.getElementById(id + "Error").innerHTML = "";
	}
	function validateUploadFile() 
	{
		var assignment=document.getElementById("assignment");
		let files=assignment.files;
		if(files.length>0)
		{
			if(files[0].size>200*1024)
			{
				document.getElementById("assignmentError").innerHTML = "*File size Too Much";	
				return false;
			}
		}
		else
		{
			document.getElementById("assignmentError").innerHTML = "*Plese Select File";
			return false;
		}	
	}
	</script>
</body>
</html>