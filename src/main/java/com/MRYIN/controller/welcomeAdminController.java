package com.MRYIN.controller;

import com.MRYIN.pojo.Questionlist;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.QuestionlistService;
import com.MRYIN.service.TaskService;
import com.MRYIN.util.Pager;
import com.MRYIN.util.Pager1;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/Num")
public class welcomeAdminController {

    private static final Logger logger = LoggerFactory.getLogger(welcomeAdminController.class);

    @Resource
    private QuestionlistService questionlistService;

    @Resource
    private TaskService taskService;

    @RequestMapping("/problemDescNum")
    public String getAllProblemDescNum(HttpSession session, Model model, HttpServletRequest request,
                                       @RequestParam(value = "p", defaultValue = "1") Integer page
            , @RequestParam(value = "page", defaultValue = "1") Integer page1) {
        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        int pageSize = 4;
        PageHelper.startPage(page, pageSize);
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        PageInfo<Questionlist> pageInfo = new PageInfo<>(questionlists);
        List<Questionlist> list = pageInfo.getList();
        model.addAttribute("QuestionList", list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        model.addAttribute("allUnfinishedQuestion",allUnfinishedQuestion);
        logger.info("查询所有的问题");


        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        int pageSize1 = 4;
        PageHelper.startPage(page1, pageSize1);
        List<Task> tasks = taskService.AllTask();
        PageInfo<Task> pageInfo1 = new PageInfo<>(tasks);
        List<Task> list1 = pageInfo1.getList();
        model.addAttribute("Task", list1);
        StringBuffer requestURL1 = request.getRequestURL();
        String pageNav1 = Pager1.getPageNav(page1, pageSize1, pageInfo1, requestURL1);
        model.addAttribute("pageNav1", pageNav1);
        session.setAttribute("page1", page1);
        model.addAttribute("allUnfinishedTask", allUnfinishedTask);
        logger.info("这是index页面中的iframe标签的值，包括problemDesc，problemSolu");
        return "Home/welcomeAdmin1";
    }
}
