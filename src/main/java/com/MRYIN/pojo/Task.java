package com.MRYIN.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Task {

  private Integer TK_ID;
  private String TK_PRJCode;
  private String TK_PRJName;
  private String TK_QuestionID;
  private String TK_TaskType;
  private String TK_CODE;
  private String TK_SONCODE;
  private String TK_NAME;
  private String TK_Department ;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_START_DATE;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_END_DATE;
  private String TK_PreTask;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_ReckonSDay1;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_ReckonFDay1;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_ReckonSDay2;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_ReckonFDay2;
  private String TK_RESPONER;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_ACTUAL_STARTDAY;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date TK_ACTUAL_ENDDAY;
  private Integer TK_ALL_SUNTK;
  private Integer TK_FINISH_SUNTK;
  private String TK_PROGRESS;
  private Integer TK_STATUS;
  private String TK_DETAILS;
  private Integer TK_REVISION;
  private String TK_CREATED_BY;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private String TK_CREATED_TIME;
  private String TK_UPDATED_BY;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private String TK_UPDATED_TIME;

}
