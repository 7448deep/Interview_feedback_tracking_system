package com.web;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import com.dao.AssignmentsDao;
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

@WebServlet("/assigntask_to_candidate")
@MultipartConfig
public class AssignTask_toCandidate extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		Part assignment = request.getPart("assignment");

		 if (assignment != null) 
		 {
			 InputStream is = assignment.getInputStream();
			 int savestatus=AssignmentsDao.saveAssignmet_problem(is, loggedEmployee.getEmployee_id());
			if(savestatus>0)
			{
				int lastInsertedId = AssignmentsDao.getLastInsertedId();
				ArrayList<Candidate> candidateList = (ArrayList<Candidate>) session
						.getAttribute("list_of_selectedCandidateForAssignment");
				int cnt = 0;

				int assignment_id = lastInsertedId ;

				for (int i = 0; i < candidateList.size(); i++)
				{
					Candidate candidate = candidateList.get(i);

					int status = CandidateDao.addAssignmetdetails(assignment_id, candidate.getCandidate_id(),
							loggedEmployee.getEmployee_id());
					if (status == 1)
					{
						cnt++;
					}
				}
				if (cnt == candidateList.size())
				{
					response.sendRedirect("AssignmentGivenSuccessfully.jsp");
				} else
				{
					System.out.println("error");
				}
			}
			
			
	      }
		 
		


	}
}
