package com.javaBeans;
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
import javax.swing.*;


import com.database.DB;
/**
 * Servlet implementation class com.javaBeans.UploadServlet
 */
@WebServlet("/com.javaBeans.UploadServlet")
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

        Part filePart = request.getPart("file");
        response.setContentType("text/plain;charset=UTF-8");
        String author = request.getParameter("author");
        String subject = request.getParameter("subject");
        String title = request.getParameter("title");
        String highlights = request.getParameter("highlights");
        String abstracts = request.getParameter("abstracts");
        request.setAttribute("email", author);
        request.setAttribute("subject", subject);
        request.setAttribute("title", title);
        request.setAttribute("highlights", highlights);
        request.setAttribute("abstracts", abstracts);
        DB db = new DB();
        boolean checkstatus = false;

        try {
            checkstatus = db.checktitle(title);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (checkstatus) {
            request.getSession().setAttribute("suggestion", "已经存在的article title,不能重复发布哦");
            request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
        } else {

// ---------------------------------------------------------------------------------------------------------------


            try {
                out = response.getWriter();
                session = request.getSession(false);

                String folderName = "resources";
                String uploadPath = request.getServletContext().getRealPath("") + folderName;

                File dir = new File(uploadPath);

                if (!dir.exists()) {
                    dir.mkdir();
                }

                Timestamp time = new Timestamp(System.currentTimeMillis());
                String fileType = filePart.getContentType();
                String cd = filePart.getHeader("Content-Disposition");
                String fileName = cd.substring(cd.lastIndexOf("=") + 2, cd.length() - 1);
                String path = folderName + File.separator + fileName;



                // if the uploaded file type is PDF, then upload the file to the server
                if (fileType.equals("application/pdf")) {
                    File file = new File(uploadPath+File.separator + fileName);
                    System.out.println(file.length()/(1024.0*1024));
                    if (file.length()/(1024.0*1024)>20)
                    {
                        request.setAttribute("suggestion","The size of file can not exceed 20MB");
                        request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
                    }
                    else {


                        InputStream is = filePart.getInputStream();
                        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                        try {
                            Class.forName("com.mysql.jdbc.Driver");

                            String u = "wzf";
                            String password = "wzf";
                            String ul = "jdbc:mysql://47.115.56.157:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";

                            con = DriverManager.getConnection(ul, u, password);
                            String sql0="select sid from subject where subject=?";
                            ps = con.prepareStatement(sql0);
                            ps.setString(1,subject);
                            ResultSet resultSet = ps.executeQuery();
                            int sid=0;
                            if (resultSet.next())
                            {
                                 sid = resultSet.getInt("sid");
                            }

                            String sql = "insert into article(sid, title, highlight, abstracts, author, time, filename, path,hide) values (?,?,?,?,?,?,?,?,?)";

                            ps = con.prepareStatement(sql);

                            ps.setInt(1, sid);
                            ps.setString(2, title);
                            ps.setString(3, highlights);
                            ps.setString(4, abstracts);
                            ps.setString(5, author);
                            ps.setTimestamp(6, time);
                            ps.setString(7, fileName);
                            ps.setString(8, path);
                            ps.setString(9,"No");

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
                    // if the uploaded file type is not PDF, show an alert message
                    request.setAttribute("suggestion","Unsupported file format!.\nOnly PDF files are supported.");
                    request.getRequestDispatcher("PostArticle.jsp").forward(request, response);
                }
            } catch (IOException | ServletException e) {
                out.println(e);
            }
            
        }

    }

}
