package com.hwrt.elec.service.inters;

import com.hwrt.elec.domain.ElecPopedom;
import com.hwrt.elec.domain.ElecRole;
import com.hwrt.elec.domain.ElecUser;
import com.hwrt.elec.service.bean.MenuItemBean;

import java.util.List;
import java.util.TreeSet;

/**
 */
public interface RoleService {
    List<ElecRole> showAllRoles();

    TreeSet<ElecPopedom> showAllPopedoms();

    TreeSet<ElecPopedom> showRolePopedoms(String roleID);

    TreeSet<ElecUser> showRoleUsers(String roleID);

    boolean modifyRoleDatas(String roleID,String[] selectoper,String[] selectuser);

    List<MenuItemBean> showLeftMenuBeans(TreeSet<ElecPopedom> elecPopedomsNow);

    void setPopedomUrl(TreeSet<ElecPopedom> elecPopedomsNow,List<ElecRole> elecRoles);

}
