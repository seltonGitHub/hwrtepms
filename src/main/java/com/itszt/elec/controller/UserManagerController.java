package com.itszt.elec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator--善知  on 2018/5/22.
 */
@Controller
@RequestMapping("UserManager")
public class UserManagerController {


    @RequestMapping("userIndex")
    public String goToUserIndex(){
        return "system/userIndex";
    }


    @RequestMapping("userEdit")
    public String goToUserEdit(){
        return "system/userEdit";
    }

}
