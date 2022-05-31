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

@WebServlet("/scheduleinterview")
public class ScheduleInterview extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		// round_type-- technical round=1 , MGMT/Hr round=2
		int round_type = Integer.parseInt(request.getParameter("round_type"));

		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));

		int emp_id = Integer.parseInt(request.getParameter("employee_id"));

		String date = request.getParameter("date");
		String startTimeIn24hours = request.getParameter("stime");

		String endTimein24hours = request.getParameter("etime");

		// time converting 24 to 12 hours
		String startTime = TimeConverter.changeTimeTo12Hours(startTimeIn24hours);
		String endTime = TimeConverter.changeTimeTo12Hours(endTimein24hours);

		int roundno = Integer.parseInt(request.getParameter("round_no"));
		String platform = request.getParameter("platform");
		String meeting_Link = request.getParameter("meetingLink");
		if (platform.equals("F2F") || platform.equals("Telephonic"))
		{
			meeting_Link = "No-Link";
		}

		Interview_Schedule interview = new Interview_Schedule();
		interview.setCandidate_id(candidate_id);
		interview.setEmployee_id(emp_id);
		interview.setDate(date);
		interview.setRound_no(roundno);
		interview.setRound_type(round_type);
		interview.setStart_time(startTime);
		interview.setEnd_time(endTime);
		interview.setPlatform(platform);
		interview.setMeetingLink(meeting_Link);

		PrintWriter out = response.getWriter();

		if (round_type == 1)
		{
			Interview_Schedule schedule = Interview_ScheduleDao.getLastestScheduleByCandidateId(candidate_id);
			interview.setTech_round_no(schedule.getTech_round_no() + 1);
			interview.setHr_round_no(schedule.getHr_round_no());
		} else
		{
			Interview_Schedule schedule = Interview_ScheduleDao.getLastestScheduleByCandidateId(candidate_id);
			interview.setTech_round_no(schedule.getTech_round_no());
			interview.setHr_round_no(schedule.getHr_round_no() + 1);
		}

		int scheduleSave_Status = Interview_ScheduleDao.saveSchedule(interview, loggedEmployee.getEmployee_id());
		// parameter 1 cause 1=interview onGoing
		int candidate_status = CandidateDao.updateCandidateStatus(1, candidate_id, loggedEmployee.getEmployee_id());
		// condition checking updated to DB or Not

		if (scheduleSave_Status == 1 && candidate_status == 1)
		{
			Employee emp = EmployeeDao.getEmployeeById(emp_id);
			String time = startTime + "-" + endTime;
			boolean empMailSendStatus = SendEmail.sendScheduleDeatilsToPanel(emp.getEmployee_emailid(), date, time,
					meeting_Link);

			Candidate candidate = CandidateDao.getCandidateById(candidate_id);
			boolean candidateMailSendStatus = SendEmail.sendNewScheduleDeatilsToCandidate(candidate.getEmailid(), date,
					time, meeting_Link);

			if (empMailSendStatus == true && candidateMailSendStatus == true)
			{
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
