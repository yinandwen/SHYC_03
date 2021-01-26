package com.MRYIN.controller;

import com.MRYIN.pojo.Questionlist;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.QuestionlistService;
import com.MRYIN.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ChartController {

    @Resource
    private TaskService taskService ;

    @Resource
    private QuestionlistService questionlistService;


    @RequestMapping("/Chart/toChartList1")
    public String toChartList1(){
        return "Chart/TaskAndQuestionChartPie";
    }

    @RequestMapping("/Chart/toChartList2")
    public String toChartList2(){
        return "Chart/TaskAndQuestionChartBar";
    }

    @RequestMapping("/Chart/toChartList3")
    public String toChartList3(){
        return "Chart/TaskAndQuestionChartLine";
    }

    @RequestMapping("/Chart/toChartList4")
    public String toChartList4(){
        return "Chart/TaskAndQuestionChartDoubleLine";
    }

    @RequestMapping("/Chart/toChartList5")
    public String toChartList5(){
        return "Chart/TaskAndQuestionChartPieData";
    }

    @RequestMapping("/Chart/toChartList6")
    public String toChartList6(){
        return "Chart/TaskAndQuestionChartMoreBar";
    }

    /*
        问题和任务的饼状图
     */

    @RequestMapping("/Chart/pie")
    @ResponseBody
    public List<Map<String,Object>> chartList1() {

        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        List<Task> tasks = taskService.AllTask();
        int size = tasks.size();
        int allfinishedTask = size - allUnfinishedTask;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成任务");
        map1.put("value", allfinishedTask);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成任务");
        map2.put("value", allUnfinishedTask);
        ls.add(map2);
        return ls;
    }

    @RequestMapping("/Chart/PieQuestion")
    @ResponseBody
    public List<Map<String,Object>> chartList11() {

        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        int size1 = questionlists.size();
        int allfinishQuestion = size1 - allUnfinishedQuestion;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成问题");
        map1.put("value", allfinishQuestion);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成问题");
        map2.put("value", allUnfinishedQuestion);
        ls.add(map2);
        return ls;
    }

    @RequestMapping("/Chart/PieQuestion1")
    @ResponseBody
    public List<Map<String,Object>> chartList111() {

        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        int size1 = questionlists.size();
        int allfinishQuestion = size1 - allUnfinishedQuestion;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成问题");
        map1.put("value", allfinishQuestion);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成问题");
        map2.put("value", allUnfinishedQuestion);
        ls.add(map2);
        return ls;
    }



    /*
        问题和任务的柱状图
     */

    @RequestMapping("/Chart/bar")
    @ResponseBody
    public List<Map<String,Object>> chartList2() {

        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        List<Task> tasks = taskService.AllTask();
        int size = tasks.size();
        int allfinishedTask = size - allUnfinishedTask;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成任务");
        map1.put("value", allfinishedTask);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成任务");
        map2.put("value", allUnfinishedTask);
        ls.add(map2);
        return ls;
    }

    @RequestMapping("/Chart/barQuestion")
    @ResponseBody
    public List<Map<String,Object>> chartList21() {

        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        int size1 = questionlists.size();
        int allfinishQuestion = size1 - allUnfinishedQuestion;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成问题");
        map1.put("value", allfinishQuestion);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成问题");
        map2.put("value", allUnfinishedQuestion);
        ls.add(map2);
        return ls;
    }

    /*
        问题和任务的折线图
     */

    @RequestMapping("/Chart/Line")
    @ResponseBody
    public List<Map<String,Object>> chartList3() {

        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        List<Task> tasks = taskService.AllTask();
        int size = tasks.size();
        int allfinishedTask = size - allUnfinishedTask;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成任务");
        map1.put("value", allfinishedTask);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成任务");
        map2.put("value", allUnfinishedTask);
        ls.add(map2);
        return ls;
    }
    @RequestMapping("/Chart/LineQuestion")
    @ResponseBody
    public List<Map<String,Object>> chartList31() {

        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        int size1 = questionlists.size();
        int allfinishQuestion = size1 - allUnfinishedQuestion;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成问题");
        map1.put("value", allfinishQuestion);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成问题");
        map2.put("value", allUnfinishedQuestion);
        ls.add(map2);
        return ls;
    }

    /*
        问题和任务的双折线图
     */

    @RequestMapping("/Chart/DoubleLine")
    @ResponseBody
    public List<Map<String,Object>> chartList4() {

        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        List<Task> tasks = taskService.AllTask();
        int size = tasks.size();
        int allfinishedTask = size - allUnfinishedTask;


        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        int size1 = questionlists.size();
        int allfinishQuestion = size1 - allUnfinishedQuestion;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象
        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成");
        map1.put("value", allfinishedTask);
        map1.put("number", allfinishQuestion);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成");
        map2.put("value", allUnfinishedTask);
        map2.put("number", allUnfinishedQuestion);
        ls.add(map2);

        return ls;
    }


    /*
       显示数据的饼状图
    */
    @RequestMapping("/Chart/PieTask")
    @ResponseBody
    public List<Map<String,Object>> chartList12() {

        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        List<Task> tasks = taskService.AllTask();
        int size = tasks.size();
        int allfinishedTask = size - allUnfinishedTask;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成任务");
        map1.put("value", allfinishedTask);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成任务");
        map2.put("value", allUnfinishedTask);
        ls.add(map2);

        HashMap<String, Object> map3 = new HashMap<>();
        map3.put("name", "尹家浩");
        map3.put("value", 6);
        ls.add(map3);

        HashMap<String, Object> map4 = new HashMap<>();
        map4.put("name", "MRYIN");
        map4.put("value", 4);
        ls.add(map4);

        HashMap<String, Object> map5 = new HashMap<>();
        map5.put("name", "MRWEN");
        map5.put("value", 10);
        ls.add(map5);

        HashMap<String, Object> map6 = new HashMap<>();
        map6.put("name", "MRHAO");
        map6.put("value", 15);
        ls.add(map6);

        ls.forEach(list->{
            System.out.println(list);
        });
        return ls;
    }


    /*
        两个或多个柱状图
     */
    @RequestMapping("/Chart/DoubleBar")
    @ResponseBody
    public List<Map<String,Object>> chartList6() {

        int allUnfinishedTask = taskService.getAllUnfinishedTask();
        List<Task> tasks = taskService.AllTask();
        int size = tasks.size();
        int allfinishedTask = size - allUnfinishedTask;


        int allUnfinishedQuestion = questionlistService.getAllUnfinishedQuestion();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        int size1 = questionlists.size();
        int allfinishQuestion = size1 - allUnfinishedQuestion;

        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象
        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "已完成");
        map1.put("value", allfinishedTask);
        map1.put("number", allfinishQuestion);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "未完成");
        map2.put("value", allUnfinishedTask);
        map2.put("number", allUnfinishedQuestion);
        ls.add(map2);

        return ls;
    }
}
