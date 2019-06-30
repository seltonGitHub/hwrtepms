package com.itszt.elec.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator--善知  on 2018/6/17.
 */
public class UploadFile {

    public static final String HDFS_PATH="C:\\Users\\Administrator\\Desktop\\java-3work\\hdfs";

    public static boolean uploadFile(String dir,  MultipartFile multipartFile){

        File dirFile=new File(HDFS_PATH+"/"+dir);
        if (!dirFile.exists()) {
            dirFile.mkdirs();

        }

        File file=new File(dirFile,multipartFile.getOriginalFilename());
        try {
            file.createNewFile();
            multipartFile.transferTo(file);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }
}
