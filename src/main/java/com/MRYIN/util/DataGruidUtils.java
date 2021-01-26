package com.MRYIN.util;

import org.springframework.data.domain.Page;

import java.util.HashMap;

public class DataGruidUtils {

    public static HashMap<String , Object> bulidResult(Page page){
        HashMap<String , Object> result = new HashMap<>();
        result.put("code","0");
        result.put("msg","");
        result.put("number",page.getNumberOfElements());
        result.put("count",page.getTotalElements());
        result.put("data",page.getContent());
        return result ;
    }

}
