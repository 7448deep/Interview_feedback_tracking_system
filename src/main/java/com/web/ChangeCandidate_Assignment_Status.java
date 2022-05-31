package com.web;

import java.io.IOException;

import com.dao.CandidateDao;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change_candidate_assignment_status")
public class ChangeCandidate_Assignment_Status extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int assignmentStatus = Integer.parseInt(request.getParameter("assignment_status"));
		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));

		int status = CandidateDao.updateAssignmentStatus(assignmentStatus, candidate_id,
				loggedEmployee.getEmployee_id());
		if (status == 1)
		{
			response.sendRedirect("EditCandidateProfile.jsp");
		} else
		{
			System.out.println("something Error");
		}
	}
}
