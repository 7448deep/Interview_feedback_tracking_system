package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.CandidateDao;
import com.model.Candidate;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updatecandidate")
public class UpdateCandidateProfile extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		// getting values getting from frontend and assigned to local variables
		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));
		String firstname = request.getParameter("fname");

		String lastname = request.getParameter("lname");

		long mobileno = Long.parseLong(request.getParameter("mobileno"));

		String emailid = request.getParameter("emailid");

		String highqualification = request.getParameter("highqualification");

		String totalexp = request.getParameter("totalyearofexperience");
		// checking condition because value coming from frontend is in the form of
		// string
		int totalexperiance;
		if (totalexp == "")
		{
			totalexperiance = 0;
			// otherwise you will get exception you can not convert empty string to int
		} else
		{
			totalexperiance = Integer.parseInt(totalexp);
		}

		String previousorg = request.getParameter("previousorg");

		String coreskills = request.getParameter("coreskills").trim();

		int appliedfor = Integer.parseInt(request.getParameter("appliedforrole"));

		String initialfeedback = request.getParameter("initialfeedback").trim();

		// creating object of candidate and seting all values coming from user using
		// setter method
		Candidate candidate = new Candidate();
		candidate.setCandidate_id(candidate_id);
		candidate.setFname(firstname);
		candidate.setLname(lastname);
		candidate.setMobileno(mobileno);
		candidate.setEmailid(emailid);
		candidate.setHighqualification(highqualification);
		candidate.setTotalyearofexperience(totalexperiance);
		candidate.setPreviousorg(previousorg);
		candidate.setCoreskills(coreskills);
		candidate.setAppliedforrole(appliedfor);
		candidate.setInitialfeedback(initialfeedback);

		PrintWriter out = response.getWriter();
		int status = CandidateDao.updateCandidate(candidate, loggedEmployee.getEmployee_id());
		if (status == 1)
		{
			session.setAttribute("candidate_id", candidate_id);
			response.sendRedirect("CandidateProfile.jsp");

		} else
		{
			out.print("Error");
		}
	}
}
