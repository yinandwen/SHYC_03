package com.MRYIN.controller;

import com.MRYIN.pojo.EditorResult;
import com.MRYIN.pojo.Questionlist;
import com.MRYIN.service.QuestionlistService;
import com.MRYIN.util.FormatDate;
import com.MRYIN.util.Pager;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class QuestionlistController {

    private static final Logger logger = LoggerFactory.getLogger(QuestionlistController.class);

    @Resource
    private QuestionlistService questionlistService;

    /*
        获取到所有的售后问题
     */
    @RequestMapping("/Question/getAllQuestions")
    public String getAllQuestions(HttpSession session, Model model, HttpServletRequest request, @RequestParam(value = "p", defaultValue = "1") Integer page) {
        int pageSize = 5;
        PageHelper.startPage(page, pageSize);
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        PageInfo<Questionlist> pageInfo = new PageInfo<>(questionlists);
        List<Questionlist> list = pageInfo.getList();
        model.addAttribute("QuestionList", list);


        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        logger.info("查询所有的问题");
        return "QuestionListAndTask/QuestionList/questionlist";
    }


    /*
        添加售后问题
     */
    @RequestMapping("/Question/toAddQuestion")
    public String toAddQuestion() {
        return "QuestionListAndTask/QuestionList/addQuestion";
    }

    @RequestMapping("/Question/addQuestion")
    public String addProblemDescription(HttpServletRequest request,
                                        HttpSession session,
                                        Questionlist questionlist,
                                        Model model,
                                        @RequestParam("file") MultipartFile[] files) throws IllegalStateException, IOException {
        String filePath = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println(files.toString());
        System.out.println(files.length);
        String file = "";
        for (int i = 0; i < files.length; i++) {
            String originalFilename = files[i].getOriginalFilename();
            System.out.println("我是第" + i + "次" + "的=>" + originalFilename);
            String newFileName = UUID.randomUUID() + originalFilename;
            System.out.println("我是第" + i + "次" + "的=>" + newFileName);
            file += newFileName + ";";
            File targetFile = new File(filePath, newFileName);
            files[i].transferTo(targetFile);
            questionlist.setQS_AddressInfo(file);
            System.out.println(file);
        }
        questionlist.setQS_CREATED_TIME(FormatDate.formatDate());
        Questionlist questionByPRJCodeAndQuestionID = questionlistService.getQuestionByPRJCodeAndQuestionID(questionlist.getQS_PRJCode(), questionlist.getQS_QuestionID());
        if (questionByPRJCodeAndQuestionID != null) {
            model.addAttribute("msg", "此项目中已存在此编号的问题，请换一个编号重试。例如：Q-0001 -> Q-0002");
            return "Home/message";
        } else {
            int i = questionlistService.addQuestion(questionlist);
            session.setAttribute("addQuestion", i);
        }
        logger.info("添加了一个售后问题^_^~");
        return "redirect:/Question/getAllQuestions";
    }


    /*
        删除一条售后问题
     */
    @RequestMapping("/Question/deleteQuestion/{QS_ID}")
    public String deleteQuestion(@PathVariable("QS_ID") Integer QS_ID, HttpSession session) {
        Integer page = (Integer) session.getAttribute("page");
        int i = questionlistService.deleteQuestion(QS_ID);
        return "redirect:/Question/getAllQuestions?p=" + page;
    }

    /*
        修改售后问题
     */
    @RequestMapping("/Question/toUpdateQuestion/{QS_ID}")
    public String toUpdateQuestion(@PathVariable("QS_ID") Integer QS_ID, Model model, HttpSession session) {
        Questionlist questionByPRJCode = questionlistService.getQuestionByPRJCode(QS_ID);
        model.addAttribute("Question", questionByPRJCode);
        session.setAttribute("QS_ID", QS_ID);
        session.setAttribute("Question", questionByPRJCode);
        return "QuestionListAndTask/QuestionList/updateQuestion";
    }

    @RequestMapping("/Question/updateQuestion")
    public String updateQuestion(Questionlist questionlist,
                                 HttpSession session,
                                 HttpServletRequest request,
                                 Model model,
                                 @RequestParam("file") MultipartFile[] files) throws IllegalStateException, IOException {
        String filePath = request.getSession().getServletContext().getRealPath("/upload");
        Integer qs_id = (Integer) session.getAttribute("QS_ID");
        Questionlist question = (Questionlist) session.getAttribute("Question");
        System.out.println(question);
        System.out.println(qs_id);
        System.out.println(questionlist);
        String qs_addressInfo = question.getQS_AddressInfo();
        System.out.println(qs_addressInfo);
        String qs_addressInfo1 = questionlist.getQS_AddressInfo();
        System.out.println(qs_addressInfo1);
        String qs_supportDept = questionlist.getQS_SupportDept();
        String qs_supportDept1 = question.getQS_SupportDept();

        String imageUrl = "";

        if (qs_supportDept == null) {
            qs_supportDept = qs_supportDept1;
            questionlist.setQS_SupportDept(qs_supportDept);
        }

        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                qs_addressInfo1 = qs_addressInfo;
                logger.info("我是file为空的情况=>");
                System.out.println(qs_addressInfo1);
                questionlist.setQS_AddressInfo(qs_addressInfo1);
                System.out.println(questionlist);

            } else {
                 /*
                更新时获取页面输入的图片地址
            */
                String originalFilename = file.getOriginalFilename();
                System.out.println("我是=>" + originalFilename);
                String newFileName = UUID.randomUUID() + originalFilename;
                System.out.println("我是" + "加随机码之后新的=>" + newFileName);
                imageUrl += newFileName + ";";
                File targetFile = new File(filePath, newFileName);
                file.transferTo(targetFile);
                System.out.println(imageUrl);
                questionlist.setQS_AddressInfo(imageUrl);
            }
        }
        System.out.println(questionlist);
        questionlist.setQS_UPDATED_TIME(FormatDate.formatDate());
        int i = questionlistService.updateQusetion(questionlist);
        if (i == 0) {
            model.addAttribute("msg", "更新失败");
            return "Home/message";
        }
        session.setAttribute("updateQuestion", i);
        return "forward:/Question/getAllQuestions";
    }

    /*
        修改状态
     */
    @RequestMapping("/Question/toUpdateStatus")
    @ResponseBody
    public Map<String, Object> toUpdateStatus(Integer QS_OpenClose, Integer QS_ID, HttpSession session, Model model) {
        System.out.println("我是从前端获取的问题状态：" + QS_OpenClose);
        System.out.println("我是从前端获取的项目ID：" + QS_ID);
        Map<String, Object> reslut = new HashMap<>();
        Questionlist questionByPRJCode = questionlistService.getQuestionByPRJCode(QS_ID);
        System.out.println(questionByPRJCode);
        if (QS_OpenClose == 0) {
            QS_OpenClose = 1;
            questionByPRJCode.setQS_OpenClose(QS_OpenClose);
            reslut.put("success", true);
        } else {
            QS_OpenClose = 0;
            questionByPRJCode.setQS_OpenClose(QS_OpenClose);
            reslut.put("success", true);
        }
        session.setAttribute("QuestionByUpdateStatus", questionByPRJCode);
        return reslut;
    }

    @RequestMapping("/Question/updateStatus")
    public String updateStatus(HttpSession session) {
        Integer page = (Integer) session.getAttribute("page");
        Questionlist questionByUpdateStatus = (Questionlist) session.getAttribute("QuestionByUpdateStatus");
        System.out.println("我是从另外一个controller中获取到的：" + questionByUpdateStatus);
        questionByUpdateStatus.setQS_UPDATED_TIME(FormatDate.formatDate());
        questionlistService.updateStatus(questionByUpdateStatus);
        logger.info("更新了任务的状态");
        return "redirect:/Question/getAllQuestions?p=" + page;
    }


    /*
        模糊查询
     */
    @RequestMapping("/Question/toSreach")
    @ResponseBody
    public Map<String, Object> toSreach(String inputMsg, HttpSession session) {
        System.out.println("我是从前端获取到的：" + inputMsg);
        Map<String, Object> result = new HashMap<>();
        List<Questionlist> questionlists = questionlistService.AllQuestionByInput(inputMsg);
        if (questionlists.size() != 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        session.setAttribute("input", inputMsg);
        return result;
    }

    @RequestMapping("/Question/query")
    public String toQuery(Model model, HttpServletRequest request,
                          @RequestParam(value = "p", defaultValue = "1") Integer page,
                          HttpSession session) {
        String input = (String) session.getAttribute("input");
        System.out.println("我是从上一个controller中获取到的input：" + input);
        int pageSize = 4;
        PageHelper.startPage(page, pageSize);
        List<Questionlist> questionlists = questionlistService.AllQuestionByInput(input);
        PageInfo<Questionlist> pageInfo = new PageInfo<>(questionlists);
        List<Questionlist> list = pageInfo.getList();
        model.addAttribute("QuestionList", list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        logger.info("Question的模糊搜索^_^");
        return "QuestionListAndTask/QuestionList/questionlist";
    }
}
