package com.hwrt.elec.controller;

import com.hwrt.elec.domain.ElecPopedom;
import com.hwrt.elec.domain.ElecRole;
import com.hwrt.elec.service.bean.LoginResult;
import com.hwrt.elec.Constant;
import com.hwrt.elec.service.inters.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.TreeSet;

/**
 */
@Controller
@RequestMapping("userCenter")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("loginUser")
    public String loginUser(String username, String userpassword, HttpSession session, Model model){

        LoginResult loginResult = userService.doLogin(username, userpassword);


        if (loginResult.success) {

            List<ElecRole> elecRoles = userService.queryUserRoles(loginResult.bean.getUserid());
            TreeSet<ElecPopedom> elecPopedoms = userService.queryUserPopedoms(loginResult.bean.getUserid());

            if (elecRoles==null||elecRoles.size()==0||elecPopedoms==null||elecPopedoms.size()==0) {
                model.addAttribute(Constant.RQEUEST_ERRORINFO,"这个用户未分配角色和权限，请联系管理员");
                return "/menu/index";
            }
            session.setAttribute(Constant.SEESION_KEY_USERNOW,loginResult.bean);
            session.setAttribute(Constant.SEESION_KEY_ROLESNOW,elecRoles);
            session.setAttribute(Constant.SEESION_KEY_POPESNOW,elecPopedoms);

            return "menu/home";
        }else {
            model.addAttribute(Constant.RQEUEST_ERRORINFO,loginResult.resultInfo);
            return "/menu/index";
        }
    }
}
