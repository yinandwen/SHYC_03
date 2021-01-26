package com.MRYIN.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
public class DownLoadFileController {

    private final static Logger logger = LoggerFactory.getLogger(DownLoadFileController.class);

   /* @RequestMapping("/DownLoad/downLoadFile")
    public String download(@RequestParam("fileName") String fileName, HttpServletRequest requset, HttpServletResponse response){
        //fileName是需要下载的文件名字
        response.setContentType("text/html;charset=utf-8");
        try {
            requset.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //输出输出流
        BufferedInputStream bis=null;
        BufferedOutputStream bio=null;

        //获取文件路径
        String ctxPath = requset.getSession().getServletContext().getRealPath("/")+"upload/";
        //文件真是存放地址
        String downloadPath=ctxPath+fileName;
        System.out.println(downloadPath);
        try {
            //获取文件长度
            long fileLength = new File(downloadPath).length();
            //设置返回头
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Length", fileLength+"");
            response.setHeader("Content-disposition", "attachment;filename="+new String(fileName.getBytes(),"iso8859-1"));
            //获取输入输出流
            bis = new BufferedInputStream(new FileInputStream(downloadPath));
            bio = new BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2048];
            int bytesRead;
            while((bytesRead = bis.read(buff, 0, buff.length)) != -1){
                bio.write(buff, 0 , bytesRead );
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            //关闭输入流
            if(bis!=null){
                try {
                    bis.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            //关闭输出流
            if(bio!=null){
                try {
                    bio.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        return "";
    }*/


    @RequestMapping("/DownLoad/toDownLoadFile")
    @ResponseBody
    public Map<String, Object> toDownLoadFile(@RequestParam(value = "filename") String filename) {
        Map<String, Object> uploadData = new HashMap<String, Object>();

        if (filename != null) {
            uploadData.put("code", 0);
            uploadData.put("msg", "上传成功");
            uploadData.put("data", "");
        } else {
            uploadData.put("code", -1);
            uploadData.put("msg", "上传失败");
            uploadData.put("data", "");
        }
        return uploadData;
    }


    @RequestMapping(value = "/DownLoad/downLoadFile", method = RequestMethod.GET)
    public void download(HttpServletRequest request, HttpServletResponse response, String filename) throws IOException {
        //checkPay.apk为需要下载的文件
        //String filename = "checkPay.apk";   //我这里使用的是一个固定的文件，方法可以不用写filename参数
        //获取文件的绝对路径名称，apk为根目录下的一个文件夹，这个只能获取根目录文件夹的绝对路径

        /*String path = "D:\\IDEAProject\\MRYIN\\SHYC_01\\src\\main\\webapp\\upload" + "\\" + filename;*/
        String path = request.getSession().getServletContext().getRealPath("/upload") + "/" + filename;
        System.out.println(path);

        //得到要下载的文件
        File file = new File(path);
        if (!file.exists()) {
            response.setContentType("text/html; charset=UTF-8");//注意text/html，和application/html
            response.getWriter().print("<html><body><script type='text/javascript'>alert('您要下载的资源已被删除！');</script></body></html>");
            response.getWriter().close();
            System.out.println("您要下载的资源已被删除！！");
            return;
        }
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename, "UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        // 读取要下载的文件，保存到文件输入流
        FileInputStream in = new FileInputStream(path);
        // 创建输出流
        OutputStream out = response.getOutputStream();
        // 创建缓冲区
        byte buffer[] = new byte[1024]; // 缓冲区的大小设置是个迷  我也没搞明白
        int len = 0;
        //循环将输入流中的内容读取到缓冲区当中
        while ((len = in.read(buffer)) > 0) {
            out.write(buffer, 0, len);
        }
        //关闭文件输入流
        in.close();
        // 关闭输出流
        out.close();

        logger.info("下载文件成功！");
    }
}
