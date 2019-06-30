package com.itszt.elec.util;

import com.itszt.elec.Constant;
import com.itszt.elec.domain.ElecPopedom;

import javax.servlet.http.HttpSession;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/22.
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
