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
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/DownloadServlet")
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
		
//		fn = request.getParameter("fileName");
		
		response.setContentType("text/html");  
	      
		PrintWriter out = response.getWriter();  
	      String filename = request.getParameter("fileName");   
	      String filepath = request.getServletContext().getRealPath("")+  UPLOAD_DIR+  File.separator;
	      response.setContentType("APPLICATION/OCTET-STREAM");   
	      response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");
	      
	      System.out.println(filename);
	      System.out.println(filepath);
	      
	      //use inline if you want to view the content in browser, helpful for pdf file
	      //response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");
	      FileInputStream fileInputStream = new FileInputStream(filepath + filename);  
	                  
	      int i;   
	      while ((i=fileInputStream.read()) != -1) {  
	      out.write(i);   
	      }   
	      fileInputStream.close();   
	      out.close();   
	      }  
		
		
/*		if(fn.equals("") || fn == null)
		{
			response.setContentType("text/html");
			response.getWriter().println("File : " +fn+" is not exist ");
		}
		
		else
		{
			String serverpath = request.getServletContext().getRealPath("");
			String downloadPath = serverpath + UPLOAD_DIR;
			String filepath = downloadPath + File.separator + fn;
			
			System.out.println(fn);
			System.out.println(filepath);
			System.out.println("filename:" +fn);
			System.out.println("filepath:" +filepath);
			
			File file = new File(filepath);
			
			OutputStream os = null;
			FileInputStream is = null;
			
			if(file.exists())
			{
				String mimetype ="APPLICATION/OCTET-STREAM";
				response.setContentType(mimetype);
				
				String headerKey = "Content-Disposition";
				String headervalue = String.format("attachment; filename=\""+fn+"\"");
				response.setHeader(headerKey, headervalue);
				
				try
				{
					os = response.getOutputStream();
					is = new FileInputStream(file);
					
					int i; 
					
				    while ((i=is.read()) != -1) 
				    {  
				      out.write(i);   
				    }   
				      
				    is.close();   
				      out.close();  
					
					byte[] buffer = new byte[BUFFER_SIZE];
					int bytesread = -1;
					
					while((bytesread = is.read(buffer)) != -1)
					{
						os.write(buffer, 0, bytesread);
					}
				}
				
				catch(IOException e)
				{
					System.out.println("exception while performe: " +e.getMessage());
				}
				
				finally
				{
					if(is != null)
					{
						is.close();
					}
					
					os.flush();
					
					if(os != null)
					{
						os.close();
					}
				}
			}
			
			else
			{
				response.setContentType("text/html");
				
				response.getWriter().println("file: "+fn+" not exist");
			}
		}
		
	}
*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

}
