package com.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;

import com.dao.AssignmentsDao;
import com.dao.CandidateDao;
import com.dao.ResumeDao;
import com.model.Assignments;
import com.model.Candidate;
import com.model.Resume;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ShowCandidateAssignment")
public class ShowCandidateAssignment extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		int candidate_id = (int) session.getAttribute("candidate_id");
		Candidate candidate = CandidateDao.getCandidateById(candidate_id);
//		Assignments assignment = AssignmentsDao.getAssignment(candidate.getAssignment_id());
//
//		File file = new File("D:/Projects/IFTS_Project data/Assignments/" + assignment.getAssignment_name());
//		byte[] bytes = new byte[(int) file.length()];
//		FileInputStream fis = new FileInputStream(file);
//
//		fis.read(bytes);
//		fis.close();
//
//		OutputStream out = response.getOutputStream();
//
//		out.write(bytes);
		try
		{
		Assignments assignment=AssignmentsDao.getAssignmentProblem(candidate.getAssignment_id());
		Blob blob=assignment.getAssignment_problem();
		byte byteArray[] = blob.getBytes(1, (int) blob.length());
        response.setContentType("application/pdf");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
		}
		 catch (Exception e) {
		       
		    }
	}
}
