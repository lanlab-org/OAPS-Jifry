package com.javaBeans;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

import org.apache.catalina.core.ApplicationPart;

import com.database.DB;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 *1024 * 10,
				maxFileSize = 1024 * 1024 * 1000,
				maxRequestSize = 1024 * 1024 *1000)
public class UploadServlet extends HttpServlet {
	
	PrintWriter out = null;
	Connection con = null;
	PreparedStatement ps = null;
	HttpSession session = null;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String author = request.getParameter("author");
		String subject = request.getParameter("subject");
		String title = request.getParameter("title");
		String highlights = request.getParameter("highlights");
		String abstracts = request.getParameter("abstracts");
		
		
		DB db = new DB();
		boolean checkstatus = false;
		
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
			JOptionPane.showMessageDialog(null, "The article title already exists.\nPlease use another one. ", "Info", JOptionPane.INFORMATION_MESSAGE);
			
			request.setAttribute("author", author);
			request.setAttribute("subject", subject);
			request.setAttribute("title", title);
			request.setAttribute("highlights", highlights);
			request.setAttribute("abstracts", abstracts);
			request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
		}
		
		else
		{	

// ---------------------------------------------------------------------------------------------------------------
		
		response.setContentType("text/plain;charset=UTF=8");
		
		try 
		{
			out = response.getWriter();
			session = request.getSession(false);
			
			String folderName = "resources";
			String uploadPath = request.getServletContext().getRealPath("") + folderName;
			
			File dir = new File (uploadPath);
			
			if(!dir.exists())
			{
				dir.mkdir();
			}
			
			Timestamp time = new Timestamp(System.currentTimeMillis());
			
			Part filePart = request.getPart("file");
			String fileName = filePart.getSubmittedFileName();

			String path = folderName + File.separator + fileName;
			String fileType = filePart.getContentType();// get the uploaded file type
			
			//-----------------------------------------------------
			System.out.print(fileType);
			//------------------------------------------------------
			
			
			// if the uploaded file type is PDF, then upload the file to the server
			if(fileType.equals("application/pdf")) {
				
				InputStream is = filePart.getInputStream();
				Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
				
				//-----------------------------------------------------
				System.out.print("2");
				//------------------------------------------------------
				
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					String u = "root";
					String password = "1234";
					String ul ="jdbc:mysql://localhost:3306/ooad?serverTimezone=UTC&&autoReconnect=true&&useSSL=false";
					
					con = DriverManager.getConnection(ul, u, password);
					
					String sql = "insert into article(subject, title, highlight, abstracts, author, time, filename, path) values (?,?,?,?,?,?,?,?)";
					
					ps = con.prepareStatement(sql);
					
					ps.setString(1, subject);
					ps.setString(2, title);
					ps.setString(3, highlights);
					ps.setString(4, abstracts);
					ps.setString(5, author);
					ps.setTimestamp(6, time);
					ps.setString(7, fileName);
					ps.setString(8, path);
					
					int status = ps.executeUpdate();
					
					if(status>0)
					{
						session.setAttribute("fileName", fileName);
						String msg = "" +fileName+ " upload successfully";
						request.setAttribute("msg", msg);
						request.setAttribute("subject", subject);
						request.getRequestDispatcher("NewFile.jsp").forward(request, response);

					}
							
			}
				
				catch(SQLException | ClassNotFoundException e)
				{
					System.out.println(e);
				}
				
				finally
				{
					try
					{
						if(ps != null)
						{
							ps.close();
						}
						
						if(con!=null)
						{
							con.close();
						}
					}
					
					catch(SQLException e)
					{
						out.println(e);
					}
				}
				
			}else {// if the uploaded file type is not PDF, show an alert message
				
				//-----------------------------------------------------
				System.out.print("3");
				//------------------------------------------------------
				
				
				JOptionPane.showMessageDialog(null, "Unsupported file format!.\nOnly PDF files are supported. ", "Info", JOptionPane.INFORMATION_MESSAGE);
				
				request.setAttribute("author", author);
				request.setAttribute("subject", subject);
				request.setAttribute("title", title);
				request.setAttribute("highlights", highlights);
				request.setAttribute("abstracts", abstracts);
				request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
				
			}
			
					
		}
		
		catch(IOException | ServletException e)
		{
			out.println(e);
		}
	}
	
	}  

}
