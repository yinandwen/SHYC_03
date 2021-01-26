package com.MRYIN.controller;

import com.MRYIN.pojo.User;
import com.MRYIN.service.UserService;
import com.MRYIN.util.Pager;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService ;


    @RequestMapping("User/userInfo")
    //员工展示页面
    public String userList(Model model , HttpServletRequest request , @RequestParam(value="p" , defaultValue = "1") Integer page){
        int pageSize = 4 ;
        PageHelper.startPage(page,pageSize);
        List<User> users = userService.queryAllUser();
        PageInfo<User> userPageInfo = new PageInfo<User>(users);
        List<User> list = userPageInfo.getList();
        model.addAttribute("userList",list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, userPageInfo, requestURL);
        model.addAttribute("pageNav",pageNav);
        logger.info("查询到的所有员工");
        return "user/UserList";
    }

    @RequestMapping("User/toAddUser")
    //去到员工添加页面
    public String toAddUser(){
        return "user/UserAdd";
    }
    @RequestMapping("User/addUser")
    //员工添加页面
    public String addUser(User user){
        userService.addUser(user);
        System.out.println(user);
        logger.info("成功添加一个员工");
        return "redirect:/User/userInfo";
    }


    @RequestMapping("User/deleteUser/{username}")
    //员工删除
    public String deleteUser(@PathVariable("username") String username){
        userService.deleteUser(username);
        logger.info("成功删除一个员工");
        return "redirect:/User/userInfo";
    }


    @GetMapping("User/toUpdateUser/{username}")
    public String toUpdateUser(@PathVariable("username")String username , Model model){
        User user = userService.queryAllUserByUsername(username);
        System.out.println(user);
        model.addAttribute("user",user);
        return "user/UserUpdate";
    }

    @RequestMapping("User/updateUser")
    public String updateUser(User user , HttpSession session){
        Object user1 = session.getAttribute("user");
        System.out.println(user1);
        userService.updateUser(user);
        logger.info("成功更新一个员工");
        return "redirect:/User/userInfo";
    }
}
