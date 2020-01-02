package com.javaBeans;

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
import javax.swing.JOptionPane;

import com.database.DB;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
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
			request.getRequestDispatcher("NewFile1.jsp").forward(request, response);
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
		
		
		if(page.equals("like"))
		{
			String ip = request.getRemoteAddr();
			String title = request.getParameter("title");
			
			int a = 1;
			
			DB db = new DB();
			boolean status = false;
			
			try
			{
				status = db.check_popular(ip, title, a);	
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			if(status)
			{
				request.setAttribute("title", title);
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
			}
			
			else
			{	
				JOptionPane.showMessageDialog(null, "You have already like", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("title", title);
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
			}
		}
		
		if(page.equals("dislike"))
		{
			String ip = request.getRemoteAddr();
			String title = request.getParameter("title");
			
			int a = 0;
			
			DB db = new DB();
			boolean status = false;
			
			try
			{
				status = db.check_popular(ip, title, a);	
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			if(status)
			{
				request.setAttribute("title", title);
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
			}
			
			else
			{
				JOptionPane.showMessageDialog(null, "You have already like", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("title", title);
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
			}		
		}		

		
		if(page.equals("home"))
		{
			request.getRequestDispatcher("NewFile1.jsp").forward(request, response);
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
			request.getRequestDispatcher("Admin.jsp").forward(request, response);
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
				JOptionPane.showMessageDialog(null, "Sorry you have been blcoked, please contact Admin", "Info", JOptionPane.INFORMATION_MESSAGE);
				
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
			request.getRequestDispatcher("AdminViewArticle.jsp").forward(request, response);
		}

		if(page.equals("comment-post"))
		{
			String email = request.getParameter("email");
			String comment = request.getParameter("comment");
			String title = request.getParameter("title");
			Timestamp time = new Timestamp(System.currentTimeMillis());
			
			String comment2 = comment.toLowerCase();
			if(comment2.contains("fuck") || comment2.contains("motherfucker") || comment2.contains("nigga") || comment2.contains("bitch")
					 || comment2.contains("idiot") || comment2.contains("stupid") || comment2.contains("dick") || comment2.contains("boobs") || comment2.contains("pussy") || comment2.contains("suck"))
			{
//				System.out.println("illegal");
				request.setAttribute("title", title);
				request.setAttribute("msg", "using improper words, please use proper words");
				request.getRequestDispatcher("ViewArticle.jsp").forward(request, response);
			}
			
			else
			{
				
			
			try 
			{
				String root ="root";
				String password = "Fathihachellam.1";
				String url = "jdbc:mysql://localhost:3306/ooad?autoReconnect=true&&useSSL=false";
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
				
			} 
			
			catch (ClassNotFoundException e1) 
			{
				e1.printStackTrace();
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
//			System.out.println(email);
//			System.out.println(comment);
//			System.out.println(title);
//			System.out.println(time);
			
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

}
