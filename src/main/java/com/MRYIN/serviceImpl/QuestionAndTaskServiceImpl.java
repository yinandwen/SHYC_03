package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.QuestionAndTaskMapper;
import com.MRYIN.pojo.QuestionAndTask;
import com.MRYIN.service.QuestionAndTaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class QuestionAndTaskServiceImpl implements QuestionAndTaskService {

    @Resource
    private QuestionAndTaskMapper questionAndTaskMapper;


    @Override
    public List<QuestionAndTask> AllQuestionAndTask(String QS_PRJCode, String QS_QuestionID) {
        return questionAndTaskMapper.AllQuestionAndTask(QS_PRJCode,QS_QuestionID);
    }
}
