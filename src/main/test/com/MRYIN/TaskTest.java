package com.MRYIN;

import com.MRYIN.pojo.Task;
import com.MRYIN.service.TaskPoolService;
import com.MRYIN.util.FormatDate;
import com.mysql.jdbc.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author: Mr.Yin
 * @create: 2021-01-21 16:04
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TaskTest {

    @Resource
    private TaskPoolService taskPoolService;


    @Test
    public void addTaskTest() {
        Date date1 = null;
        Date date2 = null;
        Date date3 = null;
        Date date4 = null;
        try {
            date1 = FormatDate.StringForDate("2020-1-15");
            date2 = FormatDate.StringForDate("2020-1-30");
            date3 = FormatDate.StringForDate("2020-1-16");
        } catch (Exception e) {
            e.printStackTrace();
        }
        Task task = new Task();
        task.setTK_PRJCode("YC0002");
        task.setTK_PRJName("订单名称");
        task.setTK_TaskType("PMT");
        task.setTK_CODE("12S232");
        task.setTK_NAME("客户冻结数据输入");
        task.setTK_START_DATE(date1);
        task.setTK_END_DATE(date2);
        task.setTK_RESPONER("MRYIN");
        task.setTK_ACTUAL_STARTDAY(date3);
        task.setTK_ACTUAL_ENDDAY(date4);
        task.setTK_PROGRESS("0");
        task.setTK_DETAILS("备注信息");
        int i = taskPoolService.addTask(task);
        System.out.println(i);
    }

    @Test
    public void queryAllTask() {
        List<Task> tasks = taskPoolService.queryAllTask();
        System.out.println(tasks.size());
        tasks.forEach(task -> {
            System.out.println(task);
        });
    }

    @Test
    public void queryAllTaskByLimit() {
        List<Task> tasks = taskPoolService.queryAllTaskByLimit(1, 10);
        tasks.forEach(task -> {
            System.out.println(task);
        });
    }

    @Test
    public void updateTaskTest() {
        Task task = taskPoolService.queryTaskByTK_ID(2);
        System.out.println(task);
        Date date1 = null;
        Date date2 = null;
        Date date3 = null;
        Date date4 = null;
        try {
            date1 = FormatDate.StringForDate("2020-1-15");
            date2 = FormatDate.StringForDate("2020-1-30");
            date3 = FormatDate.StringForDate("2020-1-16");
        } catch (Exception e) {
            e.printStackTrace();
        }
        task.setTK_START_DATE(date1);
        task.setTK_END_DATE(date2);
        task.setTK_ACTUAL_STARTDAY(date3);
        task.setTK_ACTUAL_ENDDAY(date4);
        int i = taskPoolService.updateTask(task);
        System.out.println(i);
    }

    @Test
    public void queryTaskByTK_IDTest() {
        Task task = taskPoolService.queryTaskByTK_ID(2);
        System.out.println(task);
    }

    @Test
    public void queryTaskByEchartTest() {
        int task = taskPoolService.queryTaskByEchart("PCT");
        System.out.println(task);
    }
    @Test
    public void queryTaskByEchartBySTATUSTest() {
        int task = taskPoolService.queryTaskByEchartBySTATUS("PCT");
        System.out.println(task);
    }

    @Test
    public void queryBuSearch(){
        List<Task> tasks = taskPoolService.queryBySearch("PCT","");
        tasks.forEach(task->{
            System.out.println(task);
        });
    }

    @Test
    public void Test(){
    }

}