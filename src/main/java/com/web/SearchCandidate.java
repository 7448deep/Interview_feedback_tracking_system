package com.web;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.CandidateDao;
import com.dao.Interview_ScheduleDao;
import com.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/searchcandidate")
public class SearchCandidate extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String searchBy = request.getParameter("searchby");

		if (searchBy.equals("candidate"))
		{
			int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));
			Candidate candidate = CandidateDao.getCandidateById(candidate_id);
			ArrayList<Candidate> candidatelist = new ArrayList<Candidate>();
			candidatelist.add(candidate);

			HttpSession session = request.getSession();

			session.setAttribute("candidatedata", candidatelist);
			response.sendRedirect("SearchCandidateTable.jsp");

		} else if (searchBy.equals("interviewer"))
		{
			int employee_id = Integer.parseInt(request.getParameter("employee_id"));

			ArrayList candidate_id_list = Interview_ScheduleDao.getCandidate_IdListByEmployeeId(employee_id);

			ArrayList<Candidate> candidatelist = new ArrayList<Candidate>();
			for (int i = 0; i < candidate_id_list.size(); i++)
			{
				Candidate c = CandidateDao.getCandidateById((int) candidate_id_list.get(i));
				candidatelist.add(c);
			}

			HttpSession session = request.getSession();

			session.setAttribute("candidatedata", candidatelist);
			response.sendRedirect("SearchCandidateTable.jsp");

		} else if (searchBy.equals("jobrole"))
		{
			int job_role_id = Integer.parseInt(request.getParameter("Job_role_id"));
			ArrayList<Candidate> candidatelist = CandidateDao.getCandidateListbyJobRole(job_role_id);

			HttpSession session = request.getSession();
			session.setAttribute("candidatedata", candidatelist);

			response.sendRedirect("SearchCandidateTable.jsp");

		} else if (searchBy.equals("date"))
		{
			String startingDate = request.getParameter("sdate");
			String endingDate = request.getParameter("edate");
			ArrayList candidate_id_list = Interview_ScheduleDao.getCandidate_IdListByDate(startingDate, endingDate);

			ArrayList<Candidate> candidatelist = new ArrayList<Candidate>();
			for (int i = 0; i < candidate_id_list.size(); i++)
			{
				Candidate c = CandidateDao.getCandidateById((int) candidate_id_list.get(i));
				candidatelist.add(c);
			}

			HttpSession session = request.getSession();

			session.setAttribute("candidatedata", candidatelist);
			response.sendRedirect("SearchCandidateTable.jsp");

		}
	}
}
