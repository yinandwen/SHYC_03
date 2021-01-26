package com.MRYIN.controller;

import com.MRYIN.pojo.Orders;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.OrdersService;
import com.MRYIN.util.DataGridView;
import com.MRYIN.util.DataGruidUtils;
import com.MRYIN.util.ResultObj;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrdersController {

    private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);

    @Resource
    private OrdersService ordersService;


    /*
        增加一个订单
     */

    /*
        ceshi husju
     */
    @RequestMapping("/Orders/ceshi")
    @ResponseBody
    public DataGridView ceshi() {
        return new DataGridView(0, "ceshi", Long.valueOf(1), "hello");
    }

    /*
        ceshi husju
     */
    @RequestMapping("/Orders/ceshi1")
    @ResponseBody
    public ResultObj ceshi1() {

        return new ResultObj(0, "cesh");
        //return ResultObj.ADD_SUCCESS;
    }


    /*
        查询所有订单
     */
    @RequestMapping("/Orders/toQueryOrders")
    public String toQueryOrders() {
        return "Order/OrdersList";
    }

    @RequestMapping("/Orders/QueryOrders")
    @ResponseBody
    public DataGridView queryOrders(@RequestParam("page") Integer page, @RequestParam("limit") Integer pageSize) {
        System.out.println(page);
        System.out.println(pageSize);
        List<Orders> orders = ordersService.queryAllOrders();
        List<Orders> ordersByLimit = ordersService.queryAllOrdersByLimit(page, pageSize);
        logger.info("我是/Orders/QueryOrders");
        logger.info("查询到的所有订单");
        return new DataGridView(0, "尹家浩提醒你：查询成功", (long) orders.size(), ordersByLimit);
    }

    /*
         添加一个订单
     */
    @RequestMapping("/Orders/addOrder")
    @ResponseBody
    public Map<String, Object> addOrder(Orders orders) {
        System.out.println(orders);
        int i = ordersService.addOrder(orders);
        Map<String, Object> result = new HashMap<String, Object>();
        logger.info("我是/Orders/addOrder");
        if (i != 0) {
            result.put("code", "0");
            result.put("msg", "查询成功");
            result.put("data", orders);
        }
        logger.info("添加成功");
        return result;
    }

    /*
         修改一个订单
     */
    @RequestMapping("/Orders/updateOrder")
    @ResponseBody
    public Map<String, Object> updateOrder(Orders orders) {
        System.out.println(orders);
        int i = ordersService.updateOrder(orders);
        System.out.println(i);
        Map<String, Object> result = new HashMap<String, Object>();
        logger.info("我是/Orders/updateOrder");
        if (i != 0) {
            result.put("code", "0");
            result.put("msg", "尹家浩提示您：更新成功");
            result.put("data", orders);
        }
        logger.info("修改成功");
        return result;
    }

    /*
        删除一个订单
     */
    @RequestMapping("/Orders/deleteOrder")
    @ResponseBody
    public Map<String, Object> deleteOrder(Integer PO_ID) {
        System.out.println(PO_ID);
        int i = ordersService.deleteOrderByPO_ID(PO_ID);
        System.out.println(i);
        Map<String, Object> result = new HashMap<String, Object>();
        logger.info("我是/Orders/deleteOrder");
        if (i != 0) {
            result.put("code", "0");
            result.put("msg", "尹家浩提示您：删除成功");
            result.put("data", "");
        }
        logger.info("删除成功");
        return result;
    }


    /*
        折线图
     */
    @RequestMapping("/Orders/Chart/Line")
    @ResponseBody
    public List<Map<String,Object>> chartList3() {
        int i = ordersService.queryOrderByEchart();
        List<Map<String, Object>> ls = new ArrayList<>();
        //每一组数据---一个Map对象
        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name", "真实订单");
        map1.put("value", i);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name", "测试订单1");
        map2.put("value", 12);
        ls.add(map2);
        HashMap<String, Object> map3 = new HashMap<>();
        map3.put("name", "测试订单2");
        map3.put("value", 5);
        ls.add(map3);
        HashMap<String, Object> map4 = new HashMap<>();
        map4.put("name", "测试订单3");
        map4.put("value", 9);
        ls.add(map4);

        HashMap<String, Object> map5 = new HashMap<>();
        map5.put("name", "测试订单4");
        map5.put("value", 4);
        ls.add(map5);
        HashMap<String, Object> map6 = new HashMap<>();
        map6.put("name", "测试订单5");
        map6.put("value", 6);
        ls.add(map6);
        return ls;
    }


    /*
        搜索操作
     */

    @RequestMapping("/Orders/queryBySearch/{search}")
    @ResponseBody
    public DataGridView queryBySearch(@PathVariable String search){
        System.out.println(search); //start=&end=&SearchInput=YC-0001
        String[] split = search.split("&");
        String searchInput = split[split.length-1];
        System.out.println(searchInput);//SearchInput=YC-0001

        String[] split1 = searchInput.split("=");
        String searchInput1 = split1[split1.length - 1];

        if(split1.length == 1){
            return new DataGridView(0,"你输入的为空，请输入关键字来搜索");
        }

        System.out.println(searchInput1); //YC-0001

        List<Orders> orders = ordersService.queryBuSearch(searchInput1);
        return new DataGridView(0,"搜索成功", (long) orders.size(),orders);
    }

}
