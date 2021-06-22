package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.service.DB;
import com.service.Get_real_ip;

/**
 * Servlet implementation class com.controller.UploadServlet
 */
@WebServlet("/com.controller.UploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
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


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path="";
        Part filePart = request.getPart("file");
        response.setContentType("text/plain;charset=UTF-8");
        String author = request.getParameter("author");
        String subject = request.getParameter("subject");
        String psid = request.getParameter("psid");
        request.setAttribute("psid",psid);
        String title = request.getParameter("title");
        String highlights = request.getParameter("highlights");
        String abstracts = request.getParameter("abstracts");
        String authorName = request.getParameter("authorName");
        String ip = Get_real_ip.getRemortIP(request);
        request.setAttribute("email", author);
        request.setAttribute("subject", subject);
        request.setAttribute("title", title);
        request.setAttribute("highlights", highlights);
        request.setAttribute("abstracts", abstracts);
        request.setAttribute("authorName", authorName);
        String code = (String) request.getSession().getAttribute("verifyCodeValue");
        String textCode = request.getParameter("verifyCode");
        if (!code.equals(textCode)) {
            request.setAttribute("suggestion", "Verification code input error");
            try {
                request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            DB db = new DB();
            boolean checkstatus = false;

            try {
                checkstatus = db.checktitle(title);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (checkstatus) {
                request.setAttribute("suggestion", "文章标题已存在！");

                request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
            } else {

// ---------------------------------------------------------------------------------------------------------------


                try {
                    out = response.getWriter();
                    session = request.getSession(false);

                    String folderName = "resources";
                    String uploadPath = request.getServletContext().getRealPath("") + folderName+File.separator+ psid + File.separator + subject.trim()+ File.separator+title.trim();

                    File dir = new File(uploadPath);
                    System.out.println("file:"+uploadPath );
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    Timestamp time = new Timestamp(System.currentTimeMillis());


                    String fileType = filePart.getContentType();

                    String cd = filePart.getHeader("Content-Disposition");
                    String fileName = cd.substring(cd.lastIndexOf("=") + 2, cd.length() - 1);
                    path = folderName + "/" + psid + "/" + subject.trim() + "/" +title.trim()+"/"+ fileName;



                    if (fileType.equals("application/pdf")) {

                        System.out.println(uploadPath + File.separator + fileName);
                        File file = new File(uploadPath + File.separator + fileName);
                        System.out.println("文件大小：" + file.length() / (1024.0 * 1024));
                        if (file.length() / (1024.0 * 1024) > 20) {
                            request.setAttribute("suggestion", "文件大小不能超过20MB");
                            request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
                        } else {


                            InputStream is = filePart.getInputStream();
                            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                String u = "root";
                                String password = "root";
                                String ul = "jdbc:mysql://127.0.0.1:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";

                                con = DriverManager.getConnection(ul, u, password);
                                String sql0 = "select sid from subject where subject=?";
                                ps = con.prepareStatement(sql0);
                                ps.setString(1, subject);
                                ResultSet resultSet = ps.executeQuery();
                                int sid = 0;
                                if (resultSet.next()) {
                                    sid = resultSet.getInt("sid");
                                }

                                String sql = "insert into article(sid, title, highlight, abstracts, author, time, filename, path,hide,authorName,ip) values (?,?,?,?,?,?,?,?,?,?,?)";

                                ps = con.prepareStatement(sql);

                                ps.setInt(1, sid);
                                ps.setString(2, title);
                                ps.setString(3, highlights);
                                ps.setString(4, abstracts);
                                ps.setString(5, author);
                                ps.setTimestamp(6, time);
                                ps.setString(7, fileName);
                                ps.setString(8, path);
                                ps.setString(9, "No");
                                ps.setString(10, authorName);
                                ps.setString(11, ip);

                                int status = ps.executeUpdate();


                                if (status > 0) {
                                    session.setAttribute("fileName", fileName);
                                    String msg = "" + fileName + " upload successfully";
                                    request.setAttribute("msg", msg);


                                    request.setAttribute("subject", subject);
                                    request.getRequestDispatcher("NewFile.jsp").forward(request, response);

                                }

                            } catch (SQLException | ClassNotFoundException e) {
                                System.out.println(e);
                            } finally {
                                try {
                                    if (ps != null) {
                                        ps.close();
                                    }

                                    if (con != null) {
                                        con.close();
                                    }
                                } catch (SQLException e) {
                                    out.println(e);
                                }
                            }
                        }

                    } else {

                        request.setAttribute("suggestion", "只能上传pdf文件哦！");
                        request.getRequestDispatcher("PostArticle.jsp").forward(request, response);

                    }


                } catch (IOException | ServletException e) {
                    out.println(e);
                }
            }

        }
    }

}
