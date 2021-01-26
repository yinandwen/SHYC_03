package com.MRYIN.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@NoArgsConstructor
public class DataGridView implements Serializable {
      
      private Integer code = 0;
      private String msg = "";
      private Long count;
      private Object data;
      
      public DataGridView(Object data) {
            this.data = data;
      }

      public DataGridView(Integer code , String msg){
            this.code = code ;
            this.msg = msg ;
      }
      
      public DataGridView(Long count, Object data) {
            this.count = count;
            this.data = data;
      }

      public DataGridView(Integer code , String msg , Object data) {
            this.code = code;
            this.msg = msg;
            this.data = data;
      }

      public DataGridView(Integer code, String msg, Long count, Object data) {
            this.code = code;
            this.msg = msg;
            this.count = count;
            this.data = data;
      }
}