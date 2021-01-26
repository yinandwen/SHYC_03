package com.MRYIN.websocket.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: Mr.Yin
 * @create: 2021-01-20 21:21
 *
 *  *  /群组列表信息
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupInfo {
    //群id(部门id)
    private Integer id;
    //群名
    private String groupname;
    //群头像
    private String avatar;

}