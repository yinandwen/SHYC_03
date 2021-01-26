package com.MRYIN.mapper;

import com.MRYIN.pojo.ProjectOrders;
import com.MRYIN.pojo.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaskMapper {

    int addTask(Task task);

    int deleteTask(Integer TK_ID);

    int updateTask(Task task);

    int updateStatus(Task task);

    List<Task> AllTask();

    Task getTaskByPRJCode(Integer TK_ID);

    List<Task> AllTaskByTK_PRJCode(String TK_PRJCode);

    List<Task> AllTaskBySreach(String input);

    List<Task> AllTaskByDepartment(String department);

    Task taskByPRJCodeAndQuestionIDAndCODE(@Param("TK_PRJCode") String TK_PRJCode, @Param("TK_QuestionID")String TK_QuestionID ,  @Param("TK_CODE") String TK_CODE);

    int getAllUnfinishedTask();
    
    List<Task> getAllTaskByPRJCodeAndQuestionID(@Param("QS_PRJCode")String QS_PRJCode , @Param("QS_QuestionID")String QS_QuestionID);

    List<Task> queryAllTaskByLimit(@Param("page")Integer page, @Param("limit") Integer limit);

}
