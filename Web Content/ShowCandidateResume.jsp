<%@page import="java.io.File"%>
<%@page import="com.dao.CandidateDao"%>
<%@page import="com.model.Candidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate Resume</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
</head>
<body>	
	<%
		int candidate_id = (int) session.getAttribute("candidate_id");
		Candidate candidate = CandidateDao.getCandidateById(candidate_id);
	%>
		
		
		<embed src="ShowCandidateResume" type="application/pdf" height="700px" width="100%"> 
</body>
</html>