package com.hwrt.elec.util;

import com.hwrt.elec.domain.ElecPopedom;
import com.hwrt.elec.Constant;

import javax.servlet.http.HttpSession;
import java.util.TreeSet;

/**
 */
public class CheckPopeUtil {



    public static boolean hasPope(String pope, HttpSession session){
        TreeSet<ElecPopedom> elecPopedoms = (TreeSet<ElecPopedom>) session.getAttribute(Constant.SEESION_KEY_POPESNOW);
        boolean hasPope=false;
        for (ElecPopedom elecPopedom : elecPopedoms) {
            if (pope.equals(elecPopedom.getMid())){
                hasPope=true;
                break;
            }
        }
        return hasPope;
    }
}
