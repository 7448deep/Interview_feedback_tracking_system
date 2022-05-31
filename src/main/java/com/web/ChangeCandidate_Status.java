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

@WebServlet("/change_candidate_status")
public class ChangeCandidate_Status extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));
		System.out.println();
		int candidate_status = Integer.parseInt(request.getParameter("candidate_status"));
		int save_candidate_status = CandidateDao.updateCandidateStatus(candidate_status, candidate_id,
				loggedEmployee.getEmployee_id());

		session.setAttribute("candidate_id", candidate_id);
		response.sendRedirect("EditCandidateProfile.jsp");

	}
}
