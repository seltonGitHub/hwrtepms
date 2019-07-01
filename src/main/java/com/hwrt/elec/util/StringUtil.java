package com.hwrt.elec.util;

import java.util.regex.Pattern;

/**
 */
public class StringUtil {

    public static boolean isNotEmpty(String des){
        return des!=null&&!"".equals(des.trim());
    }

    public static boolean checkStringLength(String des,int minLength,int maxLength){
        if (isNotEmpty(des)) {
           return  des.length()<=maxLength && des.length()>=minLength;
        }

        return false;
    }


    public static boolean checkStringPattern(String des,String pattern){
        if (isNotEmpty(des)) {
            return des.matches(pattern);
        }
        return false;
    }
}
