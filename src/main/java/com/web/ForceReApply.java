package com.web;

import java.io.IOException;

import com.dao.CandidateDao;
import com.dao.Interview_ScheduleDao;
import com.model.Candidate;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forceReApply")
public class ForceReApply extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int candidate_id = (int) session.getAttribute("candidate_id");
		int status = CandidateDao.updateToNotActive(candidate_id, loggedEmployee.getEmployee_id());
		if (status == 1)
		{
			Candidate candidate = (Candidate) session.getAttribute("newCandidateDetails");
			int saveStatus = CandidateDao.saveCandidate(candidate, loggedEmployee.getEmployee_id());
			if (saveStatus == 1)
			{
				int scheduleCount = Interview_ScheduleDao.getScheduleCountByCandidateId(candidate_id);
				if (scheduleCount > 0)
				{
					int changeStatus = Interview_ScheduleDao.setCompleteAllScheduleForCandidate(candidate_id,
							loggedEmployee.getEmployee_id());

					if (changeStatus == 1)
					{
						response.sendRedirect("CandidateSaved.jsp");
					} else
					{
						System.out.println("unable to change iscomplete status");
					}
				} else
				{
					response.sendRedirect("CandidateSaved.jsp");
				}

			} else
			{
				System.out.println("can not saved to DBMS");
			}
		}
	}
}
