/*
package com.MRYIN.controller;

import com.MRYIN.pojo.ProjectOrders;
import com.MRYIN.service.ProjectService;
import com.MRYIN.util.DataGridView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

public class ProjectOrdersController {
    private static final Logger logger = LoggerFactory.getLogger(ProjectOrdersController.class);

    @Resource
    private ProjectService projectService ;

    */
/*
       查询所有项目
    *//*

    @RequestMapping("/Project/toQueryProject")
    public String toQueryOrders() {
        return "Project/ProjectList";
    }

    @RequestMapping("/Project/QueryProject")
    @ResponseBody
    public DataGridView queryOrders(@RequestParam("page") Integer page, @RequestParam("limit") Integer pageSize) {
        System.out.println(page);
        System.out.println(pageSize);
        List<ProjectOrders> projectOrders = projectService.queryByOrdersISNULL();
        List<ProjectOrders> projectOrders1 = projectService.queryAllProjectByLimit(page, pageSize);
        logger.info("我是/Project/QueryProject");
        logger.info("查询到的所有没有立项的订单");
        return new DataGridView(0, "尹家浩提示您,查询成功", (long) projectOrders.size(), projectOrders1);
    }
}*/
