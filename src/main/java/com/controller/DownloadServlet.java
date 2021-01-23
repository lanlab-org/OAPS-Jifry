package com.controller;

import java.io.*;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class com.controller.DownloadServlet
 */

public class DownloadServlet extends HttpServlet {




    public DownloadServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");
        String filename = request.getParameter("fileName");
        String path = request.getParameter("path");
        String filepath = request.getServletContext().getRealPath("") +path;
        File dir = new File(filepath);
        if (!dir.exists()) {
            String[] split = path.split("/");
            request.setAttribute("psid",split[1]);
            request.setAttribute("subject",split[2]);
            request.setAttribute("msg","Sorry,the file you want to download does not exist on this server!");
            request.getRequestDispatcher("NewFile.jsp").forward(request, response);
        }
        else{

            //设置响应头，告诉浏览器以下载的方式打来文件，设置中文编码，如果不设置会出现乱码
            response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
            //获取文件流
            System.out.println("filepath:"+filepath);
            InputStream is = new FileInputStream(filepath);
            int len = 0;
            byte[] b = new byte[1024];
            OutputStream os = response.getOutputStream();
            while ((len = is.read(b)) != -1) {
                //将缓冲区数据输出到浏览器
                os.write(b, 0, len);
            }
            is.close();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
