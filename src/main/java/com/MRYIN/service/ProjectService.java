package com.MRYIN.service;

import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Project;
import com.MRYIN.pojo.ProjectOrders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectService {

    int addProject(ProjectOrders projectOrders);

    ProjectOrders queryByPRJ_ID(Integer PRJ_ID);

    int deleteProject(Integer PRJ_ID);

    int updateProject(ProjectOrders projectOrders);

    List<ProjectOrders> queryByOrdersISNULL();

    List<ProjectOrders> treeSearchBySelectOther(String search_3,String search_4);

    List<ProjectOrders> queryAllProjectByLimit(Integer page, Integer limit);

    List<Orders> treeSearchBySelect();

    int queryAllTaskForProject(String PRJ_CODE);

    int queryAllTaskForProjectByFinish(String PRJ_CODE);

}
