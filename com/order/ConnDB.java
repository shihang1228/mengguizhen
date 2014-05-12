package com.order;
import java.sql.*;
import java.io.*;
import java.util.*;

public class ConnDB
{
	public Connection conn=null;
	public Statement stmt=null;
	public ResultSet rs=null;
	private static String dbDriver = "jdbc:mysql://localhost/test?" + "user=root" + "&password="+"&useUnicode=true&characterEncoding=utf-8";
	private static String dbUrl="com.mysql.jdbc.Driver";

	
	public static Connection getConnection()
	{
		Connection conn=null;
		try
		{
			Class.forName(dbUrl);
			conn=DriverManager.getConnection(dbDriver);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    	if (conn == null) 
    	{
      		System.err.println("failed!");
    	}		
		return conn;
	}
	
	public ResultSet doQuery(String sql)
	{
		try
		{
			conn=ConnDB.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	
	public int doUpdate(String sql)
	{
		int result=0;
		try
		{
			conn=ConnDB.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result=stmt.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			result=0;
		}
		return result;
	}
	
	public void closeConnection()
	{
		try
		{
			if (rs!=null)
				rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if (stmt!=null)
				stmt.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if (conn!=null)
				conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}