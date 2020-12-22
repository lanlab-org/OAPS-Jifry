package com.javaBeans;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class com.javaBeans.DownloadServlet
 */
@WebServlet("/com.javaBeans.DownloadServlet")
public class DownloadServlet extends HttpServlet {
	
	public static int  BUFFER_SIZE = 1024*100;
	public static final String UPLOAD_DIR = "resources";
	public static String fn = null;
	
	private static final long serialVersionUID = 1L;
       

    public DownloadServlet() 
    {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	      
		PrintWriter out = response.getWriter();  
	      String filename = request.getParameter("fileName");   
	      String filepath = request.getServletContext().getRealPath("")+  UPLOAD_DIR+  File.separator;
	      response.setContentType("APPLICATION/OCTET-STREAM");   
	      response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");
	      
	      System.out.println(filename);
	      System.out.println(filepath);
	      
	      //use inline if you want to view the content in browser, helpful for pdf file
	      FileInputStream fileInputStream = new FileInputStream(filepath + filename);  
	                  
	      int i;   
	      while ((i=fileInputStream.read()) != -1) {  
	      out.write(i);   
	      }   
	      fileInputStream.close();   
	      out.close();   
	      }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

}
