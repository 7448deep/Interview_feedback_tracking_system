package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/gotoreschedule")
public class GotoReschedule extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));

		HttpSession session = request.getSession();
		session.setAttribute("schedule_id", schedule_id);
		session.setAttribute("scheduleType", "reschedule");
		response.sendRedirect("ScheduleInterview.jsp");
	}
}
