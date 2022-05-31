package com.web;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.CandidateDao;
import com.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/showselectedcandidate_assignment")
public class ShowselectedcandidateTable_assignment extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int job_role_id = Integer.parseInt(request.getParameter("job_role_id"));

		ArrayList<Candidate> candidateList = CandidateDao.getZeroAssignment_CandidateListbyJobRole(job_role_id);

		ArrayList<Candidate> list_of_selectedCandidateForAssignment = new ArrayList<Candidate>();
		for (int i = 0; i < candidateList.size(); i++)
		{
			Candidate candidate = candidateList.get(i);
			String isCandidateSelected = request.getParameter("checkbox_" + candidate.getCandidate_id());

			if (isCandidateSelected != null && isCandidateSelected.equals("on"))
			{
				list_of_selectedCandidateForAssignment.add(candidate);
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("list_of_selectedCandidateForAssignment", list_of_selectedCandidateForAssignment);
		response.sendRedirect("UploadAssignment.jsp");

	}
}
