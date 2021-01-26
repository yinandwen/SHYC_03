package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.TaskMapper;
import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper ;

    @Override
    public int addTask(Task task) {
        return taskMapper.addTask(task);
    }

    @Override
    public int deleteTask(Integer TK_ID) {
        return taskMapper.deleteTask(TK_ID);
    }

    @Override
    public int updateTask(Task task) {
        return taskMapper.updateTask(task);
    }

    @Override
    public int updateStatus(Task task) {
        return taskMapper.updateStatus(task);
    }

    @Override
    public List<Task> AllTask() {
        return taskMapper.AllTask();
    }

    @Override
    public Task getTaskByPRJCode(Integer TK_ID) {
        return taskMapper.getTaskByPRJCode(TK_ID);
    }

    @Override
    public List<Task> AllTaskByTK_PRJCode(String TK_PRJCode) {
        return taskMapper.AllTaskByTK_PRJCode(TK_PRJCode);
    }

    @Override
    public List<Task> AllTaskBySreach(String input) {
        return taskMapper.AllTaskBySreach(input);
    }

    @Override
    public List<Task> AllTaskByDepartment(String department) {
        return taskMapper.AllTaskByDepartment(department);
    }

    @Override
    public Task taskByPRJCodeAndQuestionIDAndCODE(String TK_PRJCode, String TK_QuestionID , String TK_CODE) {
        return taskMapper.taskByPRJCodeAndQuestionIDAndCODE(TK_PRJCode, TK_QuestionID ,TK_CODE);
    }

    @Override
    public int getAllUnfinishedTask() {
        return taskMapper.getAllUnfinishedTask();
    }

    @Override
    public List<Task> getAllTaskByPRJCodeAndQuestionID(String QS_PRJCode, String QS_QuestionID) {
        return taskMapper.getAllTaskByPRJCodeAndQuestionID(QS_PRJCode,QS_QuestionID);
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
        List<Task> list = taskMapper.queryAllTaskByLimit(start,limit);
        return  list;
    }
}
