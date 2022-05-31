package com.ajaxService;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.Interview_ScheduleDao;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/candidateservice")
public class CandidateService extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));

		// System.out.println("max cround
		// "+Interview_ScheduleDao.getMaxCompletedRoundnoByCandidateId(candidate_id));
		// System.out.println("max sround
		// "+Interview_ScheduleDao.getMaxScheduledRoundnoByCandidateId(candidate_id));
		Candidate candidate = new Candidate();

		candidate.setMaxScheduledRound(Interview_ScheduleDao.getMaxScheduledRoundnoByCandidateId(candidate_id));
		candidate.setMaxCompletedRound(Interview_ScheduleDao.getMaxCompletedRoundnoByCandidateId(candidate_id));

		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();

		JsonElement candidateObj = gson.toJsonTree(candidate);

		myObj.addProperty("success", true);

		myObj.add("candidateRoundInfo", candidateObj);

		PrintWriter out = response.getWriter();
		out.println(myObj.toString());

	}
}
