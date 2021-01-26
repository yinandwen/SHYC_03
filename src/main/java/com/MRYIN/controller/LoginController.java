package com.MRYIN.controller;

import com.MRYIN.pojo.User;
import com.MRYIN.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/Login/toLogin")
    public String toLogin() {
        return "adminOperation/login";
    }

    @RequestMapping("/Login/toError")
    public String toError() {
        return "Home/error";
    }

    @RequestMapping("/Login/toIndex")
    public String toIndex(Model model, HttpSession session) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal != null) {
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                String username = userDetails.getUsername();
                model.addAttribute("username", username);
                session.setAttribute("username", username);
                System.out.println(principal);
                logger.info("用户" + username + "登录成功");
            }
        }else{
            model.addAttribute("msg","没有找到此用户，请重新输入!");
            return "Home/message";
        }

        return "Home/index";
    }

    @RequestMapping("User/personalInfo")
    public String personalInfo(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        User user = userService.queryAllUserByUsername(username);
        model.addAttribute("user", user);
        session.setAttribute("user", user);
        System.out.println("User/personalInfo = > " + user);

        logger.info("成功查询所有用户");
        return "user/userPersonalInfo";
    }

    @RequestMapping("/Login/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model, HttpSession session) {
        User user = userService.loginByUsernameAndPassword(username, password);
        System.out.println("我是login输出的：" + user);
        model.addAttribute("user", user);
        session.setAttribute("user", user);
        if (user != null) {
            return "Home/index";
        } else {
            return "adminOperation/login";
        }
    }

    @RequestMapping("/Login/toWelcomeAdmin1")
    //登陆成功后的欢迎页面
    public String welComeAdmin() {
        logger.info("成功跳转至欢迎1界面");
        return "Home/welcomeAdmin1";
    }

    @RequestMapping("/Login/toWelcomeAdmin")
    //登陆成功后的欢迎页面
    public String welComeSale() {
        logger.info("成功跳转至欢迎1界面");
        return "Home/welcomeAdmin";
    }

    //退出登录
    @RequestMapping("/Login/loginOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        logger.info("用户已经退出登录");
        return "adminOperation/login";
    }
}
