package com.MRYIN.mapper;

import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 作者：Mr.YIN  E-mail：1834145948qq.com
 * @date 2021/1/21 17:37
 */
public interface TaskPoolMapper {

    int addTask(Task task);
    int deleteTaskByTK_ID(Integer TK_ID);
    int updateTask(Task task);
    Task queryTaskByTK_ID(Integer TK_ID);
    List<Task> queryAllTask();
    List<Task> queryAllTaskByLimit(@Param("page")Integer page , @Param("limit")Integer limit);
    /*
       查询所有分类的任务
    */
    int queryTaskByEchart(String TK_TaskType);
    /*
        查询所有分类的任务并且状态为0
     */
    int queryTaskByEchartBySTATUS(String TK_TaskType);
    /*
        第一个参数为任务类型，第二个参数为任务的项目号，或者是任务号，或者是订单名称
     */
    List<Task> queryBySearch(@Param("search_3") String search_3 ,@Param("search_4") String search_four);
}
