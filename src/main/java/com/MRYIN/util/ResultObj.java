package com.MRYIN.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * ClassName: RestObj
 * date: 2020/4/14 20:04
 *
 * @author TeouBle
 * @author yangbuyi
 * @since JDK 1.8
 * 返回值工具类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultObj  implements Serializable {

    public static final ResultObj IS_LOGIN = new ResultObj(0, "尹家浩提示您：已登陆");
    public static final ResultObj UN_LOGIN = new ResultObj(-1, "尹家浩提示您：未登陆");

    public static final ResultObj Tree_Search_SUCCESS = new ResultObj(0, "尹家浩提示您：查询失败");
    public static final ResultObj Tree_Search_ERROR = new ResultObj(-1, "尹家浩提示您：查询成功");

    public static final ResultObj DELETE_SUCCESS = new ResultObj(0, "尹家浩提示您：删除成功");
    public static final ResultObj DELETE_ERROR = new ResultObj(-1, "尹家浩提示您：删除失败");

    public static final ResultObj ADD_SUCCESS = new ResultObj(0, "尹家浩提示您：添加成功");
    public static final ResultObj ADD_ERROR = new ResultObj(-1, "尹家浩提示您：添加失败");

    public static final ResultObj UPDATE_SUCCESS = new ResultObj(0, "尹家浩提示您：更新成功");
    public static final ResultObj UPDATE_ERROR = new ResultObj(-1, "尹家浩提示您：更新失败");
    public static final ResultObj DISPATCH_SUCCESS = new ResultObj(0, "尹家浩提示您：分配成功");
    public static final ResultObj DISPATCH_ERROR = new ResultObj(-1, "尹家浩提示您：分配失败");
    public static final ResultObj RESET_SUCCESS = new ResultObj(0, "尹家浩提示您：重置成功");
    public static final ResultObj RESET_ERROR = new ResultObj(-1, "尹家浩提示您：重置成功");

    private Integer code = 0;
    private String msg = "";
    /**
     * 返回标识
     */
    private Object token = "";


    public ResultObj(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}