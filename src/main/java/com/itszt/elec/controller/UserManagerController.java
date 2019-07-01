package com.itszt.elec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
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
