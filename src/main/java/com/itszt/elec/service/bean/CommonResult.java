package com.itszt.elec.service.bean;

/**
 * Created by Administrator on 2018/4/4.
 */
public  abstract class CommonResult<E> {

    public boolean success=false;
    public String resultInfo;
    public String redirectUrl;
    public E bean;

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getResultInfo() {
        return resultInfo;
    }

    public void setResultInfo(String resultInfo) {
        this.resultInfo = resultInfo;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public E getBean() {
        return bean;
    }

    public void setBean(E bean) {
        this.bean = bean;
    }
}
