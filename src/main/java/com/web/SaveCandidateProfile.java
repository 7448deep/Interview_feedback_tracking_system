package com.web;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.dao.CandidateDao;
import com.dao.ResumeDao;
import com.model.Candidate;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/savecandidate")
@MultipartConfig
public class SaveCandidateProfile extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		// getting values getting from frontend and assigned to local variables
		String firstname = request.getParameter("fname");

		String lastname = request.getParameter("lname");

		long mobileno = Long.parseLong(request.getParameter("mobileno"));

		String emailid = request.getParameter("emailid");

		String highqualification = request.getParameter("highqualification");

		int totalexp = Integer.parseInt(request.getParameter("totalyearofexperience"));

		String previousorg;
		if (totalexp == 0)
		{
			previousorg = "fresher";
		} else
		{
			previousorg = request.getParameter("previousorg");
		}
		String coreskills = request.getParameter("coreskills");

		int appliedfor = Integer.parseInt(request.getParameter("appliedforrole"));

		String initialfeedback = request.getParameter("initialfeedback");

		// creating object of candidate and seting all values coming from user using
		// setter method
		Candidate candidate = new Candidate();

		candidate.setFname(firstname);
		candidate.setLname(lastname);
		candidate.setMobileno(mobileno);
		candidate.setEmailid(emailid);
		candidate.setHighqualification(highqualification);
		candidate.setTotalyearofexperience(totalexp);
		candidate.setPreviousorg(previousorg);
		candidate.setCoreskills(coreskills);
		candidate.setAppliedforrole(appliedfor);
		candidate.setInitialfeedback(initialfeedback);

		// candidatelist applied for role
		ArrayList<Candidate> candidateList = CandidateDao.getCandidateListbyJobRole(appliedfor);
		int isApplicable = 0;
		int tempCandidate_id = 0;
		for (int i = 0; i < candidateList.size(); i++)
		{
			Candidate tempCandidate = candidateList.get(i);
			// candidate available with same emailId applied for same role
			if (tempCandidate.getEmailid().equals(emailid))
			{
				tempCandidate_id = tempCandidate.getCandidate_id();
				Date d = new Date();
				Timestamp todayTimestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(),
						d.getMinutes(), d.getSeconds(), d.getSeconds());
				Timestamp previousTimestamp = tempCandidate.getCreatedOn();

				int days = CandidateDao.applicationDifference(todayTimestamp, previousTimestamp);
				session.setAttribute("days", days);
				if (days > 90)
				{
					isApplicable = 1;
				}
				break;

			}
			// else part means there is no such candidate
			else
			{
				isApplicable = 1;
			}
		}
		if (isApplicable == 1 || candidateList.size() == 0)
		{

			// calling the method to save the data into DBMS and getting result in status
			// variable
			int status = CandidateDao.saveCandidate(candidate, loggedEmployee.getEmployee_id());
			if (status == 1)
			{
				int candidate_id = CandidateDao.getcandidate_id_byEmailid_and_Jobrole(emailid, appliedfor);
				
				//resume upload to database
				 Part part = request.getPart("resume");
				 if (part != null) 
				 {
					 InputStream is = part.getInputStream();
					int resumeUploadStatus= ResumeDao.saveResume(candidate_id, is, loggedEmployee.getEmployee_id());
			           
					if (resumeUploadStatus == 1)
					{
						response.sendRedirect("CandidateSaved.jsp");
					} else
					{
						System.out.println("REsume is not saved");
					}
			       }
					
			} else
			{
				System.out.println("Not saved to DBMS");
			}
		} else
		{
			session.setAttribute("candidate_id", tempCandidate_id);
			session.setAttribute("newCandidateDetails", candidate);
			response.sendRedirect("CandidateAlreadyApplied.jsp");
		}

	}
}
