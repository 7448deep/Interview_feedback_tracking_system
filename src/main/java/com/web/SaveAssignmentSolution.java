package com.web;

import java.io.IOException;
import java.io.InputStream;

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

@WebServlet("/saveAssignmentSolution")
@MultipartConfig
public class SaveAssignmentSolution extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Employee loggedEmployee = (Employee) session.getAttribute("Loggeduser");

		int candidate_id = (int) session.getAttribute("candidate_id");
		Candidate candidate=CandidateDao.getCandidateById(candidate_id);
		Part assignmentSolution = request.getPart("assignment_solution");
		 if (assignmentSolution != null) 
		 {
			 InputStream is = assignmentSolution.getInputStream();
			 int saveSolution_status=AssignmentsDao.saveAssignmetSolution(is,candidate.getAssignment_id(), loggedEmployee.getEmployee_id());
			 if(saveSolution_status==1)
			 {
				 int status=CandidateDao.updateAssignmentStatus(2, candidate_id, loggedEmployee.getEmployee_id());
				 if (status == 1)
					{
						response.sendRedirect("ShowCandidateAssignment.jsp");
					} else
					{
						System.out.println("Error");
					}
			 }
			
		 }
		

	}
}
