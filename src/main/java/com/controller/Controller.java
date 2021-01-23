package com.controller;
import com.service.DB;
import com.service.Get_real_ip;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class com.controller.Controller
 */
@WebServlet("/com.controller.Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String page = request.getParameter("page");
		
		if(page == null || page.equals("home"))
		{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		else
		{
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String page = request.getParameter("page");
		
		
		if(page.equals("like")||page.equals("dislike"))
		{
			String ip = Get_real_ip.getRemortIP(request);
			String title = request.getParameter("title");
			String id = request.getParameter("aid");
            int aid=-1;
            aid=Integer.parseInt(id);
			int a = -1;
			if(page.equals("like"))
			{
				a=1;
			}
			else if(page.equals("dislike"))
			{
				a=0;
			}
			DB db = new DB();
			boolean status = false;
			
			try
			{
//				status = db.check_popular(ip, title, a);
				db.check_popular(ip, aid, a,title);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
//			if(status)
//			{
				request.setAttribute("title", title);
				request.setAttribute("aid", id);
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
//			}
//
//			else
//			{
//				JOptionPane.showMessageDialog(null, "You have already liked the article.", "Info", JOptionPane.INFORMATION_MESSAGE);
//
//				request.setAttribute("title", title);
//				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
//			}
		}
		
//		if(page.equals("dislike"))
//		{
//			String ip = Get_real_ip.getRemortIP(request);
//			String title = request.getParameter("title");
//
//			int a = 0;
//
//			DB db = new DB();
//			boolean status = false;
//
//			try
//			{
////				status = db.check_popular(ip, title, a);
//				db.check_popular(ip, title, a);
//			}
//
//			catch(SQLException e)
//			{
//				e.printStackTrace();
//			}
//
////			if(status)
////			{
//				request.setAttribute("title", title);
//				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
////			}
////
////			else
////			{
////				JOptionPane.showMessageDialog(null,
//// 				"You have already disliked the article", "Info", JOptionPane.INFORMATION_MESSAGE);
////
////				request.setAttribute("title", title);
////				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
////			}
//		}
//
		
		if(page.equals("comments_like")||page.equals("comments_dislike"))
		{
			int a=-1;
			String title = request.getParameter("title");
			String ip = Get_real_ip.getRemortIP(request);
			int cid = Integer.parseInt(request.getParameter("cid"));
			String id= request.getParameter("aid");
            int aid=Integer.parseInt(id);
			if(page.equals("comments_like"))
			{
				a = 1;
			}
			else if(page.equals("comments_dislike"))
			{
				a=0;
			}

			
			DB db = new DB();
			boolean status = false;
			
			try
			{
//				status = db.check_comments_popular(ip, id, a);
				db.check_comments_popular(ip, cid, a);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}

//			if(status)
//			{
				request.setAttribute("title", title);
				request.setAttribute("aid", aid);
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
//			}
//
//			else
//			{
//				JOptionPane.showMessageDialog(null, "You have already liked the comment.", "Info", JOptionPane.INFORMATION_MESSAGE);

//				request.setAttribute("title", title);
//				request.setAttribute("id", id);
//				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
//			}
		}

//		if(page.equals("comments_dislike"))
//		{
//			String title = request.getParameter("title");
//			String ip = Get_real_ip.getRemortIP(request);
//			int id = Integer.parseInt(request.getParameter("id"));
//
//			int a = 0;
//
//			DB db = new DB();
//			boolean status = false;
//
//			try
//			{
////				status = db.check_comments_popular(ip, id, a);
//				db.check_comments_popular(ip, id, a);
//			}
//
//			catch(SQLException e)
//			{
//				e.printStackTrace();
//			}
//
////			if(status)
////			{
//				request.setAttribute("title", title);
//				request.setAttribute("id", id);
//				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
////			}
////
////			else
////			{
////				JOptionPane.showMessageDialog(null, "You have already disliked the comment", "Info", JOptionPane.INFORMATION_MESSAGE);
////
////				request.setAttribute("title", title);
////				request.setAttribute("id", id);
////				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
////			}
//
//		}

        if(page.equals("administrator"))
        {
        	if (request.getSession().getAttribute("admin_login")!=null)
			{
				request.getRequestDispatcher("AdministratorHome.jsp").forward(request, response);

			}
			else {
				request.getRequestDispatcher("Administrator.jsp").forward(request, response);
			}
        }
		if(page.equals("home"))
		{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		if(page.equals("aboutus"))
		{
			request.getRequestDispatcher("Aboutus.jsp").forward(request, response);
		}
		
		if(page.equals("contact"))
		{
			request.getRequestDispatcher("Contact.jsp").forward(request, response);
		}
		
		if(page.equals("admin"))
		{

				if (request.getSession().getAttribute("admin_login")!=null)
				{
					request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);

				}
                else
				{
					request.getRequestDispatcher("Author.jsp").forward(request, response);
				}

		}
		
		if(page.equals("select"))
		{
			String option = request.getParameter("option");
			
			if(option.equals("Articles"))
			{
				request.getRequestDispatcher("Articles.jsp").forward(request, response);
        }
			
			if(option.equals("Comments"))
			{
				request.getRequestDispatcher("Comments.jsp").forward(request, response);				
			}			
		}
		
		if(page.equals("search"))
		{
			String search2 = request.getParameter("search2");
			search2=search2.trim();
			if (search2.equals(""))
            {
                request.getRequestDispatcher("Articles.jsp").forward(request, response);
            }
            else{
                request.setAttribute("search2", search2);

			request.getRequestDispatcher("Search.jsp").forward(request, response);
		    }
		}
		
		if(page.equals("subject"))
		{
			String subject = request.getParameter("id");
			String psid = request.getParameter("psid");


			request.setAttribute("subject", subject);
			request.setAttribute("psid", psid);

			request.getRequestDispatcher("NewFile.jsp").forward(request, response);
//			response.sendRedirect("NewFile.jsp");
		}
			
		if(page.equals("post-article"))
		{
			String subject = request.getParameter("subject");
			String psid = request.getParameter("psid");
			String email = request.getParameter("email");
			String authorName = request.getParameter("authorName");


			boolean status = false;
			DB db = new DB();
			
			try
			{
				status = db.checkblockauthor(email);	
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			if(status)
			{
				//JOptionPane.showMessageDialog(null, "Sorry you have been blcoked, please contact Author", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("subject", subject);
				request.setAttribute("psid", psid);
				request.getRequestDispatcher("NewFile.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("subject", subject);
				request.setAttribute("email", email);
				request.setAttribute("psid", psid);
				request.setAttribute("authorName", authorName);
				request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
			}	

		}

		if(page.equals("view-article"))
		{
			String title = request.getParameter("title");
			String aid = request.getParameter("id");
			String ip = Get_real_ip.getRemortIP(request);
			DB db = new DB();
			try {
				db.addVisit(aid,ip,title);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("aid",aid);
			request.setAttribute("title", title);
			request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
		}
		
		if(page.equals("admin-view-article"))
		{
			String title = request.getParameter("title");
			
			request.setAttribute("title", title);
			request.getRequestDispatcher("AuthorViewArticle.jsp").forward(request, response);
		}

		if(page.equals("comment-post"))
		{
				int aid=-1;
				String id = request.getParameter("aid");
				if (id!=null&&!id.equals(""))
				{
					aid=Integer.parseInt(id);
				}
                System.out.println("插入评论表的aid="+aid);
				String comment = request.getParameter("comment");
				String title = request.getParameter("title");
				Timestamp time = new Timestamp(System.currentTimeMillis());

				String comment2 = comment.toLowerCase();
				if(comment.length()>10000)
				{
					request.setAttribute("title", title);
					request.setAttribute("msg","The length of comment can not exceed 10000 characters!");
				}
				else if (comment2.contains("fuck") || comment2.contains("motherfucker") || comment2.contains("nigga") || comment2.contains("bitch")
						|| comment2.contains("idiot") || comment2.contains("stupid") || comment2.contains("dick") || comment2.contains("boobs") || comment2.contains("pussy") || comment2.contains("suck")) {
//				System.out.println("illegal");

					request.setAttribute("title", title);
					request.setAttribute("msg", "using improper words, please use proper words");

				} else {


					try {
						String wzf = "wzf";
						String password = "wzf";
						String url = "jdbc:mysql://121.4.94.30:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";
						String driver = "com.mysql.jdbc.Driver";
						Connection con;

						Class.forName(driver);

						String sql = "insert into comments (title, aid, comment, time) values (?,?,?,?)";

						con = DriverManager.getConnection(url, wzf, password);

						PreparedStatement ps = con.prepareStatement(sql);

						ps.setString(1, title);
						ps.setInt(2, aid);
						ps.setString(3, comment);
						ps.setTimestamp(4, time);

						ps.executeUpdate();

					} catch (ClassNotFoundException e1) {
						e1.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}

//			System.out.println(email);
//			System.out.println(comment);
//			System.out.println(title);
//			System.out.println(time);

					request.setAttribute("title", title);
					request.setAttribute("aid", aid);


				}
			request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);

		}
		
		if(page.equals("authorarticle"))
		{
			String author = request.getParameter("author");
			
			request.setAttribute("author", author);
			request.getRequestDispatcher("AuthorArticle.jsp").forward(request, response);
		}
		
	}

}
