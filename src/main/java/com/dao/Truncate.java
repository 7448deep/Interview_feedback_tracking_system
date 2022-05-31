package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

public class Truncate 
{
	public static int truncatedata()
	{
		int status=0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			
			PreparedStatement ps1 = con.prepareStatement("truncate table assignment");
			status = ps1.executeUpdate();
			PreparedStatement ps2 = con.prepareStatement("truncate table candidate");
			status = ps2.executeUpdate();
			PreparedStatement ps3 = con.prepareStatement("truncate table hr_skills");
			status = ps3.executeUpdate();
			PreparedStatement ps4 = con.prepareStatement("truncate table interview_feedback");
			status = ps4.executeUpdate();
			PreparedStatement ps5 = con.prepareStatement("truncate table interview_schedule");
			status = ps5.executeUpdate();
			PreparedStatement ps6 = con.prepareStatement("truncate table jobrole");
			status = ps6.executeUpdate();
			PreparedStatement ps7 = con.prepareStatement("truncate table resume");
			status = ps7.executeUpdate();
			PreparedStatement ps8 = con.prepareStatement("truncate table skills");
			status = ps8.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}
	public static int truncateAlldata()
	{
		int status=0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps1 = con.prepareStatement("truncate table assignment");
			status = ps1.executeUpdate();
			PreparedStatement ps2 = con.prepareStatement("truncate table candidate");
			status = ps2.executeUpdate();
			PreparedStatement ps3 = con.prepareStatement("truncate table hr_skills");
			status = ps3.executeUpdate();
			PreparedStatement ps4 = con.prepareStatement("truncate table interview_feedback");
			status = ps4.executeUpdate();
			PreparedStatement ps5 = con.prepareStatement("truncate table interview_schedule");
			status = ps5.executeUpdate();
			PreparedStatement ps6 = con.prepareStatement("truncate table jobrole");
			status = ps6.executeUpdate();
			PreparedStatement ps7 = con.prepareStatement("truncate table resume");
			status = ps7.executeUpdate();
			PreparedStatement ps8 = con.prepareStatement("truncate table skills");
			status = ps8.executeUpdate();
			PreparedStatement ps9 = con.prepareStatement("truncate table employee");
			status = ps9.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}
}
