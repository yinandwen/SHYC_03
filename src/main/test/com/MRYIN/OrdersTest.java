package com.MRYIN;

import com.MRYIN.pojo.Orders;
import com.MRYIN.service.OrdersService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class OrdersTest {

    @Resource
    private OrdersService ordersService ;

    /*
        新建订单
     */
    @Test
    public void addOrderTest(){
        Orders orders = new Orders();
        orders.setPO_CUSTOMER("上汽");
        orders.setPO_FullNameCustomer("上海汽车集团");
        orders.setPO_NAME("订单名称");
        orders.setPO_PRJCODE("YC-0003");
        orders.setPO_PROTYPE("汽车检具");
        orders.setPO_Details("制作内容");
        orders.setPO_ShipTo("交货地址");
        orders.setPO_SALESMAN("销售人员");
        orders.setPO_SUMS(100000);
        orders.setPO_ARRIVED_SUMS(100000);
        orders.setPO_PAYMENT_TIMES(12);
        orders.setPO_ARRIVED_TIMES(8);
        orders.setPO_AmountOutTax(100000);
        orders.setPO_Digou("代购设备");
        orders.setPO_NOTE("订单备注");
        orders.setPO_CREATED_TIME(new Date());
        int i = ordersService.addOrder(orders);
        System.out.println(i);
    }

    /*
        根据PO_ID删除订单
     */
    @Test
    public void deleteOrderByPO_ID(){
        int i = ordersService.deleteOrderByPO_ID(1);
        System.out.println(i);
    }

    /*
        修改订单
     */
    @Test
    public void updateOrderTest(){
        Orders orders = ordersService.queryOrderByPO_ID(6);
        orders.setPO_CUSTOMER("上汽");
        orders.setPO_FullNameCustomer("上海汽车集团");
        orders.setPO_NAME("订单名称");
        orders.setPO_PRJCODE("YC-0006");
        orders.setPO_PROTYPE("汽车检具");
        orders.setPO_Details("制作内容");
        orders.setPO_ShipTo("交货地址");
        orders.setPO_SALESMAN("销售人员");
        orders.setPO_SUMS(12000);
        orders.setPO_ARRIVED_SUMS(12000);
        orders.setPO_PAYMENT_TIMES(12);
        orders.setPO_ARRIVED_TIMES(8);
        orders.setPO_AmountOutTax(10000);
        orders.setPO_Digou("代购设备");
        orders.setPO_NOTE("订单备注");
        orders.setPO_CREATED_TIME(new Date());
        int i = ordersService.updateOrder(orders);
        System.out.println(i);
    }

    /*
        根据PO_ID查询订单
     */
    @Test
    public void queryOrderByPO_IDTest(){
        Orders orders = ordersService.queryOrderByPO_ID(1);
        System.out.println(orders);
    }

    /*
        查询所有订单
     */
    @Test
    public void queryOrdersTest(){
        List<Orders> orders = ordersService.queryAllOrders();
        orders.forEach(order->{
            System.out.println(order);
        });
    }

    /*
        查询所有订单
     */
    /*@Test
    public void queryAllOrdersByLimitTest(){
        List<Orders> orders = ordersService.queryAllOrdersByLimit(10);
        orders.forEach(order->{
            System.out.println(order);
        });
    }*/
}
