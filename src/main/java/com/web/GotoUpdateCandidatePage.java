package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/gotoupdatecandidate")
public class GotoUpdateCandidatePage extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));

		HttpSession session = request.getSession();
		session.setAttribute("candidate_id", candidate_id);
		response.sendRedirect("EditCandidateProfile.jsp");
	}
}
