package com.MRYIN;

import com.MRYIN.pojo.QuestionAndTask;
import com.MRYIN.pojo.Questionlist;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.QuestionAndTaskService;
import com.MRYIN.service.QuestionlistService;
import com.MRYIN.service.TaskService;
import com.MRYIN.util.FormatDate;
import com.MRYIN.util.Pager;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class QuestionTest {
    @Resource
    private QuestionlistService questionlistService;
    @Resource
    private TaskService taskService;

    @Resource
    private QuestionAndTaskService questionAndTaskService;

    @Test
    public void addQuestion() {
        Questionlist questionlist = new Questionlist();
        questionlist.setQS_PRJCode("YC-0001");
        questionlist.setQS_Description("售后测试2");
        questionlist.setQS_Responer("MRYIN");
        questionlist.setQS_SupportDept("人事部");
        questionlist.setQS_ReasonType("原因测试");
        questionlist.setQS_Reason("原因测试内容");
        questionlist.setQS_ActionType("措施测试");
        questionlist.setQS_Action("措施内容测试");
        questionlist.setQS_Note("这是测试的数据");
        questionlist.setQS_CREATED_TIME(FormatDate.formatDate());
        questionlist.setQS_CREATED_BY("MRYIN");
        int i = questionlistService.addQuestion(questionlist);
        System.out.println(i);
    }

    @Test
    public void allQuestion() {
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        for (Questionlist questionlist : questionlists) {
            System.out.println(questionlist);
        }
        questionlists.forEach(questionlist -> {
            System.out.println(questionlist);
        });
    }

    @Test
    public void getQuestionByPRJCode() {
        Questionlist questionByPRJCode = questionlistService.getQuestionByPRJCode(1);
        System.out.println(questionByPRJCode);
    }

    @Test
    public void updateQusetion() {
        Questionlist questionByPRJCode = questionlistService.getQuestionByPRJCode(1);
        questionByPRJCode.setQS_PRJCode("YC-0004");
        questionByPRJCode.setQS_Description("售后测试4");
        questionByPRJCode.setQS_Responer("MRWEN");
        questionByPRJCode.setQS_SupportDept("人事部");
        questionByPRJCode.setQS_DelayTime(4);
        questionByPRJCode.setQS_ReasonType("原因测试");
        questionByPRJCode.setQS_Reason("原因测试内容");
        questionByPRJCode.setQS_ActionType("措施测试");
        questionByPRJCode.setQS_Action("措施内容测试");
        questionByPRJCode.setQS_Note("这是测试的数据");
        questionByPRJCode.setQS_UPDATED_TIME(FormatDate.formatDate());
        questionByPRJCode.setQS_CREATED_BY("MRYIN");
        int i = questionlistService.updateQusetion(questionByPRJCode);
        System.out.println(i);
    }

    @Test
    public void AllQuestionByInput() {
        List<Questionlist> questionlists = questionlistService.AllQuestionByInput("1");
        questionlists.forEach(questionlist -> {
            System.out.println(questionlist);
        });
    }

    /*
        根据项目号和问题号查找
     */
    @Test
    public void getQuestionByPRJCodeAndQuestionID() {
        Questionlist questionByPRJCodeAndQuestionID = questionlistService.getQuestionByPRJCodeAndQuestionID("YC-0008", "Q-0001");
        System.out.println(questionByPRJCodeAndQuestionID);
    }

    /*
        根据项目号和问题号查询所有任务
     */
    @Test
    public void AllQuestionAndTask() {
        List<QuestionAndTask> questionAndTask = questionAndTaskService.AllQuestionAndTask("YC-0008", "Q-0001");
        questionAndTask.forEach(questionAndTask1 -> {
            System.out.println(questionAndTask1);
        });
    }
    /*
        通过task的PRJCode和QuesitnID查找
     */
    @Test
    public void getQuestionByTKPRJCodeAndTKQuestionID(){
        Questionlist questionByPRJCodeAndQuestionID = questionlistService.getQuestionByPRJCodeAndQuestionID("YC-0008", "Q-0001");
        System.out.println(questionByPRJCodeAndQuestionID);
    }


    @Test
    public void teset(){
        List<String> imageList = new ArrayList<>();
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        PageInfo<Questionlist> pageInfo = new PageInfo<>(questionlists);
        List<Questionlist> list = pageInfo.getList();
        for (Questionlist questionlist : list) {
            String qs_addressInfo = questionlist.getQS_AddressInfo();
            String[] split = qs_addressInfo.split(";");
            System.out.println("wafj "+split[0]);
        }
    }

}
