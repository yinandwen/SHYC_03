package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.TaskMapper;
import com.MRYIN.mapper.TaskPoolMapper;
import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.TaskPoolService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: Mr.Yin
 * @create: 2021-01-21 17:41
 **/
@Service
public class TaskPoolServiceImpl implements TaskPoolService {

    @Resource
    private TaskPoolMapper taskPoolMapper ;

    @Override
    public int addTask(Task task) {
        return taskPoolMapper.addTask(task);
    }

    @Override
    public int deleteTaskByTK_ID(Integer TK_ID) {
        return taskPoolMapper.deleteTaskByTK_ID(TK_ID);
    }

    @Override
    public int updateTask(Task task) {
        return taskPoolMapper.updateTask(task);
    }

    @Override
    public Task queryTaskByTK_ID(Integer TK_ID) {
        return taskPoolMapper.queryTaskByTK_ID(TK_ID);
    }

    @Override
    public List<Task> queryAllTask() {
        return taskPoolMapper.queryAllTask();
    }

    @Override
    public List<Task> queryAllTaskByLimit(Integer page, Integer limit) {

        if(page == null || page <= 0){
            page = 1;
        }
        if (limit == null || limit <= 0){
            limit = 10;
        }
        Integer start = (page - 1) * limit;
        List<Task> list = taskPoolMapper.queryAllTaskByLimit(start,limit);
        return  list;
    }

    @Override
    public int queryTaskByEchart(String TK_TaskType) {
        return taskPoolMapper.queryTaskByEchart(TK_TaskType);
    }

    @Override
    public int queryTaskByEchartBySTATUS(String TK_TaskType) {
        return taskPoolMapper.queryTaskByEchartBySTATUS(TK_TaskType);
    }

    @Override
    public List<Task> queryBySearch(String search_3 , String search_4) {
        return taskPoolMapper.queryBySearch(search_3,search_4);
    }
}