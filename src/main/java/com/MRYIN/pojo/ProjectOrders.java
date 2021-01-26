package com.MRYIN.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectOrders {
    private Integer PO_ID;
    private String PO_CUSTOMER;
    private String PO_FullNameCustomer;
    private String PO_NAME;
    private String PO_PRJCODE;
    private String PO_PROTYPE;
    private String PO_Details;
    private String PO_DeliveyA;
    private String PO_ShipTo;
    private String PO_SALESMAN;
    private String PO_CONTRACT_NO;
    private String PO_During;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date PO_CONTRAC_DATE;
    private String PO_FILLING_DATE;
    private double PO_SUMS;
    private double PO_ARRIVED_SUMS;
    private long PO_PAYMENT_TIMES;
    private long PO_ARRIVED_TIMES;
    private String PO_AREA;
    private double PO_AmountOutTax;
    private String PO_HowToPay;
    private String PO_ClearningForENC;
    private String PO_SeverItem;
    private String PO_Digou;
    private String PO_NOTE;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String PO_ApprovedTime;
    private Integer PO_REVISION;
    private String PO_CREATED_BY;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date PO_CREATED_TIME;
    private String PO_UPDATED_BY;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date PO_UPDATED_TIME;

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
