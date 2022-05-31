package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.model.Interview_Schedule;

public class Interview_ScheduleDao
{
	public static int saveSchedule(Interview_Schedule interview, int employee_id)
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
					"insert into interview_schedule(candidate_id,employee_id,date,round_no,iscomplete,round_type,tech_round_no,hr_round_no,start_time,end_time,platform,meetingLink,createdOn,createdBy,updatedOn) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			// setting values to prepared statement

			ps.setInt(1, interview.getCandidate_id());
			ps.setInt(2, interview.getEmployee_id());
			ps.setString(3, interview.getDate());
			ps.setInt(4, interview.getRound_no());
			ps.setInt(5, 0);
			ps.setInt(6, interview.getRound_type());
			ps.setInt(7, interview.getTech_round_no());
			ps.setInt(8, interview.getHr_round_no());
			ps.setString(9, interview.getStart_time());
			ps.setString(10, interview.getEnd_time());
			ps.setString(11, interview.getPlatform());
			ps.setString(12, interview.getMeetingLink());
			ps.setTimestamp(13, timestamp);
			ps.setInt(14, employee_id);
			ps.setTimestamp(15, timestamp);

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

	// update interview schedule
	public static int updateInterviewSchedule(Interview_Schedule interview, int employee_id)
	{
		Connection con = GetDBConnection.getConnection();

		int status = 0;

		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());
		try
		{
			PreparedStatement ps = con.prepareStatement(
					"update interview_schedule set employee_id=?,date=?,round_type=?,tech_round_no=?,hr_round_no=?,start_time=?,end_time=?,platform=?,meetingLink=?,updatedOn=?,updatedBy=? where interview_schedule_id=?");

			ps.setInt(1, interview.getEmployee_id());
			ps.setString(2, interview.getDate());
			ps.setInt(3, interview.getRound_type());
			ps.setInt(4, interview.getTech_round_no());
			ps.setInt(5, interview.getHr_round_no());
			ps.setString(6, interview.getStart_time());
			ps.setString(7, interview.getEnd_time());
			ps.setString(8, interview.getPlatform());
			ps.setString(9, interview.getMeetingLink());
			ps.setTimestamp(10, timestamp);
			ps.setInt(11, employee_id);
			ps.setInt(12, interview.getInterview_schedule_id());
			status = ps.executeUpdate();
		} catch (SQLException e)
		{

			e.printStackTrace();
		}

		return status;
	}

	// set iscomplete and note to completed schedules

	public static int setIscompleteAndNote(int schedule_id, String roundNote, int employee_id)
	{

		int status = 0;

		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update interview_schedule set iscomplete=1 , roundFeedback=?, updatedOn=?,updatedBy=? where interview_schedule_id=?");
			ps.setString(1, roundNote);
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setInt(4, schedule_id);

			status = ps.executeUpdate();
		} catch (Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	// set iscomplete and note to completed schedules

	public static int setCompleteAllScheduleForCandidate(int candidate_id, int employee_id)
	{
		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update interview_schedule set iscomplete=1 , updatedOn=?,updatedBy=? where candidate_id=?");
			ps.setTimestamp(1, timestamp);
			ps.setInt(2, employee_id);
			ps.setInt(3, candidate_id);

			status = ps.executeUpdate();
		} catch (Exception e)
		{
			System.out.println(e);
		}
		return status;
	}

	// get all interview schedule list
	public static ArrayList<Interview_Schedule> getInterviewScheduleList()
	{
		ArrayList<Interview_Schedule> interviewSchedulelist = new ArrayList<Interview_Schedule>();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select *  from interview_schedule ");

			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Interview_Schedule interview = new Interview_Schedule();
				interview.setInterview_schedule_id(rs.getInt(1));
				interview.setCandidate_id(rs.getInt(2));
				interview.setEmployee_id(rs.getInt(3));
				interview.setDate(rs.getString(4));
				interview.setRound_no(rs.getInt(5));
				interview.setIscomplete(rs.getInt(6));
				interview.setRoundFeedback(rs.getString(7));
				interview.setRound_type(rs.getInt(8));
				interview.setTech_round_no(rs.getInt(9));
				interview.setHr_round_no(rs.getInt(10));
				interview.setStart_time(rs.getString(11));
				interview.setEnd_time(rs.getString(12));
				interview.setPlatform(rs.getString(13));
				interview.setMeetingLink(rs.getString(14));
				interviewSchedulelist.add(interview);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return interviewSchedulelist;
	}

	// get candidate list by employee id
	public static ArrayList getCandidate_IdListByEmployeeId(int employee_id)
	{
		ArrayList candidate_id_List = new ArrayList();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select DISTINCT candidate_id from interview_schedule where employee_id=?");
			ps.setInt(1, employee_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				int tempCandidate_id = (rs.getInt(1));

				candidate_id_List.add(tempCandidate_id);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return candidate_id_List;
	}

	// get candidate list by schedule date
	public static ArrayList getCandidate_IdListByDate(String sdate, String edate)
	{
		ArrayList candidate_id_List = new ArrayList();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select DISTINCT candidate_id from interview_schedule where date BETWEEN ? AND ?");
			ps.setString(1, sdate);
			ps.setString(2, edate);
			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				int tempCandidate_id = (rs.getInt(1));

				candidate_id_List.add(tempCandidate_id);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return candidate_id_List;
	}

	// get interviewSchedule List By CandidateId
	public static ArrayList<Interview_Schedule> getinterviewScheduleListByCandidateId(int Candidate_id)
	{
		ArrayList<Interview_Schedule> interviewSchedulelist = new ArrayList<Interview_Schedule>();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select *  from interview_schedule where candidate_id=?");
			ps.setInt(1, Candidate_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				Interview_Schedule interview = new Interview_Schedule();
				interview.setInterview_schedule_id(rs.getInt(1));
				interview.setCandidate_id(rs.getInt(2));
				interview.setEmployee_id(rs.getInt(3));
				interview.setDate(rs.getString(4));
				interview.setRound_no(rs.getInt(5));
				interview.setIscomplete(rs.getInt(6));
				interview.setRoundFeedback(rs.getString(7));
				interview.setRound_type(rs.getInt(8));
				interview.setTech_round_no(rs.getInt(9));
				interview.setHr_round_no(rs.getInt(10));
				interview.setStart_time(rs.getString(11));
				interview.setEnd_time(rs.getString(12));
				interview.setPlatform(rs.getString(13));
				interview.setMeetingLink(rs.getString(14));
				interviewSchedulelist.add(interview);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return interviewSchedulelist;
	}

	// get schedule by schedule id
	public static Interview_Schedule getSchedulebySchedule_id(int schedule_id)
	{

		Interview_Schedule interview = new Interview_Schedule();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select * from interview_schedule where interview_schedule_id=?");
			ps.setInt(1, schedule_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{

				interview.setInterview_schedule_id(rs.getInt(1));
				interview.setCandidate_id(rs.getInt(2));
				interview.setEmployee_id(rs.getInt(3));
				interview.setDate(rs.getString(4));
				interview.setRound_no(rs.getInt(5));
				interview.setIscomplete(rs.getInt(6));
				interview.setRoundFeedback(rs.getString(7));
				interview.setRound_type(rs.getInt(8));
				interview.setTech_round_no(rs.getInt(9));
				interview.setHr_round_no(rs.getInt(10));
				interview.setStart_time(rs.getString(11));
				interview.setEnd_time(rs.getString(12));
				interview.setPlatform(rs.getString(13));
				interview.setMeetingLink(rs.getString(14));
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return interview;
	}

	// completed list
	public static ArrayList<Interview_Schedule> getCompletedInterviewScheduleListByCandidateId(int Candidate_id)
	{

		ArrayList<Interview_Schedule> interviewSchedulelist = new ArrayList<Interview_Schedule>();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select *  from interview_schedule where candidate_id=? and iscomplete=1");
			ps.setInt(1, Candidate_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				Interview_Schedule interview = new Interview_Schedule();
				interview.setInterview_schedule_id(rs.getInt(1));
				interview.setCandidate_id(rs.getInt(2));
				interview.setEmployee_id(rs.getInt(3));
				interview.setDate(rs.getString(4));
				interview.setRound_no(rs.getInt(5));
				interview.setIscomplete(rs.getInt(6));
				interview.setRoundFeedback(rs.getString(7));
				interview.setRound_type(rs.getInt(8));
				interview.setTech_round_no(rs.getInt(9));
				interview.setHr_round_no(rs.getInt(10));
				interview.setStart_time(rs.getString(11));
				interview.setEnd_time(rs.getString(12));
				interview.setPlatform(rs.getString(13));
				interview.setMeetingLink(rs.getString(14));
				interviewSchedulelist.add(interview);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return interviewSchedulelist;
	}

	// get completed round no
	public static int getMaxCompletedRoundnoByCandidateId(int candidate_id)
	{
		int maxCompletedRound = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select max(round_no)  from interview_schedule where candidate_id=? and iscomplete=1");
			ps.setInt(1, candidate_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				maxCompletedRound = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return maxCompletedRound;
	}

	// get max schedule no
	public static int getMaxScheduledRoundnoByCandidateId(int candidate_id)
	{
		int maxScheduledRound = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select max(round_no)  from interview_schedule where candidate_id=? ");
			ps.setInt(1, candidate_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				maxScheduledRound = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return maxScheduledRound;
	}

	// for candidate status get last/latest round info
	public static Interview_Schedule getLastestScheduleByCandidateId(int candidate_id)
	{
		Interview_Schedule interview = new Interview_Schedule();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select *  from interview_schedule where candidate_id=? order by round_no desc limit 1 ");
			ps.setInt(1, candidate_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				interview.setInterview_schedule_id(rs.getInt(1));
				interview.setCandidate_id(rs.getInt(2));
				interview.setEmployee_id(rs.getInt(3));
				interview.setDate(rs.getString(4));
				interview.setRound_no(rs.getInt(5));
				interview.setIscomplete(rs.getInt(6));
				interview.setRoundFeedback(rs.getString(7));
				interview.setRound_type(rs.getInt(8));
				interview.setTech_round_no(rs.getInt(9));
				interview.setHr_round_no(rs.getInt(10));
				interview.setStart_time(rs.getString(11));
				interview.setEnd_time(rs.getString(12));
				interview.setPlatform(rs.getString(13));
				interview.setMeetingLink(rs.getString(14));
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return interview;
	}

	public static int getScheduleCountByCandidateId(int candidate_id)
	{
		int maxScheduledRound = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select count(round_no)  from interview_schedule where candidate_id=? ");
			ps.setInt(1, candidate_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{
				maxScheduledRound = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return maxScheduledRound;
	}
}
