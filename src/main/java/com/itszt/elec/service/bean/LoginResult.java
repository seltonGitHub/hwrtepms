package com.itszt.elec.service.bean;

import com.itszt.elec.domain.ElecUser;

/**
 * Created by Administrator--善知  on 2018/5/18.
 */
public class LoginResult extends CommonResult<ElecUser>{

    public static final String ERROR_ACCOUT_PASSWORD="用户名密码错误！";
    public static final String ERROR_OTHER="登录异常！";
    public static final String ERROR_DATA="提交数据异常，检查你填写的东西！";
}
