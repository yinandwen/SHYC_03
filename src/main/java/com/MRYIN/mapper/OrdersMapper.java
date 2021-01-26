package com.MRYIN.mapper;


import com.MRYIN.pojo.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {

    int addOrder(Orders orders);
    int deleteOrderByPO_ID(Integer PO_ID);
    int updateOrder(Orders orders);
    Orders queryOrderByPO_ID(Integer PO_ID);
    List<Orders> queryAllOrders();
    List<Orders> queryAllOrdersByLimit(@Param("page")Integer page , @Param("limit")Integer limit);
    int queryOrderByEchart();
    List<Orders> queryBuSearch(String search);
}
