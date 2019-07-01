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
    public List<ElecRole> showAllRoles();

    public TreeSet<ElecPopedom> showAllPopedoms();

    public TreeSet<ElecPopedom> showRolePopedoms(String roleID);

    public TreeSet<ElecUser> showRoleUsers(String roleID);

    public boolean modifyRoleDatas(String roleID,String[] selectoper,String[] selectuser);

    public List<MenuItemBean> showLeftMenuBeans(TreeSet<ElecPopedom> elecPopedomsNow);

    public void setPopedomUrl(TreeSet<ElecPopedom> elecPopedomsNow,List<ElecRole> elecRoles);

}
