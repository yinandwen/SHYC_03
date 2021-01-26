package com.MRYIN.controller;

import com.MRYIN.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class PRJTask{

    @Resource
    private TaskService taskService;


    @RequestMapping("/PRJTask/PRJTaskList")
    public String PRJTaskList(){
        return null;
    }



    @RequestMapping("/PRJTask/toAddPRJTask")
    public String toAddPRJTask(){
        return "TaskAllocation/addTaskAllocation";
    }


}
