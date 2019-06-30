package com.itszt.elec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */
@RequestMapping("home")
@Controller
public class HomeController {

    @RequestMapping("title")
    public String goToTitle(){
        return "menu/title";
    }
    @RequestMapping("left")
    public String goToLeft(){
        return "menu/left";
    }
    @RequestMapping("change")
    public String goToChage(){
        return "menu/change";
    }
    @RequestMapping("loading")
    public String goToLoading(){
        return "menu/loading";
    }
}
