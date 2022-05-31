package com.web;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.CandidateDao;
import com.dao.EmployeeDao;
import com.dao.FeedbackDao;
import com.dao.Interview_ScheduleDao;
import com.dao.SkillsDao;
import com.model.Candidate;
import com.model.Employee;
import com.model.Feedback;
import com.model.Interview_Schedule;
import com.model.Skills;
import com.service.SendEmail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SaveFeedback
 */
@WebServlet("/savefeedback")
public class SaveFeedback extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));

		Candidate candidate = CandidateDao.getCandidateById(candidate_id);
		Feedback feedback = new Feedback();
		int scheduleid = Integer.parseInt(request.getParameter("schedule_id"));
		feedback.setInterview_schedule_id(scheduleid);

		String roundfeedback = request.getParameter("roundFeedback");

		int counter = 0;
		ArrayList<Skills> skill_list = SkillsDao.getSkillList(candidate.getAppliedforrole());
		for (int i = 0; i < skill_list.size(); i++)
		{
			Skills skill = skill_list.get(i);
			int skillid = skill.getSkill_id();
			int rating = Integer.parseInt(request.getParameter("rating_" + skillid));

			String comment = request.getParameter("comment_" + skillid);

			feedback.setSkill_id(Integer.toString(skillid));
			feedback.setRating(rating);
			feedback.setComment(comment);

			int status = FeedbackDao.saveFeedback(feedback, loggedEmployee.getEmployee_id());
			if (status == 1)
			{
				counter++;
			}
		}
		if (counter == skill_list.size())
		{

			int saveFeedbackToDBstatus = Interview_ScheduleDao.setIscompleteAndNote(scheduleid, roundfeedback,
					loggedEmployee.getEmployee_id());
			if (saveFeedbackToDBstatus == 1)
			{
				String candidateName = candidate.getFname() + " " + candidate.getLname();
				Interview_Schedule schedule = Interview_ScheduleDao.getSchedulebySchedule_id(scheduleid);
				Employee emp = EmployeeDao.getEmployeeById(schedule.getEmployee_id());
				String employeeName = emp.getEmployee_name();
				String date = schedule.getDate();
				String time = schedule.getStart_time() + " To " + schedule.getEnd_time();
				boolean sendMailToHRstatus = SendEmail.sendScheduleCompletedStatustoHR(candidateName, employeeName,
						date, time);
				if (sendMailToHRstatus == true)
				{
					session.setAttribute("candidate_id", candidate_id);
					response.sendRedirect("CandidateProfile.jsp");
				}

			} else
			{

				System.out.println("DB saveError");
			}

		}
	}
}
