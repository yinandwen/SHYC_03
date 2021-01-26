package com.MRYIN.service;

import com.MRYIN.pojo.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaskService {

    int addTask(Task task);

    int deleteTask(Integer TK_ID);

    int updateTask(Task task);

    int updateStatus(Task task);

    List<Task> AllTask();

    Task getTaskByPRJCode(Integer TK_ID);

    List<Task> AllTaskByTK_PRJCode(String TK_PRJCode);

    List<Task> AllTaskBySreach(String input);

    List<Task> AllTaskByDepartment(String department);

    Task taskByPRJCodeAndQuestionIDAndCODE(@Param("TK_PRJCode") String TK_PRJCode, @Param("TK_QuestionID")String TK_QuestionID , @Param("TK_CODE") String TK_CODE);

    int getAllUnfinishedTask();

    List<Task> getAllTaskByPRJCodeAndQuestionID (String QS_PRJCode ,String QS_QuestionID);

    List<Task> queryAllTaskByLimit(Integer page, Integer limit);

}
