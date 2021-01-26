package com.MRYIN.serviceImpl;


import com.MRYIN.mapper.OrdersMapper;
import com.MRYIN.pojo.Orders;
import com.MRYIN.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersMapper ordersMapper;


    @Override
    public int addOrder(Orders orders) {
        return ordersMapper.addOrder(orders);
    }

    @Override
    public int deleteOrderByPO_ID(Integer PO_ID) {
        return ordersMapper.deleteOrderByPO_ID(PO_ID);
    }

    @Override
    public int updateOrder(Orders orders) {
        return ordersMapper.updateOrder(orders);
    }

    @Override
    public Orders queryOrderByPO_ID(Integer PO_ID) {
        return ordersMapper.queryOrderByPO_ID(PO_ID);
    }

    @Override
    public List<Orders> queryAllOrders() {
        return ordersMapper.queryAllOrders();
    }

    @Override
    public List<Orders> queryAllOrdersByLimit(Integer page, Integer limit) {
        if(page == null || page <= 0){
            page = 1;
        }
        if (limit == null || limit <= 0){
            limit = 10;
        }
        Integer start = (page - 1) * limit;

        List<Orders> list = ordersMapper.queryAllOrdersByLimit(start,limit);

        return  list;
    }

    @Override
    public int queryOrderByEchart() {
        return ordersMapper.queryOrderByEchart();
    }

    @Override
    public List<Orders> queryBuSearch(String search) {
        return ordersMapper.queryBuSearch(search);
    }
}
