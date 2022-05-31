package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.CandidateDao;
import com.dao.EmployeeDao;
import com.dao.Interview_ScheduleDao;
import com.model.Candidate;
import com.model.Employee;
import com.model.Interview_Schedule;
import com.service.SendEmail;
import com.service.TimeConverter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/rescheduleinterview")
public class RescheduleInterview extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int round_type = Integer.parseInt(request.getParameter("round_type"));
		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));
		int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
		int emp_id = Integer.parseInt(request.getParameter("employee_id"));
		String date = request.getParameter("date");
		String startTimeIn24hours = request.getParameter("stime");

		String endTimein24hours = request.getParameter("etime");

		// time change to 24 hours to 12 hours
		String startTime = TimeConverter.changeTimeTo12Hours(startTimeIn24hours);
		String endTime = TimeConverter.changeTimeTo12Hours(endTimein24hours);

		String platform = request.getParameter("platform");
		String meeting_Link = request.getParameter("meetingLink");
		if (platform.equals("F2F") || platform.equals("Telephonic"))
		{
			meeting_Link = "No-Link";
		}

		Interview_Schedule interview = new Interview_Schedule();
		interview.setInterview_schedule_id(schedule_id);
		interview.setEmployee_id(emp_id);
		interview.setDate(date);
		interview.setRound_type(round_type);
		interview.setStart_time(startTime);
		interview.setEnd_time(endTime);
		interview.setPlatform(platform);
		interview.setMeetingLink(meeting_Link);

		PrintWriter out = response.getWriter();

		// round_type-- technical round=1 , MGMT/Hr round=2
		if (round_type == 1)
		{
			Interview_Schedule schedule = Interview_ScheduleDao.getLastestScheduleByCandidateId(candidate_id);
			int roundtype = schedule.getRound_type();
			if (roundtype == 1)
			{

				interview.setTech_round_no(schedule.getTech_round_no());
				interview.setHr_round_no(schedule.getHr_round_no());
			} else
			{

				interview.setTech_round_no(schedule.getTech_round_no() + 1);
				interview.setHr_round_no(schedule.getHr_round_no() - 1);
			}
		} else
		{

			Interview_Schedule schedule = Interview_ScheduleDao.getLastestScheduleByCandidateId(candidate_id);
			int roundtype = schedule.getRound_type();
			if (roundtype == 2)
			{

				interview.setTech_round_no(schedule.getTech_round_no());
				interview.setHr_round_no(schedule.getHr_round_no());
			} else
			{

				interview.setTech_round_no(schedule.getTech_round_no() - 1);
				interview.setHr_round_no(schedule.getHr_round_no() + 1);
			}

		}
		// reschedule DBMS status
		int updateSave_Status = Interview_ScheduleDao.updateInterviewSchedule(interview,
				loggedEmployee.getEmployee_id());

		if (updateSave_Status == 1)
		{
			Employee emp = EmployeeDao.getEmployeeById(emp_id);
			String time = startTime + "-" + endTime;
			boolean empMailSendStatus = SendEmail.sendScheduleDeatilsToPanel(emp.getEmployee_emailid(), date, time,
					meeting_Link);

			Candidate candidate = CandidateDao.getCandidateById(candidate_id);
			boolean candidateMailSendStatus = SendEmail.sendReScheduleDeatilsToCandidate(candidate.getEmailid(), date,
					time, meeting_Link);

			if (empMailSendStatus == true && candidateMailSendStatus == true)
			{
				session.setAttribute("scheduleType", null);
				response.sendRedirect("ScheduleInterview.jsp");
			} else
			{
				System.out.println("error while sending mail");
			}

		} else
		{
			out.print("you have not schedule interview");
		}

	}
}
