package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.model.JobRole;

public class JobRoleDao
{

	// this method will save JobRole information getting from user form to JobRole
	// table into DBMS
	public static int saveJobRole(JobRole job, int employee_id)
	{
		int status = 0;

		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());
		try
		{

			// getting the connection object
			Connection con = GetDBConnection.getConnection();

			// sql Insert query
			PreparedStatement ps = con
					.prepareStatement("insert into jobrole(job_title,createdOn,createdBy,updatedOn) values (?,?,?,?)");

			// setting values to prepared statement
			ps.setString(1, job.getJob_title());
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setTimestamp(4, timestamp);

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

	public static ArrayList<JobRole> getListJob()
	{
		ArrayList<JobRole> list = new ArrayList<JobRole>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from jobrole ORDER BY job_title");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				JobRole job = new JobRole();
				job.setJob_role_id(rs.getInt(1));
				job.setJob_title(rs.getString(2));

				list.add(job);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	public static JobRole getJobRoleByid(int jobrole_id)
	{

		JobRole job = new JobRole();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from jobrole where job_role_id=?");
			ps.setInt(1, jobrole_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				job.setJob_role_id(rs.getInt(1));
				job.setJob_title(rs.getString(2));

			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return job;
	}

}
