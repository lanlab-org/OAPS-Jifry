package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dsna.util.images.ValidateCode;

public class ValidateController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置为图像模式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        //180高，40宽，5个数字，50干扰线
        ValidateCode verifyCode = new ValidateCode(100,30,4,50);
        verifyCode.write(response.getOutputStream());

        System.out.println("验证码为："+verifyCode.getCode());
        //将验证码保存在session中
        request.getSession().setAttribute("verifyCodeValue", verifyCode.getCode());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
