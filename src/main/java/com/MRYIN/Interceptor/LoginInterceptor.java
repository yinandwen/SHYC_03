package com.MRYIN.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        //判断什么情况没有登录
        //在登陆页面的时候也放行
        if(request.getRequestURI().contains("toLogin")){
            System.out.println("拦截请求1");
            return true ;
        }

        if (session.getAttribute("username")!=null){
            System.out.println("拦截请求2");
            return true;
        }

        //判断什么时候不放行
        request.getRequestDispatcher("/WEB-INF/jsp/adminOperation/login.jsp").forward(request,response);
        return false;

    }


    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

}
