package com.hwrt.elec.service;

import com.hwrt.elec.dao.PopedomDao;
import com.hwrt.elec.dao.UserDao;
import com.hwrt.elec.domain.ElecPopedom;
import com.hwrt.elec.domain.ElecRole;
import com.hwrt.elec.domain.ElecUser;
import com.hwrt.elec.service.bean.LoginResult;
import com.hwrt.elec.service.inters.UserService;
import com.hwrt.elec.util.MD5Utils;
import com.hwrt.elec.util.StringUtil;
import com.hwrt.elec.service.cache.UserCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.TreeSet;

/**
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserCache userCache;
    @Autowired
    private PopedomDao popedomDao;
    @Override
    public LoginResult doLogin(String username, String userpwd) {
        LoginResult loginResult=new LoginResult();
        //1.判断数据是否合法，即数据验证
        boolean usernameChecked = StringUtil.checkStringPattern(username, "\\w{2,10}");
        boolean userpwdChecked = StringUtil.checkStringPattern(userpwd, "\\w{2,10}");

        if (!(usernameChecked&&userpwdChecked)) {
            loginResult.resultInfo=LoginResult.ERROR_DATA;
            return loginResult;
        }
        //3.先去缓存查询
        String userpwdMD5= MD5Utils.md5(userpwd);
        ElecUser elecUser = userCache.getUser(username,userpwdMD5);
        if (elecUser==null) {
            //4.dao查询
             elecUser = userDao.queryUserByNameAndPass(username, userpwdMD5);
            if (elecUser==null) {
                loginResult.resultInfo=LoginResult.ERROR_ACCOUT_PASSWORD;
                return loginResult;
            }
            //5.dao查询到数据后，放入缓存中
            userCache.saveUser(username,userpwdMD5,elecUser);
        }
        //6.生成结果
        loginResult.success=true;
        loginResult.bean=elecUser;
        return loginResult;
    }

    @Override
    public List<ElecRole> queryUserRoles(String userid) {

        return  userDao.queryUserRoles(userid);
    }
    //查询当前用户的权限
    @Override
    public TreeSet<ElecPopedom> queryUserPopedoms(String userid) {

        List<ElecRole> elecRoles = queryUserRoles(userid);
        TreeSet<ElecPopedom> elecUserPopedoms =new TreeSet<>();
        for (ElecRole elecRole : elecRoles) {
            TreeSet<ElecPopedom> elecPopedoms = popedomDao.queryRolePopedoms(elecRole.getRoleid());
            elecUserPopedoms.addAll(elecPopedoms);
        }
        return elecUserPopedoms;
    }


}
