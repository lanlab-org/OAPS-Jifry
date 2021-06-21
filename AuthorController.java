package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.DB;
import com.javaBean.Administrator;
import com.javaBean.Article;
import com.javaBean.Author;

/**
 * Servlet implementation class com.controller.AuthorController
 */
@WebServlet("/com.controller.AuthorController")
public class AuthorController extends HttpServlet {
	HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorController() {
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
			request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
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
		HttpSession session=request.getSession();
		
		if(page.equals("admin"))
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			session.setAttribute("email",email);
			Administrator a = new Administrator();
			a.setEmail(email);
			a.setPassword(password);
			
			DB db = new DB();
			boolean status = false;
			
			try
			{
				status = db.checkAdministrator(a);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			if(status)
			{


//				request.setAttribute("email",email);
				request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("msg", "invalid");
				request.getRequestDispatcher("Author.jsp").forward(request, response);
			}
		}
		
		if(page.equals("register"))
		{
			request.getRequestDispatcher("AuthorRegister.jsp").forward(request, response);
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
					session.setAttribute("email",email);
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("Author.jsp").forward(request, response);
			}
			
			else
			{
				request.getRequestDispatcher("AuthorRegister.jsp").forward(request, response);
			}
		}
		
		if(page.equals("home"))
		{
			String email = request.getParameter("email");
			request.setAttribute("email",email);
			request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
		}
		
		if(page.equals("logout"))
		{
			session.setAttribute("email",null);
			request.getRequestDispatcher("Author.jsp").forward(request, response);
		}
		
		if(page.equals("edit"))
		{
			String title = request.getParameter("title");
			String aid = request.getParameter("aid");

			
			request.setAttribute("title", title);
			request.setAttribute("aid", aid);
			request.getRequestDispatcher("AuthorEdit.jsp").forward(request, response);
		}
		if (page.equals("hide"))
		{
            String id = request.getParameter("aid");
            int aid=Integer.parseInt(id);
			DB db = new DB();
			try {
				db.hideArticle(aid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
		}
		if (page.equals("show"))
		{
			String id = request.getParameter("aid");
			int aid=Integer.parseInt(id);
			DB db = new DB();
			try {
				db.showArticle(aid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
		}
		
		if(page.equals("edit-form"))
		{
			String oldtitle = request.getParameter("old-title");
			String title = request.getParameter("title");
			String id = request.getParameter("aid");
			int aid=Integer.parseInt(id);
			String highlights = request.getParameter("highlights");
			String abstracts = request.getParameter("abstracts");
			Timestamp time = new Timestamp(System.currentTimeMillis());
			

			DB db = new DB();


			if(highlights.length() > 250)
			{
				//JOptionPane.showMessageDialog(null, "you have typed more than 250 letters in Highlights", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getSession().setAttribute("info","highlight长度不能超过250个字符");
				request.setAttribute("title", oldtitle);
				request.getRequestDispatcher("AuthorEdit.jsp").forward(request, response);
			}
			
			else if(abstracts.length() > 999)
			{
				//JOptionPane.showMessageDialog(null, "you have typed more than 1000 letters in abstract", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getSession().setAttribute("info","abstract长度不能超过999个字符");
				request.setAttribute("title", oldtitle);
				request.getRequestDispatcher("AuthorEdit.jsp").forward(request, response);
			}
			
			else
			{
				
				Article a = new Article();
				a.setTitle(title);
				a.setHighlights(highlights);
				a.setAbstracts(abstracts);
				a.setTime(time);
				a.setOldtitle(oldtitle);
				a.setAid(aid);
				

				
				try
				{
					db.updateArticle(a);
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
			}
//		} else
			
		}
		
		if(page.equals("delete"))
		{

			String id = request.getParameter("aid");
			int aid=Integer.parseInt(id);

			DB db = new DB();
			
			try
			{
				db.deleteArticle(aid);
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("AuthorHome.jsp").forward(request, response);
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
			String id = request.getParameter("aid");
			int aid=-1;
			aid=Integer.parseInt(id);
			
			DB db = new DB();
			
			try
			{
				db.deleteArticle(aid);
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

		if(page.equals("master-dropIp")){
			String ip = request.getParameter("Ip");
			System.out.println("管理员决定把ip为 " + ip + "的用户的痕迹进行消除");
			try {
				new DB().deleteIp(ip);
			} catch (SQLException throwables) {
				throwables.printStackTrace();
			}
			request.getRequestDispatcher("Master.jsp").forward(request, response);
		}
	}

}
