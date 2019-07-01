package com.hwrt.elec.util;

import com.hwrt.elec.domain.ElecPopedom;
import com.hwrt.elec.Constant;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.TreeSet;

/**
 */
public class TagCheckPope extends SimpleTagSupport {
    private String pope;

    public String getPope() {
        return pope;
    }

    public void setPope(String pope) {
        this.pope = pope;
    }

    @Override
    public void doTag() throws JspException, IOException {
        super.doTag();
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        HttpSession session = requestAttributes.getRequest().getSession();

        TreeSet<ElecPopedom> elecPopedoms = (TreeSet<ElecPopedom>) session.getAttribute(Constant.SEESION_KEY_POPESNOW);
        boolean hasPope=false;
        for (ElecPopedom elecPopedom : elecPopedoms) {
            if (pope.equals(elecPopedom.getMid())){
                hasPope=true;
                break;
            }
        }
        if (hasPope) {
            this.getJspBody().invoke(null);
        }

    }
}
