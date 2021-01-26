package com.MRYIN.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionAndTask {
    private Integer QS_ID;
    private String QS_PRJCode;
    private String QS_QuestionID;
    private String QS_TaskType;
    private String QS_TaskCode;
    private String QS_SonTaskCode;
    private String QS_QuestionType;
    private String QS_Description;
    private Integer QS_DelayTime;
    private String QS_Responer;
    private String QS_ActionType;
    private String QS_Action;
    private String QS_SupportDept;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date QS_NewPlan;
    private Integer QS_OpenClose;
    private String QS_ReasonType;
    private String QS_Reason;
    private String QS_ApprovedInfo;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String QS_ApprovedTime;
    private String QS_Approved_BY;
    private String QS_Advice;
    private String QS_Note;
    private String QS_AddressInfo;
    private String QS_Advice_BY;
    private Integer QS_REVISION;
    private String QS_CREATED_BY;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String QS_CREATED_TIME;
    private String QS_UPDATED_BY;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String QS_UPDATED_TIME;

    private Integer TK_ID;
    private String TK_PRJCode;
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
    private Date TK_ACTUAL_STARTDAY;
    private Date TK_ACTUAL_ENDDAY;
    private Integer TK_ALL_SUNTK;
    private Integer TK_FINISH_SUNTK;
    private double TK_PROGRESS;
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
