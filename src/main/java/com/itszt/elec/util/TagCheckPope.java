package com.itszt.elec.util;

import com.itszt.elec.Constant;
import com.itszt.elec.domain.ElecPopedom;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/22.
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
