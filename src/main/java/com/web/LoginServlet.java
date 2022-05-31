package com.web;

import java.io.IOException;

import com.dao.EmployeeDao;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();

		Employee employee = EmployeeDao.loginUser(username, password);

		if (employee.getEmployee_username() != null)
		{
			session.setAttribute("Loggeduser", employee);
			response.sendRedirect("HomePage.jsp");

		} else
		{

			session.setAttribute("invalidMsg", "Invalid Username or Password");
			response.sendRedirect("login.jsp");
		}

	}
}
