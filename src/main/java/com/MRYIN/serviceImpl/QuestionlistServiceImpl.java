package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.QuestionlistMapper;
import com.MRYIN.pojo.Questionlist;
import com.MRYIN.service.QuestionlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionlistServiceImpl implements QuestionlistService {

    @Autowired
    private QuestionlistMapper questionlistMapper ;


    @Override
    public int addQuestion(Questionlist questionlist) {
        return questionlistMapper.addQuestion(questionlist);
    }

    @Override
    public int deleteQuestion(Integer QS_ID) {
        return questionlistMapper.deleteQuestion(QS_ID);
    }

    @Override
    public int updateQusetion(Questionlist questionlist) {
        return questionlistMapper.updateQusetion(questionlist);
    }

    @Override
    public int updateQS_TaskCode(Questionlist questionlist) {
        return questionlistMapper.updateQS_TaskCode(questionlist);
    }

    @Override
    public int updateStatus(Questionlist questionlist) {
        return questionlistMapper.updateStatus(questionlist);
    }

    @Override
    public List<Questionlist> AllQuestion() {
        return questionlistMapper.AllQuestion();
    }

    @Override
    public Questionlist getQuestionByPRJCode(Integer QS_ID) {
        return questionlistMapper.getQuestionByPRJCode(QS_ID);
    }

    @Override
    public List<Questionlist> AllQuestionByInput(String input) {
        return questionlistMapper.AllQuestionByInput(input);
    }

    @Override
    public List<Questionlist> getQuestionByTKPRJCodeAndTKQuestionID(String TK_PTJCode , String TK_QuestionID) {
        return questionlistMapper.getQuestionByTKPRJCodeAndTKQuestionID(TK_PTJCode,TK_QuestionID);
    }

    @Override
    public int getAllUnfinishedQuestion() {
        return questionlistMapper.getAllUnfinishedQuestion();
    }

    @Override
    public Questionlist getQuestionByPRJCodeAndQuestionID(String QS_PRJCode, String QS_QuestionID) {
        return questionlistMapper.getQuestionByPRJCodeAndQuestionID(QS_PRJCode,QS_QuestionID);
    }


}
