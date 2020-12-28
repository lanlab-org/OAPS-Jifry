package com.controller;


import com.service.DB;
import com.javaBean.Administrator;
import com.javaBean.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet(name = "AdministorController")
public class AdministorController extends HttpServlet {
    HttpSession session;
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        if (page.equals("administrator")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Administrator a = new Administrator();
            a.setEmail(email);
            a.setPassword(password);

            DB db = new DB();
            boolean status = false;

            try {
                status = db.checkAdministrator(a);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (status) {
                HttpSession session = request.getSession();
                session.setAttribute("admin_login","yes");

                request.getRequestDispatcher("AdministratorHome.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "invalid");
                request.getRequestDispatcher("Administrator.jsp").forward(request, response);
            }
        }
        if (page.equals("logout")) {
            HttpSession session = request.getSession();
            session.setAttribute("admin_login",null);
            request.getRequestDispatcher("Administrator.jsp").forward(request, response);
        }
        if (page.equals("add")) {
            String parentsid = request.getParameter("parentsid");
            request.setAttribute("parentsid",parentsid);
            request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
        }
        if (page.equals("addSubject")) {
            int parentsid=0;
            String parent = request.getParameter("parentsid");
            if (!parent.equals(""))
            {
                parentsid=Integer.parseInt(parent);

            }

            String subject = request.getParameter("subject");
            Subject sub = new Subject();
            Timestamp time = new Timestamp(System.currentTimeMillis());
            sub.setSdate(time);
            sub.setSubject(subject);
            sub.setParentsid(parentsid);
            DB db = new DB();
            try {
                db.addSubject(sub);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("AdministratorHome.jsp").forward(request,response);


        }
        if (page.equals("edit")) {
            String subject = request.getParameter("subject");


            request.setAttribute("subject", subject);

            request.getRequestDispatcher("AdministratorEdit.jsp").forward(request, response);
        }
        if(page.equals("delete"))
        {
            String i = request.getParameter("sid");

            DB db = new DB();

            try
            {
                db.deleteSubject(Integer.parseInt(i));
            }

            catch(SQLException e)
            {
                e.printStackTrace();
            }

            request.getRequestDispatcher("AdministratorHome.jsp").forward(request, response);
        }
        if (page.equals("edit-form")) {
            String oldsubject = request.getParameter("oldsubject");

            String newsubject = request.getParameter("newsubject");
            System.out.println("oldsubject"+oldsubject);
            System.out.println("newsubject"+newsubject);

            Timestamp time = new Timestamp(System.currentTimeMillis());


            DB db = new DB();
            boolean checkstatus = false;

            try {
                checkstatus = db.checksubject(newsubject);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (checkstatus) {
                //JOptionPane.showMessageDialog(null, "com.javaBean.Article Title is already exist please try anotherone ", "Info", JOptionPane.INFORMATION_MESSAGE);

                request.setAttribute("subject", oldsubject);

                request.getRequestDispatcher("AdministratorEdit.jsp").forward(request, response);
            } else {


                if (newsubject.length() > 30) {
                    //JOptionPane.showMessageDialog(null, "you have typed more than 100 letters in Highlights", "Info", JOptionPane.INFORMATION_MESSAGE);
                    request.getSession().setAttribute("info", "subject name长度不能超过30个字符");
                    request.setAttribute("subject", oldsubject);
                    request.getRequestDispatcher("AuthorEdit.jsp").forward(request, response);
                } else {
                    Subject s = new Subject();
                    s.setOldsubject(oldsubject);
                    s.setSubject(newsubject);
                    s.setSdate(time);


                    try {
                        db.updateSubject(s);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    request.getRequestDispatcher("AdministratorHome.jsp").forward(request, response);
                }
//		} else

            }

        }

    }

}
