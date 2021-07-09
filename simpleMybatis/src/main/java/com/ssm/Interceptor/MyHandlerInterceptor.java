package com.ssm.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyHandlerInterceptor implements HandlerInterceptor {

    /**
     * 在执行handler前执行
     * 返回值：true，放行,false:拦截
     */

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session=request.getSession();
        String path=request.getRequestURI();
        if(path.indexOf("login")!=-1||path.indexOf("register")!=-1){
            return true;
        }
        else if(session.getAttribute("user")!=null){
            System.out.println("用户已经登录");
            return true;
        }else {
            response.setHeader("REDIRECT", "REDIRECT");
            response.setHeader("SESSIONSTATUS", "TIMEOUT");
            response.setHeader("CONTEXTPATH", request.getContextPath()+"/login.jsp");
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            System.out.println(response.getHeader("REDIRECT")+response.getHeader("CONTEXTPATH"));
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            System.out.println("用户没登录");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
