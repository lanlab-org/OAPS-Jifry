package com.database;

import com.javaBean.Administrator;
import com.javaBean.Article;
import com.javaBean.Author;
import com.javaBean.Subject;

import java.sql.*;

public class DB {

    public String root = "wzf";
    public String url = "jdbc:mysql://47.115.56.157:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";
    public String password = "wzf";
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
    public void showArticle(String title) throws SQLException
    {
        connect();
        String sql="update article set hide=? where title=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,"No");
        ps.setString(2,title);
        ps.executeUpdate();
        close();



    }
    public void hideArticle(String title) throws SQLException
    {
        connect();
        String sql="update article set hide=? where title=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,"Yes");
        ps.setString(2,title);
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
    public void check_popular(String ip, String title, int a) throws SQLException
    {
        connect();

//		boolean result = false;
        int i = 0;



        String sql = "insert into love_article(ip, title, prefer) values(?, ?, ?)";
        String sql2 = "select * from love_article where ip=? and title=?";
        String sql3 = "update love_article set prefer=? where ip=? and title=?";

        PreparedStatement ps2 = con.prepareStatement(sql2);
        ps2.setString(1, ip);
        ps2.setString(2, title);

        ResultSet rs = ps2.executeQuery();

        while(rs.next())
        {
            i = 1;
        }

        if(i==1)
        {
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setInt(1, a);
            ps3.setString(2, ip);
            ps3.setString(3, title);
            ps3.executeUpdate();
//			result = false;
        }

        else if(i==0)
        {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ip);
            ps.setString(2, title);
            ps.setInt(3, a);
            ps.executeUpdate();
//			result = true;
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


}
