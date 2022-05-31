package com.web;

import java.io.IOException;

import com.dao.SkillsDao;
import com.model.Employee;
import com.model.Skills;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/saveskill")
public class SaveSkill extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		String skillname = request.getParameter("skill");
		int job_role_id = Integer.parseInt(request.getParameter("job_role_id"));
		Skills skill = new Skills();
		skill.setSkill_name(skillname);
		skill.setJob_role_id(job_role_id);

		int status = SkillsDao.saveSkills(skill, loggedEmployee.getEmployee_id());
		if (status == 1)
		{
			session.setAttribute("job_role_id", job_role_id);
			response.sendRedirect("AddSkill.jsp");

		} else
		{
			System.out.println("error");
		}
	}
}
