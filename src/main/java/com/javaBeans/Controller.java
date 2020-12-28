package com.javaBeans;
import com.database.DB;
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
import javax.swing.*;

/**
 * Servlet implementation class com.javaBeans.Controller
 */
@WebServlet("/com.javaBeans.Controller")
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
			String ip = getRemoteIP(request);	// Use Http request header to find user's real ip if user access with proxy
			String title = request.getParameter("title");
			
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
				db.check_popular(ip, title, a);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.setAttribute("title", title);
			request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
		}
		
		if(page.equals("comments_like")||page.equals("comments_dislike"))
		{
			int a=-1;
			String title = request.getParameter("title");
			String ip = getRemoteIP(request);
			int id = Integer.parseInt(request.getParameter("id"));
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
				db.check_comments_popular(ip, id, a);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			request.setAttribute("title", title);
			request.setAttribute("id", id);
			request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
		}

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
			
			request.setAttribute("search2", search2);
			request.getRequestDispatcher("Search.jsp").forward(request, response);
		}
		
		if(page.equals("subject"))
		{
			String subject = request.getParameter("id");
			
			request.setAttribute("subject", subject);

			request.getRequestDispatcher("NewFile.jsp").forward(request, response);
		}
			
		if(page.equals("post-article"))
		{
			String code = (String) request.getSession().getAttribute("verifyCodeValue");
			String textCode = request.getParameter("verifyCode");
			if (!code.equals(textCode)) {
				request.getSession().setAttribute("info","验证码输入不正确！");
				try {
					request.getRequestDispatcher("NewFile.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
			String subject = request.getParameter("subject");
			String email = request.getParameter("email");
			
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
				request.setAttribute("subject", subject);
				request.getRequestDispatcher("NewFile.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("subject", subject);
				request.setAttribute("email", email);
				request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
			}	

		}
		

		if(page.equals("view-article"))
		{
			String title = request.getParameter("title");
			
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

				String email = request.getParameter("email");
				String comment = request.getParameter("comment");
				String title = request.getParameter("title");
				Timestamp time = new Timestamp(System.currentTimeMillis());

				String comment2 = comment.toLowerCase();
				if (comment2.contains("fuck") || comment2.contains("motherfucker") || comment2.contains("nigga") || comment2.contains("bitch")
						|| comment2.contains("idiot") || comment2.contains("stupid") || comment2.contains("dick") || comment2.contains("boobs") || comment2.contains("pussy") || comment2.contains("suck")) {
					request.setAttribute("title", title);
					request.setAttribute("msg", "using improper words, please use proper words");
					request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
				} else {


					try {
						String root = "wzf";
						String password = "wzf";
						String url = "jdbc:mysql://47.115.56.157:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";
						String driver = "com.mysql.jdbc.Driver";
						Connection con;

						Class.forName(driver);

						String sql = "insert into comments (title, user, comment, time) values (?,?,?,?)";

						con = DriverManager.getConnection(url, root, password);

						PreparedStatement ps = con.prepareStatement(sql);

						ps.setString(1, title);
						ps.setString(2, email);
						ps.setString(3, comment);
						ps.setTimestamp(4, time);

						ps.executeUpdate();

					} catch (ClassNotFoundException e1) {
						e1.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("title", title);
					request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
				}
				
		}
		
		if(page.equals("authorarticle"))
		{
			String author = request.getParameter("author");
			
			request.setAttribute("author", author);
			request.getRequestDispatcher("AuthorArticle.jsp").forward(request, response);
		}
		
	}

	public String getRemoteIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}

}
