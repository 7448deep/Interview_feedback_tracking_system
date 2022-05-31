package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/getcandidatelistforassignment")
public class GotoAssignmentPageByTakinglist extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int job_role_id = Integer.parseInt(request.getParameter("job_role_id"));

		HttpSession session = request.getSession();
		session.setAttribute("job_role_id", job_role_id);
		response.sendRedirect("CandidateTable_Assignment.jsp");
	}
}
