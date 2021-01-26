package com.MRYIN.controller;

import com.MRYIN.pojo.User;
import com.MRYIN.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LayuiTable {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService ;


    @RequestMapping("/User/toLayuiTable")
    public String toLayuiTale(){
        System.out.println("我是User/toLayuiTable");
        return "user/userListLayui";
    }

    @RequestMapping("/User/LayuiTable")
    @ResponseBody
    //员工展示页面
    public Map<String , Object> userList(){
        List<User> page = userService.getLayuiTable();
        Map<String , Object> result = new HashMap<String , Object>();
        System.out.println("我是User/LayuiTable");
        if(page.size() > 0 ){
            result.put("code","0");
            result.put("msg","查询成功");
            result.put("data",page);
        }
        logger.info("查询到的所有员工");
        return result;
    }
}
