package com.MRYIN.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {

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
}
