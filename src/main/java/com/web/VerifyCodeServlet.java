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
 * Servlet implementation class VerifyCodeServlet
 */
@WebServlet("/VerifyCode")
public class VerifyCodeServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();

		Employee employee = (Employee) session.getAttribute("employee");

		String userEnteredCode = request.getParameter("userEnteredCode");

		String verificationCode = (String) session.getAttribute("verificationCode");

		if (userEnteredCode.equals(verificationCode))
		{
			int status = EmployeeDao.saveEmployee(employee);

			if (status == 1)
			{
				// out.print("<h1><p>Record saved successfully!</p></h1>")
				session.setAttribute("employeeName", employee.getEmployee_name());
				session.setAttribute("isValid", "Yes");
				response.sendRedirect("EmployeeRegisterSuccessfully.jsp");
			} else
			{
				System.out.println("DB emp Save Errror");
			}

		} else
		{
			session.setAttribute("isValid", "No");
			response.sendRedirect("VerifyEmail.jsp");
			// pw.println("Incorrect verification code");
		}
	}
}
