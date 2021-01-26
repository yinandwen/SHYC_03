package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.ProjectOrdersMapper;
import com.MRYIN.pojo.ProjectOrders;
import com.MRYIN.service.ProjectOrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class ProjectOrdersServiceImpl implements ProjectOrdersService {

    @Resource
    private ProjectOrdersMapper projectOrdersMapper ;


    @Override
    public int addProject(ProjectOrders projectOrders) {
        return projectOrdersMapper.addProject(projectOrders);
    }
}
