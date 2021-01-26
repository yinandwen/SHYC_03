package com.MRYIN.websocket.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: Mr.Yin
 * @create: 2021-01-20 21:21
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatInfo {
    /**
     * 响应码
     */
    private Integer code;

    /**
     * 响应消息
     */
    private String msg;
    /**
     * 数据集合：接收mine（我的信息），friend（好友的信息）
     */
    private Map data = new HashMap();

}