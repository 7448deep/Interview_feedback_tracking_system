package com.model;

public class Skills
{
	private int skill_id;
	private String skill_name;
	private int job_role_id;

	public Skills()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public Skills(int skill_id, String skill_name, int job_role_id)
	{
		super();
		this.skill_id = skill_id;
		this.skill_name = skill_name;
		this.job_role_id = job_role_id;
	}

	@Override
	public String toString()
	{
		return "Skills [skill_id=" + skill_id + ", skill_name=" + skill_name + ", job_role_id=" + job_role_id + "]";
	}

	public int getSkill_id()
	{
		return skill_id;
	}

	public void setSkill_id(int skill_id)
	{
		this.skill_id = skill_id;
	}

	public String getSkill_name()
	{
		return skill_name;
	}

	public void setSkill_name(String skill_name)
	{
		this.skill_name = skill_name;
	}

	public int getJob_role_id()
	{
		return job_role_id;
	}

	public void setJob_role_id(int job_role_id)
	{
		this.job_role_id = job_role_id;
	}

}