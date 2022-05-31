package com.web;

import java.io.IOException;

import com.dao.JobRoleDao;
import com.model.Employee;
import com.model.JobRole;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/savejobrole")
public class SaveNewJobRole extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		// getting value from request of role
		String newjobrole = request.getParameter("Job");

		JobRole job = new JobRole();
		job.setJob_title(newjobrole);

		// calling saveJobRole method to save data into DBMS and method return result it
		int status = JobRoleDao.saveJobRole(job, loggedEmployee.getEmployee_id());
		if (status == 1)
		{
			response.sendRedirect("AddJobRole.jsp");
		} else
		{
			System.out.println("error");
		}
	}
}
