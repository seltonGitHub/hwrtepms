package com.hwrt.elec.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 */
public class VerifyDataUtil {

    public static boolean isNumber(String data){
        if (StringUtil.isNotEmpty(data)) {
            return data.matches("[\\d.]+");
        }

        return false;

    }
    public static boolean isInt(String data){
        if (StringUtil.isNotEmpty(data)) {
            return data.matches("[\\d]+");
        }

        return false;
    }

    public static boolean isFormatDate(String dateStr,String format){
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(format);
        try {
            simpleDateFormat.parse(dateStr);
            return true;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }
}
