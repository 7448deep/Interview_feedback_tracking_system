package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetDBConnection
{
	// this method will return object of connection by checking dbms required
	// parameters(url ,username ,pass)
	public static Connection getConnection()
	{
		Connection con = null;

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String url = "jdbc:mysql://iftsystem.cotm4eg5tilf.us-east-1.rds.amazonaws.com:3306/iftsproject";
		String url = "jdbc:mysql://localhost:3306/iftsproject";
		String username = "root";
		String pass = "root";
		try
		{
			con = DriverManager.getConnection(url, username, pass);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
