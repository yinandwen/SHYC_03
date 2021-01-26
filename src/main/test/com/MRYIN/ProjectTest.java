package com.MRYIN;

import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Project;
import com.MRYIN.pojo.ProjectOrders;
import com.MRYIN.service.ProjectOrdersService;
import com.MRYIN.service.ProjectService;
import com.MRYIN.util.FormatDate;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.access.method.P;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.zip.DataFormatException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ProjectTest {

    @Resource
    private ProjectService projectService ;

    @Test
    public void addProject(){

        Date date1 = null;
        Date date2 = null;
        try {
            date1 = FormatDate.StringForDate("2020-12-12");
            date2 = FormatDate.StringForDate("2020-12-20");
        } catch (DataFormatException e) {
            e.printStackTrace();
        }
        System.out.println(date1);
        System.out.println(date2);

        ProjectOrders projectOrders = new ProjectOrders();
        projectOrders.setPRJ_CODE("YC-0002");
        projectOrders.setPRJ_ALL_TASKS(10);
        projectOrders.setPRJ_MANAGER_ID("项目经理");
        projectOrders.setPRJ_START_DATE(date1);
        projectOrders.setPRJ_DELIVERY_DATE(date2);
        projectOrders.setPRJ_SITUATION("待启动");
        int i = projectService.addProject(projectOrders);
        System.out.println(i);
    }


    @Test
    public void queryByOrdersISNULLTest(){
        List<ProjectOrders> projectOrders = projectService.queryByOrdersISNULL();
        projectOrders.forEach(projectOrders1 -> {
            System.out.println(projectOrders1);
        });
    }

    @Test
    public void queryAllProjectByLimit(){
        List<ProjectOrders> projectOrders = projectService.queryAllProjectByLimit(1,10);
        projectOrders.forEach(projectOrders1 -> {
            System.out.println(projectOrders1);
        });
    }


    @Test
    public void treeSearchBySelectTest(){
        List<Orders> 待启动 = projectService.treeSearchBySelect();
        for (Orders orders : 待启动) {
            System.out.println(orders);
        }
    }

    @Test
    public void updateProjectTest(){
        Date date1 = null;
        Date date2 = null;
        try {
            date1 = FormatDate.StringForDate("2020-12-12");
            date2 = FormatDate.StringForDate("2020-12-21");
        } catch (DataFormatException e) {
            e.printStackTrace();
        }
        ProjectOrders projectOrders = projectService.queryByPRJ_ID(6);
        System.out.println(projectOrders);
        projectOrders.setPRJ_START_DATE(date1);
        projectOrders.setPRJ_DELIVERY_DATE(date2);
        int i = projectService.updateProject(projectOrders);
        System.out.println(i);
    }

    /*
        查询所有除去待立项状态的所有项目
     */
    @Test
    public void treeSearchBySelectOtherTest(){
        List<ProjectOrders> projectOrders = projectService.treeSearchBySelectOther("待启动","YC0001");
        System.out.println(projectOrders.size());
        projectOrders.forEach(projectOrder1->{
            System.out.println(projectOrder1);
        });
    }

    @Test
    public void queryAllTaskByProject(){
        int yc0001 = projectService.queryAllTaskForProject("YC0001");
        System.out.println(yc0001);
    }
    @Test
    public void queryAllTaskByProjectForFinish(){
        int yc0001 = projectService.queryAllTaskForProjectByFinish("YC0001");
        System.out.println(yc0001);
    }
}
