package com.itszt.elec.service.inters;

import com.itszt.elec.domain.ElecPopedom;
import com.itszt.elec.domain.ElecRole;
import com.itszt.elec.domain.ElecUser;
import com.itszt.elec.service.bean.MenuItemBean;

import java.util.List;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/20.
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
