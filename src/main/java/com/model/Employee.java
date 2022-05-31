package com.model;

public class Employee
{
	private int employee_id;
	private String employee_name;
	private String employee_username;
	private String employee_emailid;
	private String employee_password;

	public Employee()
	{
		super();
	}

	public Employee(int employee_id, String employee_name, String employee_username, String employee_emailid,
			String employee_password)
	{
		super();
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_username = employee_username;
		this.employee_emailid = employee_emailid;
		this.employee_password = employee_password;
	}

	@Override
	public String toString()
	{
		return "Employee [employee_id=" + employee_id + ", employee_name=" + employee_name + ", employee_username="
				+ employee_username + ", employee_emailid=" + employee_emailid + ", employee_password="
				+ employee_password + "]";
	}

	public int getEmployee_id()
	{
		return employee_id;
	}

	public void setEmployee_id(int employee_id)
	{
		this.employee_id = employee_id;
	}

	public String getEmployee_name()
	{
		return employee_name;
	}

	public void setEmployee_name(String employee_name)
	{
		this.employee_name = employee_name;
	}

	public String getEmployee_username()
	{
		return employee_username;
	}

	public void setEmployee_username(String employee_username)
	{
		this.employee_username = employee_username;
	}

	public String getEmployee_emailid()
	{
		return employee_emailid;
	}

	public void setEmployee_emailid(String employee_emailid)
	{
		this.employee_emailid = employee_emailid;
	}

	public String getEmployee_password()
	{
		return employee_password;
	}

	public void setEmployee_password(String employee_password)
	{
		this.employee_password = employee_password;
	}

}
