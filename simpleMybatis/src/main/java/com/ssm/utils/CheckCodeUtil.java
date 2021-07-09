package com.ssm.utils;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckCodeUtil")
public class CheckCodeUtil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //定义图形验证码的长和宽
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100,4,4);
        String code =lineCaptcha.getCode();
        System.out.println("产生的验证码："+code);
        //将产生的验证码，存放到session域中
        /*
        1.page域：作用于当前页面，但是可以指定存放的域
        2.request:作用于当次请求
        3.session:作用于当次会话，默认有效时间是30分钟，浏览器没有关闭就可以使用
        4.application：作用域整个项目，最大的域，慎用
         */

        HttpSession httpSession=request.getSession();
        httpSession.setAttribute("code",code);


        //将验证码输出到浏览器
        lineCaptcha.write(response.getOutputStream());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}
