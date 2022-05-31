package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.model.Candidate;

public class CandidateDao
{

	// this method will save candidiate information getting from user form to
	// Candidate table into DBMS
	public static int saveCandidate(Candidate c, int employee_id)
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
					"insert into candidate(fname,lname,mobileno,emailid,highqualification,totalyearofexperience,previousorg,coreskills,appliedforrole,initialfeedback,candidate_status,assignment_status,createdOn,createdBy,updatedOn,isActive) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			// setting values to prepared statement
			ps.setString(1, c.getFname());
			ps.setString(2, c.getLname());
			ps.setLong(3, c.getMobileno());
			ps.setString(4, c.getEmailid());
			ps.setString(5, c.getHighqualification());
			ps.setInt(6, c.getTotalyearofexperience());
			ps.setString(7, c.getPreviousorg());
			ps.setString(8, c.getCoreskills());
			ps.setInt(9, c.getAppliedforrole());
			ps.setString(10, c.getInitialfeedback());
			ps.setInt(11, 0);
			ps.setInt(12, 0);
			ps.setTimestamp(13, timestamp);
			ps.setInt(14, employee_id);
			ps.setTimestamp(15, timestamp);
			ps.setInt(16, 1);

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

	// update candidate
	public static int updateCandidate(Candidate candidate, int employee_id)
	{
		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update candidate set fname=?,lname=?,mobileno=?,emailid=?,highqualification=?,totalyearofexperience=?,previousorg=?,coreskills=?,appliedforrole=?,initialfeedback=?,updatedOn=?,updatedBy=? where candidate_id=?");
			ps.setString(1, candidate.getFname());
			ps.setString(2, candidate.getLname());
			ps.setLong(3, candidate.getMobileno());
			ps.setString(4, candidate.getEmailid());
			ps.setString(5, candidate.getHighqualification());
			ps.setInt(6, candidate.getTotalyearofexperience());
			ps.setString(7, candidate.getPreviousorg());
			ps.setString(8, candidate.getCoreskills());
			ps.setInt(9, candidate.getAppliedforrole());
			ps.setString(10, candidate.getInitialfeedback());
			ps.setTimestamp(11, timestamp);
			ps.setInt(12, employee_id);
			ps.setInt(13, candidate.getCandidate_id());

			status = ps.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}

	public static int addAssignmetdetails(int assignment_id, int candidate_id, int employee_id)
	{
		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update candidate set assignment_status=1,assignment_id=?,updatedOn=?,updatedBy=? where candidate_id=?");
			ps.setInt(1, assignment_id);
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setInt(4, candidate_id);

			status = ps.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}

	public static int updateCandidateStatus(int candidate_status, int candidate_id, int employee_id)
	{
		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update candidate set candidate_status=?,updatedOn=?,updatedBy=? where candidate_id=?");

			ps.setInt(1, candidate_status);
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setInt(4, candidate_id);

			status = ps.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}

	public static int updateAssignmentStatus(int assignment_status, int candidate_id, int employee_id)
	{
		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update candidate set assignment_status=?,updatedOn=?,updatedBy=? where candidate_id=?");
			ps.setInt(1, assignment_status);
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setInt(4, candidate_id);

			status = ps.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}

	public static int updateToNotActive(int candidate_id, int employee_id)
	{
		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());

		try
		{
			// isActive 0=not-active 1=Active
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update candidate set isActive=0,updatedOn=?,updatedBy=? where candidate_id=?");
			ps.setTimestamp(1, timestamp);
			ps.setInt(2, employee_id);
			ps.setInt(3, candidate_id);

			status = ps.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}

	public static ArrayList<Candidate> getCandidateList()
	{
		ArrayList<Candidate> list = new ArrayList<Candidate>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select candidate_id,fname,lname,appliedforrole,candidate_status from candidate where isActive=1 ORDER BY fname");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Candidate c = new Candidate();
				c.setCandidate_id(rs.getInt(1));
				c.setFname(rs.getString(2));
				c.setLname(rs.getString(3));
				c.setAppliedforrole(rs.getInt(4));
				c.setCandidate_status(rs.getInt(5));
				list.add(c);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	public static Candidate getCandidateById(int candidate_id)
	{
		Candidate candidate = new Candidate();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from candidate where candidate_id=?");
			ps.setInt(1, candidate_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{

				candidate.setCandidate_id(rs.getInt(1));
				candidate.setFname(rs.getString(2));
				candidate.setLname(rs.getString(3));
				candidate.setMobileno(rs.getLong(4));
				candidate.setEmailid(rs.getString(5));
				candidate.setHighqualification(rs.getString(6));
				candidate.setTotalyearofexperience(rs.getInt(7));
				candidate.setPreviousorg(rs.getString(8));
				candidate.setCoreskills(rs.getString(9));
				candidate.setAppliedforrole(rs.getInt(10));
				candidate.setInitialfeedback(rs.getString(11));
				candidate.setCandidate_status(rs.getInt(12));
				candidate.setAssignment_status(rs.getInt(13));
				
				candidate.setAssignment_id(rs.getInt(14));
				
				candidate.setCreatedOn(rs.getTimestamp(15));
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return candidate;
	}

	// serch by job role
	public static ArrayList<Candidate> getCandidateListbyJobRole(int jobrole_id)
	{
		ArrayList<Candidate> list = new ArrayList<Candidate>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select * from candidate where appliedforrole=? and isActive=1 ORDER BY fname");
			ps.setInt(1, jobrole_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Candidate candidate = new Candidate();
				candidate.setCandidate_id(rs.getInt(1));
				candidate.setFname(rs.getString(2));
				candidate.setLname(rs.getString(3));
				candidate.setMobileno(rs.getLong(4));
				candidate.setEmailid(rs.getString(5));
				candidate.setHighqualification(rs.getString(6));
				candidate.setTotalyearofexperience(rs.getInt(7));
				candidate.setPreviousorg(rs.getString(8));
				candidate.setCoreskills(rs.getString(9));
				candidate.setAppliedforrole(rs.getInt(10));
				candidate.setInitialfeedback(rs.getString(11));
				candidate.setCandidate_status(rs.getInt(12));
				candidate.setAssignment_status(rs.getInt(13));
				
				candidate.setAssignment_id(rs.getInt(14));
				
				candidate.setCreatedOn(rs.getTimestamp(15));
				list.add(candidate);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	// serch by job role
	public static ArrayList<Candidate> getZeroAssignment_CandidateListbyJobRole(int jobrole_id)
	{
		ArrayList<Candidate> list = new ArrayList<Candidate>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select candidate_id,fname,lname,candidate_status,assignment_status from candidate where appliedforrole=? and assignment_status=0 and isActive=1 ORDER BY fname");
			ps.setInt(1, jobrole_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Candidate c = new Candidate();
				c.setCandidate_id(rs.getInt(1));
				c.setFname(rs.getString(2));
				c.setLname(rs.getString(3));
				c.setCandidate_status(rs.getInt(4));
				c.setAssignment_status(rs.getInt(5));
				list.add(c);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	// selected candidateList
	public static ArrayList<Candidate> getSelectedCandidateList()
	{
		ArrayList<Candidate> list = new ArrayList<Candidate>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select candidate_id,fname,lname from candidate where candidate_status=3 and isActive=1 ORDER BY fname");

			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Candidate c = new Candidate();
				c.setCandidate_id(rs.getInt(1));
				c.setFname(rs.getString(2));
				c.setLname(rs.getString(3));

				list.add(c);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	// rejected candidateList
	public static ArrayList<Candidate> getRejectedCandidateList()
	{
		ArrayList<Candidate> list = new ArrayList<Candidate>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select candidate_id,fname,lname from candidate where candidate_status=2 and isActive=1 ORDER BY fname");

			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Candidate c = new Candidate();
				c.setCandidate_id(rs.getInt(1));
				c.setFname(rs.getString(2));
				c.setLname(rs.getString(3));
				list.add(c);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	public static int getAppliedCountForJobRole(int jobrole_id)
	{
		int count = 0;

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"SELECT COUNT(appliedforrole) FROM candidate WHERE appliedforrole=? and isActive=1");
			ps.setInt(1, jobrole_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				count = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return count;
	}

	public static int getcandidate_id_byEmailid_and_Jobrole(String email_id, int jobrole_id)
	{
		int candidate_id = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select candidate_id FROM candidate WHERE emailid=? and appliedforrole=? ");
			ps.setString(1, email_id);
			ps.setInt(2, jobrole_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				candidate_id = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return candidate_id;
	}

	public static int applicationDifference(Timestamp today, Timestamp previous)
	{
		int days = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select datediff('" + today + "','" + previous + "')");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				days = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return days;
	}

}
