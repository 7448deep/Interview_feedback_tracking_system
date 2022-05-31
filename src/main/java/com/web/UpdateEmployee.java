package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.EmployeeDao;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateemployee")
public class UpdateEmployee extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		String name = request.getParameter("employee_name");
		String username = request.getParameter("employee_username");
		String email = request.getParameter("employee_email");

		Employee employee = new Employee();
		employee.setEmployee_id(employee_id);
		employee.setEmployee_name(name);
		employee.setEmployee_username(username);
		employee.setEmployee_emailid(email);

		PrintWriter out = response.getWriter();
		int status = EmployeeDao.updateEmployee(employee);
		if (status == 1)
		{
			response.sendRedirect("EmployeeList.jsp");

		} else
		{
			out.print("not updated");
		}
	}
}
