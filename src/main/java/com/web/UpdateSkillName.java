package com.web;

import java.io.IOException;

import com.dao.SkillsDao;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateSkillName
 */
@WebServlet("/updateskilllname")
public class UpdateSkillName extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int skill_id = Integer.parseInt(request.getParameter("skill_id"));
		String skillName = request.getParameter("skill_name");
		int job_role_id = Integer.parseInt(request.getParameter("job_role_id"));

		int status = SkillsDao.updateSkillName(skill_id, skillName, loggedEmployee.getEmployee_id());

		if (status == 1)
		{
			session.setAttribute("job_role_id", job_role_id);
			response.sendRedirect("AddSkill.jsp");
		} else
		{
			System.out.println("Error");
		}
	}
}
