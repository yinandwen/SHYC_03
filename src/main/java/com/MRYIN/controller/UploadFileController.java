package com.MRYIN.controller;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UploadFileController {

    private static final Logger logger = LoggerFactory.getLogger(UploadFileController.class);

    @RequestMapping("/UploadFile/toUploadFile")
    public String toUploadFile() {
        return "QuestionListAndTask/upload/uploadFile";
    }

    @ResponseBody
    @RequestMapping(value = "/UploadFile/uploadDocs", produces = "application/json;charset=utf-8")
    public Map<String, Object> uploadDocs(@RequestParam(value = "file") MultipartFile file, HttpServletRequest request) {
        Map<String, Object> uploadData = new HashMap<String, Object>();
//        String uploadDocsPath = "D:\\IDEAProject\\MRYIN\\SHYC_01\\src\\main\\webapp\\upload";
        String uploadDocsPath = request.getSession().getServletContext().getRealPath("/upload");
        String fileName = file.getOriginalFilename();
        File dir = new File(uploadDocsPath, fileName);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        try {
            file.transferTo(dir);
            uploadData.put("code", 0);
            uploadData.put("msg", "上传成功");
            uploadData.put("data", "");
        } catch (IOException e) {
            uploadData.put("code", -1);
            uploadData.put("msg", "上传失败");
            uploadData.put("data", "");
        }
        logger.info("成功上传文件");
        return uploadData;
    }

    @RequestMapping("/UploadFile/toUploadFileByEdit")
    public String toUploadFileByEdit() {
        return "QuestionListAndTask/upload/uploadEdit";
    }

    @RequestMapping("/upload/uploadFile")
    @ResponseBody
    public Map uploadFile(HttpServletRequest request, @Param("file") MultipartFile file) throws IOException {
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map2 = new HashMap<>();
        if (file != null) {
            String webapp = request.getSession().getServletContext().getRealPath("/upload");
            try {
                String substring = file.getOriginalFilename();
                // 图片的路径+文件名称
                String fileName = "/static/upload/" + substring;
                System.out.println(fileName);
                // 图片的在服务器上面的物理路径
                File destFile = new File(webapp, fileName);
                // 生成upload目录
                File parentFile = destFile.getParentFile();
                if (!parentFile.exists()) {
                    parentFile.mkdirs();// 自动生成upload目录
                }
                // 把上传的临时图片，复制到当前项目的webapp路径
                FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(destFile));
                map = new HashMap<>();
                map2 = new HashMap<>();
                map.put("code", 0);//0表示成功，1失败
                map.put("msg", "上传成功");//提示消息
                map.put("data", map2);
                map2.put("src", fileName);//图片url
                map2.put("title", substring);//图片名称，这个会显示在输入框里
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return map;
    }
}
