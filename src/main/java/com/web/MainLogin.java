package com.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mainLogin")
public class MainLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String mainUsername="deep";
		String mainPassword="passme";
		if(username.equals(mainUsername)&&password.equals(mainPassword))
		{
			response.sendRedirect("login.jsp");
		}
		else
		{
			response.sendRedirect("MainLogin.jsp");
		}
		
	}

}
