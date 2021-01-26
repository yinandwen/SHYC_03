package com.MRYIN.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {

  private String ORDER_NAME;
  private Integer PRJ_ID;
  private String PRJ_CODE;
  private String PRJ_DETAILS;
  private String PRJ_MANAGER_ID;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date PRJ_PlanStartDay;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date PRJ_PlanDeliveryDay;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date PRJ_START_DATE;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date PRJ_ReadyGo;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date PRJ_DELIVERY_DATE;
  private String PRJ_SITUATION;
  private Integer PRJ_ALL_TASKS;
  private Integer PRJ_FINISH_TASKS;
  private double PRJ_FINISH_RATE;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private String PRJ_ApprovedTime;
  private Integer PRJ_DrawingCount;
  private Integer PRJ_DrawingCount_Released;
  private Integer PRJ_DrawingCount_Machined;
  private Integer PRJ_DrawingCount_Accepted;
  private Integer PRJ_DrawingCount_BeUsed;
  private Integer PRJ_ModelCount;
  private Integer PRJ_ModelCount_PartAssembled;
  private Integer PRJ_ModelCount_inspected;
  private Integer PRJ_ModelCount_UnitAssembled;
  private Integer PRJ_ModelCount_Setuped;
  private String PRJ_DesignSupervisor;
  private String PRJ_AssemblySupervisor;
  private String PRJ_QualitySupervisor;


}
