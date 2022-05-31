package com.web;

import java.io.IOException;

import com.dao.Truncate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/truncatedata")
public class TruncateData extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int k=Truncate.truncatedata();
		response.sendRedirect("MainLogin.jsp");
	}
	
}
