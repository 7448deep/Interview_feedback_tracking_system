package com.web;

import java.io.IOException;
import java.util.Random;

import com.model.Employee;
import com.service.SendEmail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/registeremployee")
public class RegisterEmployee extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String employeename = request.getParameter("employeename");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Employee employee = new Employee();

		employee.setEmployee_name(employeename);
		employee.setEmployee_username(username);
		employee.setEmployee_emailid(email);
		employee.setEmployee_password(password);

		HttpSession session = request.getSession();

		// generating the random no
		Random rd = new Random();
		int number = rd.nextInt(9999);
		String code = String.format("%04d", number);

		// send verification email
		boolean test = SendEmail.sendVerficationCodeToUser(email, code);

		if (test)
		{
			session.setAttribute("verificationCode", code);
			session.setAttribute("employee", employee);
			response.sendRedirect("VerifyEmail.jsp");
		}
	}
}
