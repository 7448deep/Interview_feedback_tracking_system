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

/**
 * Servlet implementation class ForgetPasswordServlet
 */
@WebServlet("/forgetpassword")
public class ForgetPasswordServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String newPassword = request.getParameter("newpassword");

		Employee emp = new Employee();

		emp.setEmployee_username(username);
		emp.setEmployee_emailid(email);
		emp.setEmployee_password(newPassword);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int status = EmployeeDao.updatePassword(emp);

		if (status == 1)
		{
			response.sendRedirect("login.jsp");
			// out.print("<h1><p>Password set successfull!</p></h1>");

		} else
		{
			out.println("<h1><p>Somthing went wrong!</p></h1>");
		}

		out.close();
	}

}
