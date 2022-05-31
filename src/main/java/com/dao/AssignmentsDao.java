package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import com.model.Assignments;

public class AssignmentsDao
{
	public static int saveAssignmet_problem(InputStream assignment_problem, int employee_id)
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
					"insert into assignment(assignment_problem,createdOn,createdBy,updatedOn) values (?,?,?,?);");

			// setting values to prepared statement
			ps.setBlob(1, assignment_problem);
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
	public static int saveAssignmetSolution(InputStream assignment_solution,int assignment_id, int employee_id)
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
					"update assignment set assignment_solution=?,createdOn=?,createdBy=?,updatedOn=? where assignment_id=?");

			// setting values to prepared statement
			ps.setBlob(1, assignment_solution);
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setTimestamp(4, timestamp);
			ps.setInt(5, assignment_id);
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

	// get latest id

	public static int getLastInsertedId()
	{
		int last_inserted_Id = 0;

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT max(assignment_id) from assignment;");

			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				last_inserted_Id = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return last_inserted_Id;
	}

	public static Assignments getAssignmentProblem(int assignment_id)
	{
		Assignments assignment = new Assignments();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select assignment_id,assignment_problem from assignment where assignment_id=?");
			ps.setInt(1, assignment_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				assignment.setAssignment_id(rs.getInt(1));
				assignment.setAssignment_problem(rs.getBlob(2));
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return assignment;
	}
	public static Assignments getAssignmentSolution(int assignment_id)
	{
		Assignments assignment = new Assignments();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select assignment_id,assignment_Solution from assignment where assignment_id=?");
			ps.setInt(1, assignment_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				assignment.setAssignment_id(rs.getInt(1));
				assignment.setAssignment_solution(rs.getBlob(2));
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return assignment;
	}

}
