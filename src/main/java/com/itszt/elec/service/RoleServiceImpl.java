package com.itszt.elec.service;

import com.itszt.elec.Constant;
import com.itszt.elec.dao.PopedomDao;
import com.itszt.elec.dao.RoleDao;
import com.itszt.elec.dao.UserDao;
import com.itszt.elec.domain.ElecPopedom;
import com.itszt.elec.domain.ElecRole;
import com.itszt.elec.domain.ElecUser;
import com.itszt.elec.service.bean.MenuItemBean;
import com.itszt.elec.service.inters.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PopedomDao popedomDao;
    @Autowired
    private UserDao userDao;


    @Override
    public List<ElecRole> showAllRoles() {
        return roleDao.queryAllRoles();
    }

    @Override
    public TreeSet<ElecPopedom> showAllPopedoms() {
        return popedomDao.queryAllPopedoms();
    }

    @Override
    public TreeSet<ElecPopedom> showRolePopedoms(String roleID) {
        //全部的权限
        TreeSet<ElecPopedom> elecPopedomsAll = popedomDao.queryAllPopedoms();

        //当前角色的权限
        TreeSet<ElecPopedom> elecPopedomsRole = popedomDao.queryRolePopedoms(roleID);
        for (ElecPopedom elecPopedom : elecPopedomsRole) {
            elecPopedom.setIsChecked(true);
        }

        //我们需要把当前角色的权限，整合到全部权限当中，让他们处于选中状态

//        for (ElecPopedom elecPopedom : elecPopedomsAll) {
//
//            for (ElecPopedom popedom : elecPopedomsRole) {
//                if (elecPopedom.equals(popedom)){
//                    elecPopedom.setChecked(true);
//                }
//            }
//        }

        //从全部当中，去掉重复项  去掉是一堆checked=false的东西
        elecPopedomsAll.removeAll(elecPopedomsRole);
        //把选中的东西再加回去，加回来的是checked=true的东西
        elecPopedomsAll.addAll(elecPopedomsRole);
        return elecPopedomsAll;
    }

    @Override
    public TreeSet<ElecUser> showRoleUsers(String roleID) {
        //全部的用户
        TreeSet<ElecUser> elecUsersAll = userDao.queryAllUsers();
        //当前角色的用户
        TreeSet<ElecUser> elecUsersRole = roleDao.queryRoleUsers(roleID);

        for (ElecUser elecUser : elecUsersRole) {

            elecUser.setChecked(true);
        }

        elecUsersAll.removeAll(elecUsersRole);

        elecUsersAll.addAll(elecUsersRole);

        return elecUsersAll;
    }
    /*
        roleID:当前发送变化的角色
         selectoper: 当前角色选中的权限
         selectuser:当前角色选中的用户

         找出新增了哪些,insert
         找出取消勾选了哪些，delete
     */
    @Override
    public boolean modifyRoleDatas(String roleID, String[] selectoper, String[] selectuser) {

       boolean popeSuccess= changeRolePopedoms(roleID,selectoper);
       boolean userSuccess= changeRoleUsers(roleID,selectuser);

        return popeSuccess&&userSuccess;
    }

    @Override
    public List<MenuItemBean> showLeftMenuBeans(TreeSet<ElecPopedom> elecPopedomsNow) {

        List<MenuItemBean> parentBeans=new ArrayList<>();

        MenuItemBean menuItemParent =null;
        for (ElecPopedom elecPopedom : elecPopedomsNow) {
            if (!elecPopedom.getIsmenu()){
                continue;
            }


            if (elecPopedom.getIsparent()) {
                //找见一个父
                 menuItemParent = genMenuItemBean(elecPopedom);
                 parentBeans.add(menuItemParent);
            }else {
                //找见一个子元素
                MenuItemBean menuItemChild = genMenuItemBean(elecPopedom);
                menuItemParent.getNodes().add(menuItemChild);
            }

        }
        return parentBeans;
    }

    @Override
    public void setPopedomUrl(TreeSet<ElecPopedom> elecPopedomsNow, List<ElecRole> elecRoles) {

        //1.找到众多角色中的最高角色
        ElecRole elecRoleHigh = null;

        for (ElecRole elecRole : elecRoles) {
            if (elecRoleHigh == null) {
                elecRoleHigh = elecRole;
            } else if (Integer.parseInt(elecRole.getRoleid()) < Integer.parseInt(elecRoleHigh.getRoleid())) {
                elecRoleHigh = elecRole;
            }
        }
        //2.根据最高角色设置权限的URL

        switch (elecRoleHigh.getRoleid()) {
            case "2":

                break;
            case "3":

                break;
            case "4":
                setUrlLeavel4(elecPopedomsNow);
                break;
            case "5":
                setUrlLeavel5(elecPopedomsNow);
                break;
            case "6":
                setUrlLeavel6(elecPopedomsNow);
                break;
        }


    }

    private void setUrlLeavel4(TreeSet<ElecPopedom> elecPopedoms) {
        for (ElecPopedom elecPopedom : elecPopedoms) {
            if ("an".equals(elecPopedom.getMid())){
                //找到了用户管理这个权限
                elecPopedom.setUrl(Constant.POPEDOM_URL_USERMANAGE_4);
            }
        }

    }
    private void setUrlLeavel5(TreeSet<ElecPopedom> elecPopedoms) {
        for (ElecPopedom elecPopedom : elecPopedoms) {
            if ("an".equals(elecPopedom.getMid())){
                //找到了用户管理这个权限
                elecPopedom.setUrl(Constant.POPEDOM_URL_USERMANAGE_5);
            }
        }

    }
    private void setUrlLeavel6(TreeSet<ElecPopedom> elecPopedoms) {
        for (ElecPopedom elecPopedom : elecPopedoms) {
            if ("an".equals(elecPopedom.getMid())){
                //找到了用户管理这个权限
                elecPopedom.setUrl(Constant.POPEDOM_URL_USERMANAGE_6);
            }
        }

    }

    // 一个权限，对应一个menuItem
    private MenuItemBean genMenuItemBean(ElecPopedom elecPopedom) {

        MenuItemBean menuItemBean=new MenuItemBean();
        menuItemBean.setMid(elecPopedom.getMid());
        menuItemBean.setPid(elecPopedom.getPid());
        menuItemBean.setIcon(elecPopedom.getIcon());
        menuItemBean.setName(elecPopedom.getName());
        menuItemBean.setTarget(elecPopedom.getTarget());
        menuItemBean.setIsParent(elecPopedom.getIsparent());
        menuItemBean.setUrl(elecPopedom.getUrl());
        menuItemBean.setNodes(new ArrayList<MenuItemBean>());
        return menuItemBean;
    }


    private boolean changeRoleUsers(String roleID, String[] selectuser) {

        if (selectuser==null) {
            //移除当前角色全部用户
            roleDao.deleteRoleAllUsers(roleID);
            return true;
        }
        //原来当前角色的用户
        TreeSet<ElecUser> elecUsersOrigin = roleDao.queryRoleUsers(roleID);
        //要新增的
        TreeSet<ElecUser> elecUsersAdd = new TreeSet<>();
        //要删除的
        TreeSet<ElecUser> elecUsersDel = new TreeSet<>();

        List<String> selectuserIDs = Arrays.asList(selectuser);

        //确定要移除的东西
        for (ElecUser elecUser : elecUsersOrigin) {
            //原来有，现在没有
            if (!selectuserIDs.contains(elecUser.getUserid())) {
                elecUsersDel.add(elecUser);
            }
        }
        //确定要新增的东西

        for (String uid : selectuser) {
            ElecUser elecUserTemp=new ElecUser();
            elecUserTemp.setUserid(uid);
            //现在有，原来没有
            if (!elecUsersOrigin.contains(elecUserTemp)){
                elecUsersAdd.add(elecUserTemp);
            }
        }

        //最后的dao操作
        for (ElecUser elecUser : elecUsersAdd) {
            roleDao.insertRoleUser(roleID,elecUser.getUserid());
        }

        for (ElecUser elecUser : elecUsersDel) {
            roleDao.deleteRoleUser(roleID,elecUser.getUserid());
        }
        return true;
    }

    private boolean changeRolePopedoms(String roleID, String[] selectoper) {
        if (selectoper==null) {
            //移除当前角色全部权限
            roleDao.deleteRoleAllPopes(roleID);
            return true;
        }

        //原来当前角色的权限
        TreeSet<ElecPopedom> elecPopedomsOrigin = popedomDao.queryRolePopedoms(roleID);
        //要新增的
        TreeSet<ElecPopedom> elecPopesAdd = new TreeSet<>();
        //要删除的
        TreeSet<ElecPopedom> elecPopesDel = new TreeSet<>();



        List<String> selectPopeIDs = Arrays.asList(selectoper);

        //确定要移除的东西
        for (ElecPopedom elecPopedom : elecPopedomsOrigin) {
            //原来有，现在没有
            if (!selectPopeIDs.contains(elecPopedom.getMid())) {
                elecPopesDel.add(elecPopedom);
            }
        }
        //确定要新增的东西

        for (String mid : selectoper) {
            ElecPopedom elecPopedomTemp=new ElecPopedom();
            elecPopedomTemp.setMid(mid);

            //现在有，原来没有
            if (!elecPopedomsOrigin.contains(elecPopedomTemp)){
                elecPopesAdd.add(elecPopedomTemp);
            }
        }

        //最后的dao操作
        for (ElecPopedom elecPopedom : elecPopesAdd) {
            roleDao.insertRolePopedom(roleID,elecPopedom.getMid());
        }

        for (ElecPopedom elecPopedom : elecPopesDel) {
            roleDao.deleteRolePopedom(roleID,elecPopedom.getMid());
        }

        return true;
    }


}
