package com.MRYIN.controller;


import com.MRYIN.pojo.Questionlist;
import com.MRYIN.pojo.Task;
import com.MRYIN.service.QuestionlistService;
import com.MRYIN.service.TaskService;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;


@Controller
public class ExcelController {

    private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

    @Resource
    private QuestionlistService questionlistService ;

    @Resource
    private TaskService taskService ;

    @RequestMapping("/Excel/Question")
    public void exportEmpoyeeInfo1(HttpServletResponse response , HttpServletRequest request) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Questionlist> questionlists = questionlistService.AllQuestion();
        System.out.println(questionlists);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("问题描述表");




        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("项目编号");
        titleRow.createCell(1).setCellValue("问题编号");
        titleRow.createCell(2).setCellValue("问题描述");
        titleRow.createCell(4).setCellValue("负责人");
        titleRow.createCell(5).setCellValue("责任部门");
        titleRow.createCell(6).setCellValue("图片补充描述");
        titleRow.createCell(7).setCellValue("备注信息");
        titleRow.createCell(8).setCellValue("状态");
        titleRow.createCell(9).setCellValue("创建时间");
        titleRow.createCell(10).setCellValue("创建人");

        //遍历将数据放到excel列中
        int row1 = 1 ;
        int row2 = 1 ;
        for (Questionlist questionlist : questionlists) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(questionlist.getQS_PRJCode());
            dataRow.createCell(1).setCellValue(questionlist.getQS_QuestionID());
            dataRow.createCell(2).setCellValue(questionlist.getQS_Description());
            dataRow.createCell(4).setCellValue(questionlist.getQS_Responer());
            dataRow.createCell(5).setCellValue(questionlist.getQS_SupportDept());
            dataRow.createCell(7).setCellValue(questionlist.getQS_Note());
            dataRow.createCell(8).setCellValue(questionlist.getQS_OpenClose());
            dataRow.createCell(9).setCellValue(questionlist.getQS_CREATED_TIME());
            dataRow.createCell(10).setCellValue(questionlist.getQS_CREATED_BY());


            FileOutputStream fileOut = null;
            BufferedImage bufferImg = null;
            String[] split = questionlist.getQS_AddressInfo().split(";");
            //先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray
            for (int i = 0; i < split.length; i++) {
                try {
                    ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
                    bufferImg = ImageIO.read(new File(request.getSession().getServletContext().getRealPath("/upload") + "/" + split[i]));
                    ImageIO.write(bufferImg, "jpg", byteArrayOut);

                    //画图的顶级管理器，一个sheet只能获取一个（一定要注意这点）
                    HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
                    //anchor主要用于设置图片的属性
                    HSSFClientAnchor anchor = new HSSFClientAnchor(i*250, 0, (i+1)*250, 250,(short) 6, row1, (short) 6, row2);
                    anchor.setAnchorType(3);
                    //插入图片
                    patriarch.createPicture(anchor, wb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
                } catch (Exception e) {
                    e.printStackTrace();
                }finally{
                    if(fileOut != null){
                        try {
                            fileOut.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            row1 ++ ;
            row2 ++ ;

        }



                  /*   // 设置下载时客户端Excel的名称
             String filename =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + ".xls";
                response.setContentType("application/vnd.ms-excel");
                response.setHeader("Content-disposition", "attachment;filename=" + filename);  */

        // 设置下载时客户端Excel的名称   （上面注释的改进版本，上面的中文不支持）
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("问题描述表".getBytes(), "iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();

        logger.info("Question = > 导出到Excel表中成功");
    }



    private static class MSExcelUtil {
        public static final short EXCEL_COLUMN_WIDTH_FACTOR = 256;
        public static final int UNIT_OFFSET_LENGTH = 7;
        public static final int[] UNIT_OFFSET_MAP = new int[] { 0, 36, 73, 109, 146, 182, 219 };

        /**
         * pixel units to excel width units(units of 1/256th of a character width)
         *
         * @param pxs
         * @return
         */
        public static short pixel2WidthUnits(int pxs) {

            short widthUnits = (short) (EXCEL_COLUMN_WIDTH_FACTOR * (pxs / UNIT_OFFSET_LENGTH));
            widthUnits += UNIT_OFFSET_MAP[(pxs % UNIT_OFFSET_LENGTH)];
            return widthUnits;
        }


        /**
         * excel width units(units of 1/256th of a character width) to pixel units
         *
         * @param widthUnits
         * @return
         */
        public static int widthUnits2Pixel(int widthUnits) {

            int pixels = (widthUnits / EXCEL_COLUMN_WIDTH_FACTOR) * UNIT_OFFSET_LENGTH;
            int offsetWidthUnits = widthUnits % EXCEL_COLUMN_WIDTH_FACTOR;
            pixels += Math.round(offsetWidthUnits
                    / ((float) EXCEL_COLUMN_WIDTH_FACTOR / UNIT_OFFSET_LENGTH));
            return pixels;

        }

    }


    @RequestMapping("/Excel/Task")
    public void exportEmpoyeeInfo2(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Task> tasks = taskService.AllTask();
        System.out.println(tasks);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("任务分配表");

        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("项目编号");
        titleRow.createCell(1).setCellValue("问题编号");
        titleRow.createCell(2).setCellValue("任务编号");
        titleRow.createCell(3).setCellValue("任务名称");
        titleRow.createCell(4).setCellValue("负责的部门");
        titleRow.createCell(5).setCellValue("任务开始时间");
        titleRow.createCell(6).setCellValue("任务结束时间");
        titleRow.createCell(7).setCellValue("任务负责人");
        titleRow.createCell(8).setCellValue("任务内容");
        titleRow.createCell(9).setCellValue("任务状态");
        titleRow.createCell(10).setCellValue("创建人");
        //遍历将数据放到excel9
        for (Task task : tasks) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(task.getTK_PRJCode());
            dataRow.createCell(1).setCellValue(task.getTK_QuestionID());
            dataRow.createCell(2).setCellValue(task.getTK_CODE());
            dataRow.createCell(3).setCellValue(task.getTK_NAME());
            dataRow.createCell(4).setCellValue(task.getTK_Department());
            dataRow.createCell(5).setCellValue(task.getTK_START_DATE());
            dataRow.createCell(6).setCellValue(task.getTK_END_DATE());
            dataRow.createCell(7).setCellValue(task.getTK_RESPONER());
            dataRow.createCell(8).setCellValue(task.getTK_DETAILS());
            dataRow.createCell(9).setCellValue(task.getTK_STATUS());
            dataRow.createCell(10).setCellValue(task.getTK_CREATED_BY());
        }
                  /*   // 设置下载时客户端Excel的名称
             String filename =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + ".xls";
                response.setContentType("application/vnd.ms-excel");
                response.setHeader("Content-disposition", "attachment;filename=" + filename);  */

        // 设置下载时客户端Excel的名称   （上面注释的改进版本，上面的中文不支持）
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("任务分配表".getBytes(), "iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
        logger.info("Task = > 导出到Excel表中成功");
    }

}




