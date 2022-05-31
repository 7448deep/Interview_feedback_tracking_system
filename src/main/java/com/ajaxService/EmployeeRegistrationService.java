package com.ajaxService;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.EmployeeDao;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeRegistrationService")
public class EmployeeRegistrationService extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String data = request.getParameter("data");

		if (data.charAt(0) == '1')
		{
			String username = data.substring(1);

			int value = EmployeeDao.isUsernameAvailble(username);

			String status = "";
			if (value == 0)
			{
				status = "valid";
			} else if (value > 0)
			{
				status = "invalid";
			}
			Gson gson = new Gson();
			JsonObject myObj = new JsonObject();

			JsonElement Returndata = gson.toJsonTree(status);

			myObj.addProperty("success", true);

			myObj.add("isUsernameValid", Returndata);

			PrintWriter out = response.getWriter();
			out.println(myObj.toString());

		} else if (data.charAt(0) == '2')
		{
			String email_id = data.substring(1);

			Integer value = EmployeeDao.isemailidAvailable(email_id);
			String status = "";
			if (value == 0)
			{
				status = "valid";
			} else if (value > 0)
			{
				status = "invalid";
			}
			Gson gson = new Gson();
			JsonObject myObj = new JsonObject();

			JsonElement Returndata = gson.toJsonTree(status);

			myObj.addProperty("success", true);

			myObj.add("isEmailidValid", Returndata);

			PrintWriter out = response.getWriter();
			out.println(myObj.toString());
		}
	}
}
