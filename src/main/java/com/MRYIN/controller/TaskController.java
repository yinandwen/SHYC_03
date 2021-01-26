package com.MRYIN.controller;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class TaskController {

    private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

    private static final Integer TK_STATUS = 0;

    @Resource
    private TaskService taskService;

    @Resource
    private QuestionlistService questionlistService;

    @Resource
    private QuestionAndTaskService questionAndTaskService;

    @RequestMapping("/Task/AllTask")
    public String allTask(HttpSession session, Model model, HttpServletRequest request, @RequestParam(value = "p", defaultValue = "1") Integer page) {
        int pageSize = 6;
        PageHelper.startPage(page, pageSize);
        List<Task> tasks = taskService.AllTask();
        PageInfo<Task> pageInfo = new PageInfo<>(tasks);
        List<Task> list = pageInfo.getList();
        model.addAttribute("Task", list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        logger.info("查询所有任务");
        return "QuestionListAndTask/Task/TaskList";
    }

    /*
        修改的展示所有任务
     */
    @RequestMapping("/Task/AllTaskQuestion")
    public String AllTaskQuestion(HttpSession session, Model model, HttpServletRequest request, @RequestParam(value = "p", defaultValue = "1") Integer page) {
        Questionlist questionlist = (Questionlist) session.getAttribute("question");
        String qs_prjCode = questionlist.getQS_PRJCode();
        String qs_questionID = questionlist.getQS_QuestionID();
        int pageSize = 6;
        PageHelper.startPage(page, pageSize);
        List<Task> allTaskByPRJCodeAndQuestionID = taskService.getAllTaskByPRJCodeAndQuestionID(qs_prjCode, qs_questionID);
        if (allTaskByPRJCodeAndQuestionID.size() == 0) {
            model.addAttribute("msg", "该问题还没有分配任务，请在左侧添加任务吧^_^");
            return "Home/message";
        }
        PageInfo<Task> pageInfo = new PageInfo<>(allTaskByPRJCodeAndQuestionID);
        List<Task> list = pageInfo.getList();
        model.addAttribute("Task", list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        logger.info("查询所有任务");
        return "QuestionListAndTask/Task/TaskQuestionList";
    }

    /*
        添加任务
     */
    @RequestMapping("/Task/toAddTask/{QS_ID}")
    public String toAddTask(@PathVariable("QS_ID") Integer QS_ID, Model model, HttpSession session) {
        System.out.println(QS_ID);
        session.setAttribute("QS_ID", QS_ID);
        Questionlist questionByPRJCode = questionlistService.getQuestionByPRJCode(QS_ID);
        String qs_prjCode = questionByPRJCode.getQS_PRJCode();
        String qs_questionID = questionByPRJCode.getQS_QuestionID();
        model.addAttribute("TK_PRJCode", qs_prjCode);
        model.addAttribute("TK_QuestionID", qs_questionID);
        System.out.println(qs_prjCode);
        System.out.println(qs_questionID);
        session.setAttribute("question", questionByPRJCode);

        List<String> imageList = new ArrayList<>();
        String qs_addressInfo = questionByPRJCode.getQS_AddressInfo();
        System.out.println("我是qs_adressInfo=>" + qs_addressInfo);
        String[] split = qs_addressInfo.split(";");
        for (int i = 0; i < split.length; i++) {
            System.out.println("我是split数组的第" + i + "号：" + split[i]);
            imageList.add(split[i]);
            model.addAttribute("imageList", imageList);
        }
        model.addAttribute("imageList", imageList);
        /*
            通过QS_ID找到该问题，然后model去TaskQuestion
         */
        model.addAttribute("QuestionList", questionByPRJCode);
        return "QuestionListAndTask/Task/TaskQuestion";
    }

    @RequestMapping("/Task/addTask")
    public String addTask(Task task, HttpSession session, Model model) {
        System.out.println("我是你页面输入的信息：" + task);
        Integer qs_id = (Integer) session.getAttribute("QS_ID");
        String tk_prjCode = task.getTK_PRJCode();
        System.out.println(tk_prjCode);
        String tk_questionID = task.getTK_QuestionID();
        System.out.println(tk_questionID);
        String tk_code = task.getTK_CODE();
        System.out.println(tk_code);
        Task task1 = taskService.taskByPRJCodeAndQuestionIDAndCODE(tk_prjCode, tk_questionID, tk_code);
        System.out.println(task1);
        if (null != task1) {
            model.addAttribute("msg", "此任务已经存在，请重新分配任务！");
            return "Home/message";
        } else {
            task.setTK_CREATED_TIME(FormatDate.formatDate());
            int i = taskService.addTask(task);
        }
        return "redirect:/Task/toAddTask/" + qs_id;
    }

    /*
        删除任务
     */
    @RequestMapping("/Task/deleteTask/{TK_ID}")
    public String deleteTask(@PathVariable("TK_ID") Integer TK_ID, HttpSession session) {
        Integer page = (Integer) session.getAttribute("page");
        int i = taskService.deleteTask(TK_ID);
        return "redirect:/Task/AllTaskQuestion?p=" + page;
    }


    /*
        修改任务
     */
    @RequestMapping("/Task/toUpdateTask/{TK_ID}")
    public String toUpdateTask(@PathVariable("TK_ID") Integer TK_ID, Model model, HttpSession session) {
        Task taskByPRJCode = taskService.getTaskByPRJCode(TK_ID);
        System.out.println("我是去更新controller的 = >" + taskByPRJCode);
        model.addAttribute("task", taskByPRJCode);
        session.setAttribute("TK_ID", TK_ID);
        session.setAttribute("taskByPRJCode", taskByPRJCode);
        return "QuestionListAndTask/Task/updateTask";
    }

    @RequestMapping("/Task/updateTask")
    public String updateTask(HttpSession session, Model model, Task task) {
        Integer page = (Integer) session.getAttribute("page");
        Task taskByPRJCode = (Task) session.getAttribute("taskByPRJCode");
        System.out.println("我是更新controller的 = >" + taskByPRJCode);
        System.out.println("我是页面输入的 = >" + task);
        task.setTK_UPDATED_TIME(FormatDate.formatDate());
        Date tk_start_date = task.getTK_START_DATE();
        Date tk_end_date = task.getTK_END_DATE();
        String tk_department = task.getTK_Department();

        if (tk_department == null) {
            String tk_department1 = taskByPRJCode.getTK_Department();
            tk_department = tk_department1;
            task.setTK_Department(tk_department);
        }

        if (tk_start_date == null) {
            Date tk_start_date1 = taskByPRJCode.getTK_START_DATE();
            tk_start_date = tk_start_date1;
            task.setTK_START_DATE(tk_start_date);
        }

        if (tk_end_date == null) {
            Date tk_end_date1 = taskByPRJCode.getTK_END_DATE();
            tk_end_date = tk_end_date1;
            task.setTK_END_DATE(tk_end_date);
        }

        if (tk_end_date == null && tk_start_date == null) {
            Date tk_start_date1 = taskByPRJCode.getTK_START_DATE();
            Date tk_end_date1 = taskByPRJCode.getTK_END_DATE();
            tk_start_date = tk_start_date1;
            tk_end_date = tk_end_date1;
            task.setTK_START_DATE(tk_start_date);
            task.setTK_END_DATE(tk_end_date);
        }

        System.out.println("我是页面进行了设置之后的" + task);
        int i = taskService.updateTask(task);
        if (i == 0) {
            model.addAttribute("msg", "更新失败");
            return "Home/message";
        } else {
            session.setAttribute("updateTask", i);
        }
        return "redirect:/Task/AllTaskQuestion?p=" + page;
    }


    /*
        修改状态
     */
    @RequestMapping("/Task/toUpdateStatus")
    @ResponseBody
    public Map<String, Object> toUpdateStatus(Integer TK_STATUS, Integer TK_ID, HttpSession session, Model model) {
        System.out.println("我是从前端获取的问题状态：" + TK_STATUS);
        System.out.println("我是从前端获取的项目ID：" + TK_ID);
        Map<String, Object> reslut = new HashMap<>();
        Task taskByPRJCode = taskService.getTaskByPRJCode(TK_ID);
        System.out.println(taskByPRJCode);
        if (TK_STATUS == 0) {
            TK_STATUS = 1;
            taskByPRJCode.setTK_STATUS(TK_STATUS);
            reslut.put("success", true);
        } else {
            TK_STATUS = 0;
            taskByPRJCode.setTK_STATUS(TK_STATUS);
            reslut.put("success", true);
        }
        session.setAttribute("taskByPRJCode", taskByPRJCode);
        return reslut;
    }

    @RequestMapping("/Task/updateStatus")
    public String updateStatus(HttpSession session) {
        Integer page = (Integer) session.getAttribute("page");
        Task taskByPRJCode = (Task) session.getAttribute("taskByPRJCode");
        System.out.println("我是从另外一个controller中获取到的：" + taskByPRJCode);
        taskByPRJCode.setTK_UPDATED_TIME(FormatDate.formatDate());
        taskService.updateStatus(taskByPRJCode);
        logger.info("更新了任务的状态");
        return "redirect:/Task/AllTaskQuestion?p=" + page;
    }


    /*
        模糊查询
     */
    @RequestMapping("/Task/toSreach")
    @ResponseBody
    public Map<String, Object> toSreach(String inputMsg, HttpSession session) {
        System.out.println("我是从前端获取到的：" + inputMsg);
        Map<String, Object> result = new HashMap<>();
        List<Task> tasks = taskService.AllTaskBySreach(inputMsg);
        if (tasks.size() != 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        session.setAttribute("input", inputMsg);
        return result;
    }

    @RequestMapping("/Task/query")
    public String toQuery(Model model, HttpServletRequest request,
                          @RequestParam(value = "p", defaultValue = "1") Integer page,
                          HttpSession session) {
        String input = (String) session.getAttribute("input");
        System.out.println("我是从上一个controller中获取到的input：" + input);
        int pageSize = 4;
        PageHelper.startPage(page, pageSize);
        List<Task> tasks = taskService.AllTaskBySreach(input);
        PageInfo<Task> pageInfo = new PageInfo<>(tasks);
        List<Task> list = pageInfo.getList();
        model.addAttribute("Task", list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        logger.info("查询所有任务");
        return "QuestionListAndTask/Task/TaskList";
    }


    /*
        根据树形组件中的部门来查询
     */
    @RequestMapping("/Task/toDepartment")
    @ResponseBody
    public Map<String, Object> toDepartment(String department, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        List<Task> tasks = taskService.AllTaskByDepartment(department);
        if (tasks.size() > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        session.setAttribute("department", department);
        return result;
    }

    @RequestMapping("/Task/queryByDepartment")
    public String queryByDeptName(Model model, HttpServletRequest request,
                                  @RequestParam(value = "p", defaultValue = "1") Integer page,
                                  HttpSession session) {
        String department = (String) session.getAttribute("department");
        System.out.println("我是从上一个controller中获取到的input：" + department);
        int pageSize = 4;
        PageHelper.startPage(page, pageSize);
        List<Task> tasks = taskService.AllTaskByDepartment(department);
        PageInfo<Task> pageInfo = new PageInfo<>(tasks);
        List<Task> list = pageInfo.getList();
        model.addAttribute("Task", list);
        StringBuffer requestURL = request.getRequestURL();
        String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
        model.addAttribute("pageNav", pageNav);
        session.setAttribute("page", page);
        logger.info("查询所有任务");
        return "QuestionListAndTask/Task/TaskList";
    }

    /*
        去审批
     */
    @RequestMapping("/Task/toQuestion/{TK_ID}")
    public String toQuestion(@PathVariable("TK_ID") Integer TK_ID,
                             Model model,
                             HttpServletRequest request,
                             HttpSession session,
                             @RequestParam(value = "p", defaultValue = "1") Integer page) {


        Task taskByPRJCode = taskService.getTaskByPRJCode(TK_ID);
        System.out.println(taskByPRJCode);
        String tk_prjCode = taskByPRJCode.getTK_PRJCode();
        String tk_questionID = taskByPRJCode.getTK_QuestionID();
        int pageSize = 4;
        PageHelper.startPage(page, pageSize);
        List<Questionlist> questionByTKPRJCodeAndTKQuestionID = questionlistService.getQuestionByTKPRJCodeAndTKQuestionID(tk_prjCode, tk_questionID);
        if (questionByTKPRJCodeAndTKQuestionID.size() == 0) {
            model.addAttribute("msg", "录入的项目号出错，或者是问题编号出错，请联系管理员解决");
            return "Home/message";
        } else {
            for (Questionlist questionlist : questionByTKPRJCodeAndTKQuestionID) {
                String qs_prjCode = questionlist.getQS_PRJCode();
                String qs_questionID = questionlist.getQS_QuestionID();
                List<QuestionAndTask> questionAndTasks = questionAndTaskService.AllQuestionAndTask(qs_prjCode, qs_questionID);
                for (QuestionAndTask questionAndTask : questionAndTasks) {
                    ArrayList<Integer> allStatus = new ArrayList<>();
                    allStatus.add(questionAndTask.getTK_STATUS());
                    for (Integer tk_status : allStatus) {
                        if (tk_status.equals(TK_STATUS)) {
                            System.out.println();
                            System.out.println("我是查看详情中的任务状态=>" + tk_status);
                            model.addAttribute("msg", "该问题的任务还没有全部完成，请确认任务都已完成再点击此按钮去审批");
                            return "Home/message";
                        } else {
                            PageInfo<Questionlist> pageInfo = new PageInfo<>(questionByTKPRJCodeAndTKQuestionID);
                            List<Questionlist> list = pageInfo.getList();
                            model.addAttribute("QuestionList", list);
                            StringBuffer requestURL = request.getRequestURL();
                            String pageNav = Pager.getPageNav(page, pageSize, pageInfo, requestURL);
                            model.addAttribute("pageNav", pageNav);
                            session.setAttribute("page", page);
                            logger.info("该问题中的任务" + questionAndTask.getTK_NAME() + "已处理");
                        }
                    }
                }
            }
        }
        return "QuestionListAndTask/QuestionList/questionlist";
    }
}
