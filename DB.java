package com.service;

import com.javaBean.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DB {

	public String wzf = "wzf";
	public String url = "jdbc:mysql://121.4.94.30:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";
	public String password = "wzf";
	public String Driver = "com.mysql.jdbc.Driver";
	public Connection con;

	public void connect() throws SQLException
	{
		try
		{
			Class.forName(Driver);

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8", wzf, password);

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

		String sql = "update article set title=?, highlight=?, abstracts=?, time=? where title=? and aid=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, a.getTitle());
		ps.setString(2, a.getHighlights());
		ps.setString(3, a.getAbstracts());
		ps.setTimestamp(4, a.getTime());
		ps.setString(5, a.getOldtitle());
		ps.setInt(6, a.getAid());
		ps.executeUpdate();

		close();
	}
	public void updateSubject(Subject s) throws SQLException
	{
		connect();

		String sql = "update subject set subject=?, sdate=? where subject=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, s.getSubject());
		ps.setTimestamp(2,s.sdate);
		ps.setString(3, s.getOldsubject());

		ps.executeUpdate();

		close();
	}
	public void showArticle(int aid) throws SQLException
	{
		connect();
		String sql="update article set hide=? where aid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,"No");
		ps.setInt(2,aid);
		ps.executeUpdate();
		close();



	}
	public void hideArticle(int aid) throws SQLException
	{
		connect();
		String sql="update article set hide=? where aid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,"Yes");
		ps.setInt(2,aid);
		ps.executeUpdate();
		close();



	}

	public void deleteArticle(int aid) throws SQLException
	{
		connect();

		String sql = "delete from article where  aid=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, aid);
		ps.executeUpdate();
		String sql2 = "delete from comments where  aid=?";

		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setInt(1, aid);
		ps2.executeUpdate();
		String sql3 = "delete from comments where  aid=?";

		PreparedStatement ps3 = con.prepareStatement(sql3);
		ps3.setInt(1, aid);
		ps3.executeUpdate();
		close();

	}

	public void deleteSubject(int sid) throws SQLException
	{
		connect();

		String sql = "delete from subject where sid=? or parentsid=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, sid);
		ps.setInt(2, sid);
		ps.executeUpdate();

		close();

	}


	public void deleteComment(String comment) throws SQLException
	{
		connect();

		String sql = "delete from comments where comment=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, comment);
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
	public void addSubject(Subject a) throws SQLException
	{
		connect();

		String sql = "insert into subject(sid,subject,sdate,parentsid) values(?,?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1,0);
		ps.setString(2, a.getSubject());
		ps.setTimestamp(3, a.getSdate());
		int parentsid=0;
		if (a.parentsid!=0)
		{
			parentsid=a.getParentsid();


		}
		ps.setInt(4,parentsid);
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
    public boolean checkAdministrator(Administrator a) throws SQLException
    {
        connect();

        boolean result = false;
        int i = 0;

        String sql = "select * from administrator where email=? and password=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, a.getEmail());
        ps.setString(2, a.getPassword());

        ResultSet rs = ps.executeQuery();

       if(rs.next())
        {

            result= true;
        }

        close();

        return result;
    }

	public boolean checkblockauthor(String email) throws SQLException
	{
		connect();

		boolean result = false;
		int i = 0;


		String sql = "select * from block_author where email=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, email);


		ResultSet rs = ps.executeQuery();

		while(rs.next())
		{
			i = 1;
			result= true;
		}

		close();

		return result;
	}
public void addVisit(String id,String ip,String title) throws SQLException
	{
		int aid=-1;
		if (id!=null&&!id.equals(""))
		{
			aid=Integer.parseInt(id);

		}

		connect();
		String sql0="select * from visit where ip=? and aid=?";
		PreparedStatement ps0 = con.prepareStatement(sql0);
		ps0.setString(1,ip);
		ps0.setInt(2,aid);
		ResultSet resultSet = ps0.executeQuery();
		if (!resultSet.next()&&aid!=-1)
		{
			Timestamp time = new Timestamp(System.currentTimeMillis());
			String sql = "insert into visit(vid,aid,ip,vdate) values (?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,0);
			ps.setInt(2,aid);
			ps.setString(3,ip);
			ps.setTimestamp(4,time);
			ps.executeUpdate();
		}
		close();


	}

	public void blockAuthor(String author) throws SQLException
	{
		connect();

		String sql = "insert into block_author(email) values(?)";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, author);
		ps.executeUpdate();

		close();

	}

	public void releaseAuthor(String author) throws SQLException
	{
		connect();

		String sql = "delete from block_author where email=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, author);
		ps.executeUpdate();

		close();

	}


	public boolean checktitle(String title) throws SQLException
	{
		connect();

		boolean result = false;
		int i = 0;

		String sql = "select * from article a , subject s where a.sid=s.sid  and title=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, title);


		ResultSet rs = ps.executeQuery();

		while(rs.next())
		{
			i = 1;
			result= true;
			break;
		}

		close();

		return result;
	}
	public boolean checksubject(String subject) throws SQLException
	{
		connect();

		boolean result = false;
//		int i = 0;

		String sql = "select * from subject where subject=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, subject);


		ResultSet rs = ps.executeQuery();

		while(rs.next())
		{
//			i = 1;
			result= true;
			break;
		}

		close();

		return result;
	}



	//	public boolean check_popular(String ip, String title, int a) throws SQLException
//	{
	public void check_popular(String ip, int aid, int a,String title) throws SQLException
	{
		connect();
		int i = 0;
		String sql = "insert into love_article(ip, aid, prefer,title) values(?, ?, ?,?)";
		String sql2 = "select * from love_article where ip=? and aid=?";
		String sql3 = "update love_article set prefer=? where ip=? and aid=?";

		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setString(1, ip);
		ps2.setInt(2, aid);

		ResultSet rs = ps2.executeQuery();

		if (rs.next())
		{
			i = 1;

		}
		if(i==1)
		{
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ps3.setInt(1, a);
			ps3.setString(2, ip);
			ps3.setInt(3, aid);
			ps3.executeUpdate();
		}

		else if(i==0)
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ip);
			ps.setInt(2, aid);
			ps.setInt(3, a);
			ps.setString(4,title);
			ps.executeUpdate();
		}


		close();

//		return result;
	}

	/*

	This function checks whether the user with the specific 'ip', has liked/disliked the comment
	with the specific 'id'.
	'a' is a flag to determine whether the required operation is like or dislike, where a = 0, if
	the required operation is dislike, and a = 1 if it's like.

	*/
//	public boolean check_comments_popular(String ip, int id, int a) throws SQLException
//	{
	public void check_comments_popular(String ip, int id, int a) throws SQLException
	{
		connect();

//		boolean result = false;
		int i = 0;



		String sql = "insert into love_comment(ip, cid, prefer) values(?, ?, ?)";
		String sql2 = "select * from love_comment where ip=? and cid=?";
		String sql3 = "update love_comment set prefer=? where ip=? and cid=?";

		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setString(1, ip);
		ps2.setInt(2, id);

		ResultSet rs = ps2.executeQuery();

		if(rs.next())
		{
			i = 1;
		}

		if(i==1)
		{
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ps3.setInt(1, a);
			ps3.setString(2, ip);
			ps3.setInt(3, id);
			ps3.executeUpdate();
//			result = false;
		}

		else if(i==0)
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ip);
			ps.setInt(2, id);
			ps.setInt(3, a);
			ps.executeUpdate();
//			result = true;
		}


		close();

//		return result;
	}
	public Map<Integer,String> selectAIDTitle() throws SQLException {
        Map<Integer,String> map=new HashMap<Integer,String>();
		connect();
		String sql="select aid,title from article where hide='No'";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet res = ps.executeQuery();
        while (res.next()){
            map.put(res.getInt("aid"),res.getString("title"));
        }
        close();
        return  map;
	}
	public Popularity getPopularity(Integer aid,String title) throws SQLException {
        Integer commentNum=0;
        Integer likesNum=0;
        Integer dislikeNum=0;
        Integer visitNum=0;
        Double dayDis=0.0;
        Timestamp time=new Timestamp(0);
        Double popularity=0.0;
        connect();
        String sql;
        PreparedStatement ps;
        ResultSet res;
        sql="select count(*) from comments where aid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,aid);
        res = ps.executeQuery();

        if (res.next()){
            commentNum=res.getInt(1);

        }
        sql="select count(*) from love_article where aid=? and prefer=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,aid);
        ps.setInt(2,1);
        res = ps.executeQuery();
        if (res.next()){
            likesNum=res.getInt(1);

        }
        sql="select count(*) from love_article where aid=? and prefer=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,aid);
        ps.setInt(2,0);
        res = ps.executeQuery();
        if (res.next()){
            dislikeNum=res.getInt(1);

        }
        sql="select count(*) from visit where aid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,aid);
        res = ps.executeQuery();
        if (res.next()){
            visitNum=res.getInt(1);

        }
        sql="select time from article where aid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,aid);
        res = ps.executeQuery();
        if (res.next()){
            time=res.getTimestamp("time");

        }
        dayDis=(System.currentTimeMillis()-time.getTime())/(1000*3600*24.0)*(-1);
        popularity=(4*commentNum+3*likesNum+2*dislikeNum+visitNum)*Math.exp(dayDis/100.0);
        Popularity pop=new Popularity();
        pop.setCommentNum(commentNum);
        pop.setDayDis(dayDis);
        pop.setIntDayDis(dayDis.intValue()*(-1));
        pop.setLikesNum(likesNum);
        pop.setDislikeNum(dislikeNum);
        pop.setVisitNum(visitNum);
        pop.setAid(aid);
        pop.setTitle(title);
        pop.setPopularity(popularity);
        pop.setIntPop(popularity.intValue());

        close();
        return pop;










    }

    private boolean deleteCommentByIp(String id) throws SQLException {
		String sql;
		PreparedStatement preparedStatement;

		sql = "delete from love_comment where cid = ?";
		preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1,id);
		preparedStatement.executeUpdate();

		sql = "delete from comments where id = ?";
		preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, id);
		preparedStatement.executeUpdate();

		return true;
	}

	private boolean deleteArticleByIp(String id) throws SQLException {
		String sql;
		PreparedStatement preparedStatement;
		ResultSet resultSet;

		sql = "select * from comments where aid = ?";
		preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1,id);

		resultSet = preparedStatement.executeQuery();

		while(resultSet.next()){
			String cid = resultSet.getString("id");
			deleteCommentByIp(cid);
		}

		sql = "delete from love_article where aid = ?";
		preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1,id);
		preparedStatement.executeUpdate();

		sql = "delete from article where aid = ?";
		PreparedStatement preparedStatement2 = con.prepareStatement(sql);
		preparedStatement2.setString(1,id);
		preparedStatement2.executeUpdate();

		return true;
	}

    public boolean deleteIp(String ip) throws SQLException {
		connect();

		String sql;
		PreparedStatement preparedStatement;
		ResultSet resultSet;

		sql = "select * from article where ip = ?";
		preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1,ip);
		resultSet = preparedStatement.executeQuery();

		while(resultSet.next()){
			String aid = resultSet.getString("aid");
			deleteArticleByIp(aid);
		}

		close();
		return true;
	}


}
