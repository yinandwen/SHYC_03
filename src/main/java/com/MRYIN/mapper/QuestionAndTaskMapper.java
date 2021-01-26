package com.MRYIN.mapper;

import com.MRYIN.pojo.QuestionAndTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface QuestionAndTaskMapper {
    List<QuestionAndTask> AllQuestionAndTask(@Param("QS_PRJCode") String QS_PRJCode , @Param("QS_QuestionID")String QS_QuestionID);
}
