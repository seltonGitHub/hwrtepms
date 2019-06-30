package com.itszt.elec.controller.interceptors;

import com.itszt.elec.Constant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */
public class CheckLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        Object attribute = httpServletRequest.getSession().getAttribute(Constant.SEESION_KEY_USERNOW);
        if (attribute!=null) {
            return true;
        }
//        httpServletResponse.sendRedirect("/index.jsp");
        httpServletResponse.getWriter().write("<script>window.top.location.href='/index.jsp'</script>");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
