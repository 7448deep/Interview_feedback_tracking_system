package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.model.Feedback;

public class FeedbackDao
{

	public static int saveFeedback(Feedback feedback, int employee_id)
	{
		int status = 0;

		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());
		try
		{
			// getting the connection object
			Connection con = GetDBConnection.getConnection();

			// sql Insert Query
			PreparedStatement ps = con.prepareStatement(
					"insert into interview_feedback(interview_schedule_id,skill_id,rating,comment,createdOn,createdBy) values(?,?,?,?,?,?)");

			// setting values to prepared statement

			ps.setInt(1, feedback.getInterview_schedule_id());
			ps.setString(2, feedback.getSkill_id());
			ps.setInt(3, feedback.getRating());
			ps.setString(4, feedback.getComment());
			ps.setTimestamp(5, timestamp);
			ps.setInt(6, employee_id);

			// calling method to save value to dbms
			status = ps.executeUpdate();
			con.close();
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
		// return the result data saved/not saved
		return status;
	}

	public static ArrayList<Feedback> getFeedbackListByScheduleId(int schedule_id)
	{

		ArrayList<Feedback> feedbacklist = new ArrayList<Feedback>();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select *  from interview_feedback where interview_schedule_id=?");
			ps.setInt(1, schedule_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				Feedback feedback = new Feedback();
				feedback.setFeedback_id(rs.getInt(1));
				feedback.setInterview_schedule_id(rs.getInt(2));
				feedback.setSkill_id(rs.getString(3));
				feedback.setRating(rs.getInt(4));
				feedback.setComment(rs.getString(5));
				feedbacklist.add(feedback);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return feedbacklist;
	}
}
