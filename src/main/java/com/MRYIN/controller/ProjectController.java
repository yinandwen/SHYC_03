package com.MRYIN.controller;

import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Project;
import com.MRYIN.pojo.ProjectOrders;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.OrdersService;
import com.MRYIN.service.ProjectService;
import com.MRYIN.util.DataGridView;
import com.MRYIN.util.ResultObj;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProjectController {
    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    @Resource
    private OrdersService ordersService ;

    @Resource
    private ProjectService projectService;

    /*
       查询所有项目
    */
    @RequestMapping("/Project/toQueryProject")
    public String toQueryOrders() {
        return "Project/ProjectList";
    }

    @RequestMapping("/Project/QueryProject")
    @ResponseBody
    public DataGridView queryProject(@RequestParam("page") Integer page, @RequestParam("limit") Integer pageSize) {
        System.out.println(page);
        System.out.println(pageSize);

        /*
               查询页面上面的所有项目的任务个数，如果任务个数和已完成的任务个数相等并且为0，项目就是未启动
               如果相等就是已终验，如果不相等，并且完成个数《 任务总个数就是进行中
         */
        List<ProjectOrders> projectOrders = projectService.queryByOrdersISNULL();
        List<ProjectOrders> projectOrders1 = projectService.queryAllProjectByLimit(page, pageSize);
        for (ProjectOrders orders : projectOrders1) {
            String prj_code = orders.getPRJ_CODE();
            //通过项目号获取该项目的所有任务个数
            int totalCount = projectService.queryAllTaskForProject(prj_code);
            //通过项目号获取该任务的所有完成的任务个数
            int totalFinish = projectService.queryAllTaskForProjectByFinish(prj_code);
            //进行判断
            if(totalCount == 0){
                orders.setPRJ_SITUATION("待启动");
                orders.setPRJ_FINISH_RATE(0);
                projectService.updateProject(orders);
            }else if (totalFinish < totalCount){
                orders.setPRJ_SITUATION("进行中");
                orders.setPRJ_FINISH_RATE((double)totalFinish/totalCount * 100);
                projectService.updateProject(orders);
            }else if(totalCount == totalFinish){
                orders.setPRJ_SITUATION("已终验");
                orders.setPRJ_FINISH_RATE(100);
                projectService.updateProject(orders);
            }
        }
        logger.info("我是/Project/QueryProject");
        logger.info("查询到的所有项目");
        return new DataGridView(0, "尹家浩提示您,查询成功", (long) projectOrders.size(), projectOrders1);
    }


    /*
        添加一个项目
     */
    @RequestMapping("/Project/addProject")
    @ResponseBody
    public ResultObj addProject(ProjectOrders projectOrders) {
        Integer po_id = projectOrders.getPO_ID();
        Orders orders = ordersService.queryOrderByPO_ID(po_id);
        String prj_code = projectOrders.getPRJ_CODE();
        orders.setPO_PRJCODE(prj_code);
        ordersService.updateOrder(orders);
        try {
            projectService.addProject(projectOrders);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }


    /*
        头部下拉框的模糊查询
     */
    @RequestMapping("/Project/queryBySearch/{search}")
    @ResponseBody
    public Map<String,Object> queryBySearch(@PathVariable String search) {
        Map<String,Object> map = new HashMap<>();
        /*
            search：表单的四个输入框
            1.开始时间、        2.结束时间、          3.项目类型、         4.项目号、项目经理、客户名称、销售人员、订单编号
            split.length-4      split.length-3      split.length-2      split.length-1
         */
        System.out.println(search); //start=&end=&SearchInput=YC-0001
        StringUtils.split(search,"&,=");
        String[] split = search.split("&");

        String FormData_PRJ_SITUATION = split[split.length - 2];
        String FormData_PRJALL = split[split.length-1];
        System.out.println(FormData_PRJ_SITUATION);//SearchInput=YC-0001
        System.out.println(FormData_PRJALL);//SearchInput=YC-0001

        //获取第三个输入框的键值对
        String[] FormData_PRJ_SITUATION_Split = FormData_PRJ_SITUATION.split("=");
        String PRJ_SITUATION = FormData_PRJ_SITUATION_Split[FormData_PRJ_SITUATION_Split.length - 1];
        //获取第四个输入框的键值对
        String[] FormData_PRJALL_split  = FormData_PRJALL.split("=");
        String PRJALL = FormData_PRJALL_split[FormData_PRJALL_split.length - 1];

        if(FormData_PRJ_SITUATION_Split.length == 1 && FormData_PRJALL_split.length == 1 ){
            PRJ_SITUATION = "";
            PRJALL = "";
            queryBySearchCommon(PRJ_SITUATION,PRJALL,map);
        }else if(FormData_PRJ_SITUATION_Split.length == 1){
            PRJ_SITUATION = "";
            queryBySearchCommon(PRJ_SITUATION,PRJALL,map);
        }else if (FormData_PRJALL_split.length == 1 ){
            PRJALL = "";
            queryBySearchCommon(PRJ_SITUATION,PRJALL,map);
        }else{
            queryBySearchCommon(PRJ_SITUATION,PRJALL,map);
        }
        return map ;
    }


    /*
        更新一个项目
     */
    @RequestMapping("/Project/updateProject")
    @ResponseBody
    public ResultObj updateProject(ProjectOrders projectOrders){
        try{
            projectService.updateProject(projectOrders);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    /*
        删除一个项目
     */
    @RequestMapping("/Project/deleteProject")
    @ResponseBody
    public ResultObj deleteProject(Integer PRJ_ID){
        System.out.println(PRJ_ID);
        try{
            projectService.deleteProject(PRJ_ID);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }



    /*
        把下拉输入框的方法抽象出来
     */
    private void queryBySearchCommon(String PRJ_SITUATION , String PRJALL , Map<String,Object> map){
        List<ProjectOrders> projectOrders = projectService.treeSearchBySelectOther(PRJ_SITUATION, PRJALL);
        if(projectOrders.size() == 0){
            map.put("code",-1);
            map.put("msg","尹家浩提醒你：没有找到" + PRJ_SITUATION + "的任务");
        }else{
            map.put("code", 0);
            map.put("msg", "尹家浩提醒你：查询成功");
            map.put("count", projectOrders.size());
            map.put("data", projectOrders);
        }
    }
}