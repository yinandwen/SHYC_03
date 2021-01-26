package com.MRYIN.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: Mr.Yin
 * @create: 2021-01-20 20:41
 **/
@Controller
public class WebSocketController {

    @RequestMapping("/WebSocket/toWebSocket")
    public String toWebSocket(){
        return "/WebSocket/WeChat";
    }
}