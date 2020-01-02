package com.javaBeans;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.database.DB;
import com.javaBean.Article;
import com.javaBean.Author;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String page = request.getParameter("page");
		
		if(page == null)
		{
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
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
		
		if(page.equals("admin"))
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Author a = new Author();
			a.setEmail(email);
			a.setPassword(password);
			
			DB db = new DB();
			boolean status = false;
			
			try
			{
				status = db.checkAuthor(a);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			if(status)
			{
				session = request.getSession();
				session.setAttribute("email", email);
				request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("msg", "invalid");
				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			}
		}
		
		if(page.equals("register"))
		{
			request.getRequestDispatcher("AdminRegister.jsp").forward(request, response);
		}
		
		if(page.equals("register-form"))
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String conpassword = request.getParameter("conpassword");
			
			if(password.equals(conpassword))
			{
				Author a = new Author();
				a.setEmail(email);
				a.setPassword(password);
				
				DB db = new DB();
				
				try
				{
					db.addAuthor(a);
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			}
			
			else
			{
				request.getRequestDispatcher("AdminRegister.jsp").forward(request, response);
			}
		}
		
		if(page.equals("home"))
		{
			String email = request.getParameter("email");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		}
		
		if(page.equals("logout"))
		{
			request.getRequestDispatcher("Admin.jsp").forward(request, response);
		}
		
		if(page.equals("edit"))
		{
			String title = request.getParameter("title");
			String email = request.getParameter("email");
			
			request.setAttribute("title", title);
			request.setAttribute("email", email);
			request.getRequestDispatcher("AdminEdit.jsp").forward(request, response);
		}
		
		if(page.equals("edit-form"))
		{
			String oldtitle = request.getParameter("old-title");
			
			String title = request.getParameter("title");
			String highlights = request.getParameter("highlights");
			String abstracts = request.getParameter("abstracts");
			Timestamp time = new Timestamp(System.currentTimeMillis());
			

			DB db = new DB();
/*			boolean checkstatus = false;
			
			try
			{
				checkstatus = db.checktitle(title);	
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			if(checkstatus)
			{
				JOptionPane.showMessageDialog(null, "Article Title is already exist please try anotherone ", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("title", title);
				request.setAttribute("highlights", highlights);
				request.setAttribute("abstracts", abstracts);
				request.getRequestDispatcher("AdminEdit.jsp").forward(request, response);
			}
			
			else
			{				
*/			
			
			if(title.length() > 100)
			{
				JOptionPane.showMessageDialog(null, "you have typed more than 100 letters in Highlights", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("title", oldtitle);
				request.getRequestDispatcher("AdminEdit.jsp").forward(request, response);
			}
			
			else if(highlights.length() > 250)
			{
				JOptionPane.showMessageDialog(null, "you have typed more than 250 letters in Highlights", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("title", oldtitle);
				request.getRequestDispatcher("AdminEdit.jsp").forward(request, response);
			}
			
			else if(abstracts.length() > 999)
			{
				JOptionPane.showMessageDialog(null, "you have typed more than 1000 letters in abstract", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("title", oldtitle);
				request.getRequestDispatcher("AdminEdit.jsp").forward(request, response);
			}
			
			else
			{
				
				Article a = new Article();
				a.setTitle(title);
				a.setHighlights(highlights);
				a.setAbstracts(abstracts);
				a.setTime(time);
				a.setOldtitle(oldtitle);
				
//				DB db = new DB();
				
				try
				{
					db.updateArticle(a);
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
			}
//		} else
			
		}
		
		if(page.equals("delete"))
		{
			String title = request.getParameter("title");
			
			DB db = new DB();
			
			try
			{
				db.deleteArticle(title);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		}
		

//----------------------------------------------------------------------------------------------
// master function		
		
		if(page.equals("master-home"))
		{
			request.getRequestDispatcher("Master.jsp").forward(request, response);
		}
		
		if(page.equals("master-articles"))
		{
			request.getRequestDispatcher("MasterArticles.jsp").forward(request, response);
		}
		
		if(page.equals("master-comments"))
		{
			request.getRequestDispatcher("Comments.jsp").forward(request, response);
		}
		
		if(page.equals("master-authors"))
		{
			request.getRequestDispatcher("MasterAuthors.jsp").forward(request, response);
		}
		
		if(page.equals("master-delete"))
		{
			String title = request.getParameter("title");
			
			DB db = new DB();
			
			try
			{
				db.deleteArticle(title);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("MasterArticles.jsp").forward(request, response);
		}
		
		if(page.equals("master-view-article"))
		{
			String title = request.getParameter("title");
			
			request.setAttribute("title", title);
			request.getRequestDispatcher("MasterViewArticle.jsp").forward(request, response);
		}
		
		if(page.equals("master-delete-comments"))
		{
			String comment = request.getParameter("comment");
			
			DB db = new DB();
			
			try
			{
				db.deleteComment(comment);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("Comments.jsp").forward(request, response);
		}
		
		if(page.equals("master-block-author"))
		{
			String author = request.getParameter("author");
			
			DB db = new DB();
			
			try
			{
				db.blockAuthor(author);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("blocklist.jsp").forward(request, response);
		}
		
		if(page.equals("master-release-author"))
		{
			String author = request.getParameter("author");
			
			DB db = new DB();
			
			try
			{
				db.releaseAuthor(author);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("MasterAuthors.jsp").forward(request, response);
		}
		
	}

}
