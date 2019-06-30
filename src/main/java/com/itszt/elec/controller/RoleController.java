package com.itszt.elec.controller;

import com.itszt.elec.Constant;
import com.itszt.elec.domain.ElecPopedom;
import com.itszt.elec.domain.ElecRole;
import com.itszt.elec.domain.ElecUser;
import com.itszt.elec.service.bean.MenuItemBean;
import com.itszt.elec.service.inters.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.TreeSet;

/**
 */
@Controller
@RequestMapping("role")

public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("roleIndex")
    public String goToRoleIndex(Model model){
        TreeSet<ElecPopedom> elecPopedoms = roleService.showAllPopedoms();
        List<ElecRole> elecRoles = roleService.showAllRoles();

        model.addAttribute("allPopedoms",elecPopedoms);
        model.addAttribute("allRoles",elecRoles);
        return "system/roleIndex";
    }

    @RequestMapping("roleEdit")
    public String goToRoleEdit(){
        return "system/roleEdit";
    }


    @RequestMapping("showRolePopedoms")
    public String showRolePopedoms(String roleID,Model model){
        TreeSet<ElecPopedom> elecPopedoms = roleService.showRolePopedoms(roleID);
        TreeSet<ElecUser> roleUsers = roleService.showRoleUsers(roleID);
        model.addAttribute("rolePopedoms",elecPopedoms);
        model.addAttribute("roleUsers",roleUsers);

        return "forward:roleEdit.html";
    }


    @RequestMapping("modifyRole")
    public String modifyRole(String roleID,String[] selectoper,String[] selectuser,Model model){

        boolean b = roleService.modifyRoleDatas(roleID, selectoper, selectuser);

        if (b) {
            model.addAttribute("errorInfo","保存成功！");
        }else {
            model.addAttribute("errorInfo","保存失败！");
        }
        return "forward:roleIndex.html";

    }

    @RequestMapping("showLeftMenus")
    @ResponseBody
    public List<MenuItemBean> showLeftMenus(HttpSession httpSession){
        TreeSet<ElecPopedom> elecPopedoms= (TreeSet<ElecPopedom>) httpSession.getAttribute(Constant.SEESION_KEY_POPESNOW);
        List<ElecRole> elecRoles = (List<ElecRole>) httpSession.getAttribute(Constant.SEESION_KEY_ROLESNOW);

        roleService.setPopedomUrl(elecPopedoms,elecRoles);
        List<MenuItemBean> menuItemBeans = roleService.showLeftMenuBeans(elecPopedoms);
        return  menuItemBeans;
    }


}
