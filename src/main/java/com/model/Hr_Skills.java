package com.model;

public class Hr_Skills
{
	private String skill_id, hr_skill_name;

	public Hr_Skills()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public Hr_Skills(String skill_id, String hr_skill_name)
	{
		super();
		this.skill_id = skill_id;
		this.hr_skill_name = hr_skill_name;
	}

	@Override
	public String toString()
	{
		return "Hr_Skills [skill_id=" + skill_id + ", hr_skill_name=" + hr_skill_name + "]";
	}

	public String getSkill_id()
	{
		return skill_id;
	}

	public void setSkill_id(String skill_id)
	{
		this.skill_id = skill_id;
	}

	public String getHr_skill_name()
	{
		return hr_skill_name;
	}

	public void setHr_skill_name(String hr_skill_name)
	{
		this.hr_skill_name = hr_skill_name;
	}

}
