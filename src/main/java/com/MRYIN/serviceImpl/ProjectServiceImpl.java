package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.ProjectMapper;
import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Project;
import com.MRYIN.pojo.ProjectOrders;
import com.MRYIN.service.ProjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    private ProjectMapper projectMapper ;

    @Override
    public int addProject(ProjectOrders projectOrders) {
        return projectMapper.addProject(projectOrders);
    }

    @Override
    public int updateProject(ProjectOrders projectOrders) {
        return projectMapper.updateProject(projectOrders);
    }

    @Override
    public ProjectOrders queryByPRJ_ID(Integer PRJ_ID) {
        return projectMapper.queryByPRJ_ID(PRJ_ID) ;
    }

    @Override
    public int deleteProject(Integer PRJ_ID) {
        return projectMapper.deleteProject(PRJ_ID);
    }

    @Override
    public List<ProjectOrders> queryByOrdersISNULL() {
        return projectMapper.queryByOrdersISNULL();
    }

    @Override
    public List<ProjectOrders> treeSearchBySelectOther(String search_3 , String search_4) {
        return projectMapper.treeSearchBySelectOther(search_3,search_4);
    }

    @Override
    public List<ProjectOrders> queryAllProjectByLimit(Integer page, Integer limit) {
        if(page == null || page <= 0){
            page = 1;
        }
        if (limit == null || limit <= 0){
            limit = 10;
        }
        Integer start = (page - 1) * limit;

        List<ProjectOrders> list = projectMapper.queryAllProjectByLimit(start,limit);

        return  list;
    }

    @Override
    public List<Orders> treeSearchBySelect() {
        return projectMapper.treeSearchBySelect();
    }

    @Override
    public int queryAllTaskForProject(String PRJ_CODE) {
        return projectMapper.queryAllTaskForProject(PRJ_CODE);
    }

    @Override
    public int queryAllTaskForProjectByFinish(String PRJ_CODE) {
        return projectMapper.queryAllTaskForProjectByFinish(PRJ_CODE);
    }
}
