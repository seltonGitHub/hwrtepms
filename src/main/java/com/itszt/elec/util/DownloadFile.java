package com.itszt.elec.util;

import org.apache.poi.ss.usermodel.Workbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by Administrator--善知  on 2018/6/16.
 */
public class DownloadFile {

    public static void download(HttpServletRequest request, HttpServletResponse response,String filePath,String fileName) throws IOException {
        //找到指定文件
        //动态获取当前发布工程的根目录
         filePath=request.getServletContext().getRealPath(filePath);
        //设置一下响应
        response.setCharacterEncoding("UTF-8");

        //处理文件名的中文

        String userAgent = request.getHeader("User-Agent");
        //针对IE或者以IE为内核的浏览器：
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } else {
            //非IE浏览器的处理：
            fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        }


        //设置为附件类型,文件名为hehe.jpg
        response.setHeader("content-disposition", "attachment;filename="+fileName);

        //写出文件

        FileInputStream fileInputStream=new FileInputStream(filePath);
        ServletOutputStream outputStream = response.getOutputStream();

        int total=-1;
        byte[] bytes=new byte[1024*100];

        while ((total=fileInputStream.read(bytes))!=-1){
            outputStream.write(bytes,0,total);
        }

        fileInputStream.close();

    }


    public static void downloadExcel(HttpServletRequest request, HttpServletResponse response, Workbook workbook, String fileName) throws IOException {
        //设置一下响应
        response.setCharacterEncoding("UTF-8");

        //处理文件名的中文

        String userAgent = request.getHeader("User-Agent");
        //针对IE或者以IE为内核的浏览器：
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } else {
            //非IE浏览器的处理：
            fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        }


        //设置为附件类型,文件名为hehe.jpg
        response.setHeader("content-disposition", "attachment;filename="+fileName);

        //写出文件

        workbook.write(response.getOutputStream());
        workbook.close();
    }
}
