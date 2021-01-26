package com.MRYIN.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DateController {

    @RequestMapping("/Date/togetStartDate")
    @ResponseBody
    public String toGetDate(String startDate){
        return startDate;
    }

    @RequestMapping("/Date/togetEndDate")
    @ResponseBody
    public Map<String , Object> togetEndDate(String endDate){
        Map<String , Object> result = new HashMap<>();

        if(endDate == null){
            result.put("success",true);
        }
        else{
            result.put("success",false);
        }
        return result ;
    }

//    @RequestMapping("/Date/getDate")
//    public String getDate(){
//
//        return "Home"
//    }
}
