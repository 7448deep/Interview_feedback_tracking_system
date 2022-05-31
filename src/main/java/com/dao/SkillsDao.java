package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.model.Skills;

public class SkillsDao
{

	// save skilll to database
	public static int saveSkills(Skills skills, int employee_id)
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
					"insert into skills(skill_name,job_role_id,createdOn,createdBy,updatedOn) values(?,?,?,?,?)");

			// setting values to prepared statement

			ps.setString(1, skills.getSkill_name());
			ps.setInt(2, skills.getJob_role_id());
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

	// update skill Name
	public static int updateSkillName(int skillid, String skillName, int employee_id)
	{

		Connection con = GetDBConnection.getConnection();

		int status = 0;
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),
				d.getSeconds(), d.getSeconds());

		try
		{
			PreparedStatement ps = con
					.prepareStatement("update skills set skill_name=?, updatedOn=?, updatedBy=? where skill_id=?");
			ps.setString(1, skillName);
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, employee_id);
			ps.setInt(4, skillid);

			status = ps.executeUpdate();
		} catch (SQLException e)
		{

			e.printStackTrace();
		}

		return status;
	}

	// get list of skilll by jobrole
	public static ArrayList<Skills> getSkillList(int job_role_id)
	{
		ArrayList<Skills> skillList = new ArrayList<Skills>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from skills where job_role_id=?");
			ps.setInt(1, job_role_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Skills skill = new Skills();
				skill.setSkill_id(rs.getInt(1));
				skill.setSkill_name(rs.getString(2));
				skill.setJob_role_id(rs.getInt(3));

				skillList.add(skill);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return skillList;
	}

	// get single skill by skillid
	public static Skills getSkill(int skill_id)
	{
		Skills skill = new Skills();
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from skills where skill_id=?");
			ps.setInt(1, skill_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next())
			{

				skill.setSkill_id(rs.getInt(1));
				skill.setSkill_name(rs.getString(2));
				skill.setJob_role_id(rs.getInt(3));

			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return skill;
	}

}
