package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaBean.Article;
import com.javaBean.Author;

public class DB {
	
	public String root = "root";
	public String url = "jdbc:mysql://localhost:3306/ooad?autoReconnect=true&&useSSL=false";
	public String password = "Fathihachellam.1";
	public String Driver = "com.mysql.jdbc.Driver";
	public Connection con;
	
	public void connect() throws SQLException
	{
		try
		{
			Class.forName(Driver);
			
			con = DriverManager.getConnection(url, root, password);
			
		}
		
		catch(ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		
	}
	
	public void close()  throws SQLException
	{
		con.close();
	}
	
	public void updateArticle(Article a) throws SQLException
	{
		connect();
		
		String sql = "update article set title=?, highlight=?, abstracts=?, time=? where title=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, a.getTitle());
		ps.setString(2, a.getHighlights());
		ps.setString(3, a.getAbstracts());
		ps.setTimestamp(4, a.getTime());
		ps.setString(5, a.getOldtitle());
		ps.executeUpdate();
		
		close();
	}
	
	public void deleteArticle(String title) throws SQLException
	{
		connect();
		
		String sql = "delete from article where title=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, title);
		ps.executeUpdate();
		
		close();
		
	}
	
	public void addAuthor(Author a) throws SQLException
	{
		connect();
		
		String sql = "insert into author(email,password) values(?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, a.getEmail());
		ps.setString(2, a.getPassword());
		ps.executeUpdate();
		
		close();
		
	}
	
	public boolean checkAuthor(Author a) throws SQLException
	{
		connect();
		
		boolean result = false;
		int i = 0;
		
		String sql = "select * from author where email=? and password=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, a.getEmail());
		ps.setString(2, a.getPassword());
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			i = 1;
			result= true;
		}
		
		close();
		
		return result;
	}
	
	public boolean check_popular(String ip, String title, int a) throws SQLException
	{
		connect();
		
		boolean result = false;
		int i = 0;
		
		String sql = "insert into user_ip(ip, title, prefer) values(?, ?, ?)";
		String sql2 = "select * from user_ip where ip=? and title=?";
		
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setString(1, ip);
		ps2.setString(2, title);
		
		ResultSet rs = ps2.executeQuery();
		
		while(rs.next())
		{
			i = 1;
			result = false;
		}
		
		if(i==0)
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ip);
			ps.setString(2, title);
			ps.setInt(3, a);
			ps.executeUpdate();
			result = true;
		}
	
		
		close();
		
		return result;
	}

}
