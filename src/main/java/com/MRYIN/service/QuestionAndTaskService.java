package com.MRYIN.service;

import com.MRYIN.pojo.QuestionAndTask;

import java.util.List;

public interface QuestionAndTaskService {
    List<QuestionAndTask> AllQuestionAndTask(String QS_PRJCode , String QS_QuestionID);
}
