package com.model;

//this class have all the variable required regarding Jobrole also these are the column names for JobRole table
public class JobRole
{

	private int job_role_id;
	private String job_title;

	public JobRole()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public JobRole(int job_role_id, String job_title)
	{
		super();
		this.job_role_id = job_role_id;
		this.job_title = job_title;
	}

	public int getJob_role_id()
	{
		return job_role_id;
	}

	public void setJob_role_id(int job_role_id)
	{
		this.job_role_id = job_role_id;
	}

	public String getJob_title()
	{
		return job_title;
	}

	public void setJob_title(String job_title)
	{
		this.job_title = job_title;
	}

	@Override
	public String toString()
	{
		return "JobRole [job_role_id=" + job_role_id + ", job_title=" + job_title + "]";
	}

}
