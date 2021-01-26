package com.MRYIN.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: Mr.Yin
 * @create: 2021-01-20 09:02
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditorResult {
    private int errno;
    private String[] data;

}