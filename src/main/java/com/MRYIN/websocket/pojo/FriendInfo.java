package com.MRYIN.websocket.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author: Mr.Yin
 * @create: 2021-01-20 21:21
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FriendInfo {
    //群名
    private String groupname;
    //群id
    private Integer id;
    //list集合接收多个群
    private List<EmpInfo> list;

}