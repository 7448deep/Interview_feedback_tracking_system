package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/gotoeditemployee")
public class GotoeEditEmployee extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));

		HttpSession session = request.getSession();
		session.setAttribute("employee_id", employee_id);

		response.sendRedirect("EditEmployee.jsp");

	}
}
