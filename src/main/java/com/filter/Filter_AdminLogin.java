package com.filter;

import com.database.DB;
import com.javaBean.Author;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebFilter(value={"/AdministratorHome.jsp","/AdministratorEdit.jsp","/AddSubject.jsp"},dispatcherTypes= {DispatcherType.REQUEST,DispatcherType.FORWARD})
public class Filter_AdminLogin implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session=((HttpServletRequest) request).getSession();
        if(session.getAttribute("admin_login")!=null)
        {
            chain.doFilter(request, response);
        }
        else
        {
            request.setAttribute("advice","If you are an administrator，login in first ");
            request.getRequestDispatcher("Administrator.jsp").forward(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
