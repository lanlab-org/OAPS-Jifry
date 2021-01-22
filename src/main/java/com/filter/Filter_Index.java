package com.filter;

import com.javaBean.Popularity;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;

@WebFilter(value = {"/index.jsp"}, dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class Filter_Index implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String mostTwoPop = request.getParameter("mostTwoPop");
        if (mostTwoPop != null) {
            chain.doFilter(request, response);
        } else {
            request.getRequestDispatcher("PopController?goToIndex=yes").forward(request, response);
        }


    }

    @Override
    public void destroy() {

    }
}
