package com.MRYIN.controller;

import com.MRYIN.pojo.Task;
import com.MRYIN.service.TaskPoolService;
import com.MRYIN.util.DataGridView;
import com.MRYIN.util.ResultObj;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author: Mr.Yin
 * @create: 2021-01-21 13:27
 **/
@Controller
public class TaskPoolController {

    @Resource
    private TaskPoolService taskPoolService;

    /*
        去到任务列表页面
     */
    @RequestMapping("/TaskPool/toQueryTask")
    public String toQueryTask() {
        return "TaskPool/TaskPoolList";
    }

    /*
        查询所有任务
     */
    @RequestMapping("/TaskPool/QueryTask")
    @ResponseBody
    public DataGridView queryTask(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        System.out.println(page);
        System.out.println(limit);
        List<Task> tasks = taskPoolService.queryAllTask();
        List<Task> tasks1 = taskPoolService.queryAllTaskByLimit(page, limit);
        return new DataGridView(0, "成功查询所有任务", (long) tasks.size(), tasks1);
    }


    /*
        添加任务
     */
    @RequestMapping("/TaskPool/addTask")
    @ResponseBody
    public ResultObj addTask(String PRJ_CODE, String PO_NAME, Task task) {
        System.out.println(PRJ_CODE);
        System.out.println(PO_NAME);
        System.out.println(task);
        System.out.println(task.getTK_TaskType());
        try {
            taskPoolService.addTask(task);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }

    /*
        更新任务
     */
    @RequestMapping("/TaskPool/updateTask")
    @ResponseBody
    public ResultObj updateTask(Task task) {
        System.out.println(task);
        try {
            taskPoolService.updateTask(task);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.UPDATE_ERROR;
        }
    }

    /*
        删除任务
     */
    @RequestMapping("/TaskPool/deleteTask")
    @ResponseBody
    public ResultObj deleteTask(Integer TK_ID) {
        System.out.println(TK_ID);
        try {
            taskPoolService.deleteTaskByTK_ID(TK_ID);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /*
        头部下拉框的模糊查询
     */
    @RequestMapping("/TaskPool/queryBySearch/{search}")
    @ResponseBody
    public Map<String, Object> queryBySearch(@PathVariable String search) {
        Map<String, Object> map = new HashMap<>();
        /*
            search：表单的四个输入框
            1.开始时间、        2.结束时间、          3.任务类型、         4.任务号、项目号、项目名称
            split.length-4      split.length-3      split.length-2      split.length-1
         */
        System.out.println(search); //start=&end=&SearchInput=YC-0001
        StringUtils.split(search,"&,=");
        String[] split = search.split("&");

        String FormData_TK_TaskType = split[split.length - 2];
        String FormData_TKAll = split[split.length-1];
        System.out.println(FormData_TK_TaskType);//SearchInput=YC-0001
        System.out.println(FormData_TKAll);//SearchInput=YC-0001

        //获取第三个输入框的键值对
        String[] Format_TK_TaskType_Split = FormData_TK_TaskType.split("=");
        String TK_TaskType = Format_TK_TaskType_Split[Format_TK_TaskType_Split.length - 1];
        //获取第四个输入框的键值对
        String[] FormData_TKAll_split  = FormData_TKAll.split("=");
        String TK_ALL = FormData_TKAll_split[FormData_TKAll_split.length - 1];
        //获取值
        if(Format_TK_TaskType_Split.length == 1 && FormData_TKAll_split.length == 1 ){
            TK_TaskType ="";
            TK_ALL = "";
            queryBySearchCommon(TK_TaskType,TK_ALL,map);
        }else if (Format_TK_TaskType_Split.length == 1){
           TK_TaskType = "";
            queryBySearchCommon(TK_TaskType,TK_ALL,map);
        }else if (FormData_TKAll_split.length == 1){
            TK_ALL = "";
            queryBySearchCommon(TK_TaskType,TK_ALL,map);
        }else{
            queryBySearchCommon(TK_TaskType,TK_ALL,map);
        }
         /*
            执行头部搜索
          */

        return map;
    }

    /*
        图表的展示
        1.PCT、PMT、AST、TBD
        2.
     */
    @RequestMapping("/TaskPool/Chart/Bar")
    @ResponseBody
    public List<Map<String,Object>> chartBar(){
        String[] TK_TaskType = new String[]{"PCT","PMT","AST","TBD"};
        List<Map<String , Object>> ls = new ArrayList<>();

        for (int i = 0; i < TK_TaskType.length; i++) {
            HashMap<String,Object> map = new HashMap<>();
            //查询所有该分类的任务
            int i1 = taskPoolService.queryTaskByEchart(TK_TaskType[i]);
            //查询所有该分类任务并且状态为0（未完成）的任务
            int i2 = taskPoolService.queryTaskByEchartBySTATUS(TK_TaskType[i]);
            switch (TK_TaskType[i]){
                case "PCT":
                    map.put("name","制程任务");
                    map.put("finish",i1-i2);
                    map.put("unfinish",i2);
                    map.put("value",i1);
                    ls.add(map);
                    break;
                case "PMT":
                    map.put("name","款项任务");
                    map.put("finish",i1-i2);
                    map.put("unfinish",i2);
                    map.put("value",i1);
                    ls.add(map);
                    break;
                case "AST":
                    map.put("name","售后任务");
                    map.put("finish",i1-i2);
                    map.put("unfinish",i2);
                    map.put("value",i1);
                    ls.add(map);
                    break;
                case "TBD":
                    map.put("name","其他任务");
                    map.put("finish",i1-i2);
                    map.put("unfinish",i2);
                    map.put("value",i1);
                    ls.add(map);
                    break;
            }
        }
        return ls;
    }


    /*
        抽出来的search方法
     */
    public void queryBySearchCommon(String TK_TaskType , String TK_ALL , Map<String , Object> map){
        List<Task> tasks = taskPoolService.queryBySearch(TK_TaskType,TK_ALL);
        if(tasks.size() == 0){
            map.put("code",-1);
            map.put("msg","尹家浩提醒你：没有找到" + TK_TaskType + "类型的任务");
        }else{
            map.put("code", 0);
            map.put("msg", "尹家浩提醒你：查询成功");
            map.put("count", tasks.size());
            map.put("data", tasks);
        }
    }


    /*
        任务状态的变更
     */
    @RequestMapping("/TaskPool/updateTaskStatus")
    @ResponseBody
    public DataGridView updateTaskStatus(Integer TK_ID){
        System.out.println(TK_ID);
        Task task = taskPoolService.queryTaskByTK_ID(TK_ID);
        System.out.println(task);
        Integer tk_status = task.getTK_STATUS();
        if(tk_status == 0){
            //未完成，通过点击之后，转为已完成
            tk_status = 1 ;
            task.setTK_STATUS(tk_status);
            taskPoolService.updateTask(task);
            return new DataGridView(0,"更新成功，如果有疑问请联系尹家浩~~");
        }else{
            return new DataGridView(-1,"该任务已完成，请勿重复点击，如果有疑问请联系尹家浩~~");
        }
    }
}