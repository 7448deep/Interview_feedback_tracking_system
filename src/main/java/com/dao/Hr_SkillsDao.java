package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.Hr_Skills;

public class Hr_SkillsDao
{
	public static ArrayList<Hr_Skills> getHR_SkillList()
	{

		ArrayList<Hr_Skills> skillList = new ArrayList<Hr_Skills>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from hr_skills");

			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Hr_Skills skill = new Hr_Skills();
				skill.setSkill_id(rs.getString(1));
				skill.setHr_skill_name(rs.getString(2));

				skillList.add(skill);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return skillList;
	}

	public static ArrayList<Hr_Skills> getSkillList()
	{
		ArrayList<Hr_Skills> skillList = new ArrayList<Hr_Skills>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from hr_skills ");

			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{

				Hr_Skills skill = new Hr_Skills();
				skill.setSkill_id(rs.getString(1));
				skill.setHr_skill_name(rs.getString(2));

				skillList.add(skill);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return skillList;
	}

}
