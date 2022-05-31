package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class GotoUpdateSkillName
 */
@WebServlet("/gotoupdateskillname")
public class GotoUpdateSkillName extends HttpServlet
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int skill_id = Integer.parseInt(request.getParameter("skill_id"));
		String skillname = request.getParameter("skill_name");
		int job_role_id = Integer.parseInt(request.getParameter("job_role_id"));

		HttpSession session = request.getSession();
		session.setAttribute("job_role_id", job_role_id);
		session.setAttribute("skillname", skillname);
		session.setAttribute("skillid", skill_id);
		response.sendRedirect("UpdateSkillName.jsp");
	}
}
