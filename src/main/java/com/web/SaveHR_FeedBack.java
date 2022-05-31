package com.web;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.FeedbackDao;
import com.dao.Hr_SkillsDao;
import com.dao.Interview_ScheduleDao;
import com.model.Employee;
import com.model.Feedback;
import com.model.Hr_Skills;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/save_hr_feedback")
public class SaveHR_FeedBack extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));
		int scheduleid = Integer.parseInt(request.getParameter("schedule_id"));
		String roundfeedback = request.getParameter("roundFeedback");

		Feedback feedback = new Feedback();
		feedback.setInterview_schedule_id(scheduleid);

		int counter = 0;
		ArrayList<Hr_Skills> Hr_Skills_list = Hr_SkillsDao.getHR_SkillList();

		for (int i = 0; i < Hr_Skills_list.size(); i++)
		{
			Hr_Skills skill = Hr_Skills_list.get(i);

			String skill_id = skill.getSkill_id();
			int rating = Integer.parseInt(request.getParameter("rating_" + skill_id));
			String comment = request.getParameter("comment_" + skill_id);
			feedback.setSkill_id(skill_id);
			feedback.setRating(rating);
			feedback.setComment(comment);
			int status = FeedbackDao.saveFeedback(feedback, loggedEmployee.getEmployee_id());
			if (status == 1)
			{
				counter++;
			}
		}
		if (counter == Hr_Skills_list.size())
		{

			int status = Interview_ScheduleDao.setIscompleteAndNote(scheduleid, roundfeedback,
					loggedEmployee.getEmployee_id());
			session.setAttribute("candidate_id", candidate_id);
			response.sendRedirect("CandidateProfile.jsp");
		}
	}
}
