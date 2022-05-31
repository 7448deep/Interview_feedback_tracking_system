package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class GoToFeedbackForm
 */
@WebServlet("/gotofeedbackform")
public class GoToFeedbackForm extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));

		HttpSession session = request.getSession();
		session.setAttribute("schedule_id", schedule_id);
		response.sendRedirect("FeedbackForm.jsp");
	}
}
