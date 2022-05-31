package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.Employee;

public class EmployeeDao
{

	// this method will save employee information from registration form to Employee
	// table into DBMS
	public static int saveEmployee(Employee employee)
	{
		int status = 0;

		try
		{
			// getting the connection object
			Connection con = GetDBConnection.getConnection();

			// sql Insert Query
			PreparedStatement ps = con.prepareStatement(
					"insert into employee(employee_name,employee_username,employee_emailid,employee_password) values (?,?,?,?)");

			// setting values to prepared statement
			ps.setString(1, employee.getEmployee_name());
			ps.setString(2, employee.getEmployee_username());
			ps.setString(3, employee.getEmployee_emailid());
			ps.setString(4, employee.getEmployee_password());

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

	// Method to change the password
	public static int updatePassword(Employee employee)
	{
		Connection con = GetDBConnection.getConnection();

		int status = 0;

		try
		{
			PreparedStatement ps = con
					.prepareStatement("update employee set employee_password=? where employee_emailid=?");
			ps.setString(1, employee.getEmployee_password());
			ps.setString(2, employee.getEmployee_emailid());

			status = ps.executeUpdate();
		} catch (SQLException e)
		{

			e.printStackTrace();
		}

		return status;
	}

	// update employee
	public static int updateEmployee(Employee employee)
	{
		int status = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update employee set employee_name=?,employee_username=?,employee_emailid=? where employee_id=?");
			ps.setString(1, employee.getEmployee_name());
			ps.setString(2, employee.getEmployee_username());
			ps.setString(3, employee.getEmployee_emailid());
			ps.setInt(4, employee.getEmployee_id());

			status = ps.executeUpdate();
		} catch (Exception e)
		{

		}
		return status;
	}

	// User login method
	public static Employee loginUser(String username, String password)
	{

		Connection con = GetDBConnection.getConnection();
		Employee emp = new Employee();
		try
		{
			PreparedStatement ps = con
					.prepareStatement("select * from employee where employee_username=? and employee_password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{

				emp.setEmployee_id(rs.getInt(1));
				emp.setEmployee_name(rs.getString(2));
				emp.setEmployee_username(rs.getString(3));
				emp.setEmployee_emailid(rs.getString(4));
				emp.setEmployee_password(rs.getString(5));

			}
			con.close();

		} catch (SQLException e)
		{

			e.printStackTrace();
		}
		return emp;
	}

	// Get employee list
	public static ArrayList<Employee> getEmployeeList()
	{
		ArrayList<Employee> list = new ArrayList<Employee>();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from employee ORDER BY employee_name");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Employee emp = new Employee();
				emp.setEmployee_id(rs.getInt(1));
				emp.setEmployee_name(rs.getString(2));
				emp.setEmployee_username(rs.getString(3));
				emp.setEmployee_emailid(rs.getString(4));
				emp.setEmployee_password(rs.getString(5));

				list.add(emp);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	// get employee by id
	public static Employee getEmployeeById(int employee_id)
	{
		Employee employee = new Employee();

		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from employee where employee_id=? ");
			ps.setInt(1, employee_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{

				employee.setEmployee_id(rs.getInt(1));
				employee.setEmployee_name(rs.getString(2));
				employee.setEmployee_username(rs.getString(3));
				employee.setEmployee_emailid(rs.getString(4));
				employee.setEmployee_password(rs.getString(5));

			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return employee;
	}

	// this fun checks is user entered userName already exist
	public static int isUsernameAvailble(String username)
	{
		int status = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select count(employee_id) from employee where employee_username=? ");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				status = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return status;
	}

	// this fun checks is email_id already exist
	public static int isemailidAvailable(String email_id)
	{
		int status = 0;
		try
		{
			Connection con = GetDBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select count(employee_id) from employee where employee_emailid=? ");
			ps.setString(1, email_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				status = rs.getInt(1);
			}
			con.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return status;
	}
}
