package com.MRYIN.mapper;

import com.MRYIN.pojo.Questionlist;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionlistMapper {

    int addQuestion(Questionlist questionlist);

    int deleteQuestion(Integer QS_ID);

    int updateQusetion(Questionlist questionlist);

    int updateQS_TaskCode(Questionlist questionlist);

    int updateStatus(Questionlist questionlist);

    List<Questionlist> AllQuestion();

    Questionlist getQuestionByPRJCode(Integer QS_ID);

    List<Questionlist> AllQuestionByInput(String input);

    List<Questionlist> getQuestionByTKPRJCodeAndTKQuestionID(@Param("TK_PRJCode")String TK_PRJCode , @Param("TK_QuestionID")String TK_QuestionID);

    int getAllUnfinishedQuestion();
    
    Questionlist getQuestionByPRJCodeAndQuestionID(@Param("QS_PRJCode")String QS_PRJCode , @Param("QS_QuestionID")String QS_QuestionID);

}
