package com.controller;


import com.javaBean.Popularity;
import com.service.DB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class PopController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        Map<Integer,String> map=new HashMap<Integer,String>();
        List<Popularity> popList=new ArrayList<Popularity>();

        try {
             map = db.selectAIDTitle();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Iterator<Map.Entry<Integer, String>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<Integer, String> entry = it.next();
            Popularity pop= null;
            try {
                pop = db.getPopularity(entry.getKey(),entry.getValue());

            } catch (SQLException e) {
                e.printStackTrace();
            }
            popList.add(pop);

        }
        Collections.sort(popList);
        if (request.getParameter("goToIndex")!=null)
        {
            List<Popularity> mostTwoPop=new ArrayList<Popularity>();
            mostTwoPop.add(popList.get(0));
            mostTwoPop.add(popList.get(1));
            request.setAttribute("mostTwoPop",mostTwoPop);
            request.getRequestDispatcher("index.jsp?mostTwoPop=yes").forward(request,response);



        }
        else {
            request.setAttribute("popList",popList);
            request.getRequestDispatcher("popularity.jsp").forward(request,response);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
