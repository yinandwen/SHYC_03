package com.MRYIN.service;

import com.MRYIN.pojo.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 作者：Mr.YIN  E-mail：1834145948qq.com
 * @date 2021/1/21 17:41
 */
public interface TaskPoolService {

    int addTask(Task task);
    int deleteTaskByTK_ID(Integer TK_ID);
    int updateTask(Task task);
    Task queryTaskByTK_ID(Integer TK_ID);
    List<Task> queryAllTask();
    List<Task> queryAllTaskByLimit(Integer page , Integer limit);
    /*
        查询所有分类的任务
     */
    int queryTaskByEchart(String TK_TaskType);
    /*
        查询所有分类的任务并且状态为0
     */
    int queryTaskByEchartBySTATUS(String TK_TaskType);
    List<Task> queryBySearch(String search_3 , String search_four);

}
