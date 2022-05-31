package com.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import com.model.Resume;
import com.model.Skills;


public class ResumeDao {

	public static int saveResume(int candidate_id,InputStream resume ,int employee_id)
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
					"insert into resume(candidate_id,resume,createdOn,createdBy,updatedOn) values(?,?,?,?,?)");

			// setting values to prepared statement

			ps.setInt(1,candidate_id);
			ps.setBlob(2, resume);
			ps.setTimestamp(3, timestamp);
			ps.setInt(4, employee_id);
			ps.setTimestamp(5, timestamp);

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
	public static Resume getResume(int candidate_id)
	{
		Resume resume=new Resume();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from resume where candidate_id=?");
			ps.setInt(1, candidate_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				resume.setResume_id(rs.getInt(1));
				resume.setCandidate_id(rs.getInt(2));
				resume.setResume(rs.getBlob(3));	

			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return resume;
	}
}
