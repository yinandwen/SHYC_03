package com.MRYIN.mapper;

import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Project;
import com.MRYIN.pojo.ProjectOrders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {

    int addProject(ProjectOrders projectOrders);

    ProjectOrders queryByPRJ_ID(Integer PRJ_ID);

    int deleteProject(Integer PRJ_ID);

    int updateProject(ProjectOrders projectOrders);

    //查询所有未立项的订单，就是订单中的项目号为null
    List<ProjectOrders> queryByOrdersISNULL();

    //查询所有其他（出去待立项）状态的项目。和项目编号、项目经理、销售人员、客户名称、订单编号。
    List<ProjectOrders> treeSearchBySelectOther(@Param("search_3") String search_3,@Param("search_4")String search_4);

    List<ProjectOrders> queryAllProjectByLimit(@Param("page")Integer page, @Param("limit") Integer limit);

    List<Orders> treeSearchBySelect();

    //查询该项目的所有任务
    int queryAllTaskForProject(String PRJ_CODE);

    //查询该任务的所有任务的完成个数
    int queryAllTaskForProjectByFinish(String PRJ_CODE);

}
