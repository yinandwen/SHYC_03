package com.MRYIN.controller;

import com.MRYIN.pojo.QuestionAndTask;
import com.MRYIN.pojo.Questionlist;
import com.MRYIN.service.QuestionAndTaskService;
import com.MRYIN.service.QuestionlistService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class QuestionAndTaskController {
    private static final Logger logger = LoggerFactory.getLogger(QuestionAndTask.class);

    @Resource
    private QuestionAndTaskService questionAndTaskService ;

    @Resource
    private QuestionlistService questionlistService ;

    /*
        查看详情
     */
    @RequestMapping("/QusetionAndTask/Check/{QS_ID}")
    public String Check(Model model , @PathVariable("QS_ID")Integer QS_ID , HttpSession session){
        Questionlist questionByPRJCode = questionlistService.getQuestionByPRJCode(QS_ID);
        System.out.println(QS_ID);
        System.out.println(questionByPRJCode);
        String qs_prjCode = questionByPRJCode.getQS_PRJCode();
        System.out.println(qs_prjCode);
        String qs_questionID = questionByPRJCode.getQS_QuestionID();
        System.out.println(qs_questionID);
        List<QuestionAndTask> questionAndTask = questionAndTaskService.AllQuestionAndTask(qs_prjCode,qs_questionID);
        if(questionAndTask.size() == 0){
            model.addAttribute("msg","该项目还没有分配任务，请分配^_^~");
            return "Home/message";
        }
        else{
            model.addAttribute("CheckList",questionAndTask);
            questionAndTask.forEach(questionAndTask1 -> {
                System.out.println(questionAndTask1);
            });
        }
        return "QuestionListAndTask/CheckAll/questionAndTaskCheck";
    }
}
