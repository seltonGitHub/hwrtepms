package com.itszt.elec.service.inters;

import com.itszt.elec.domain.ElecPopedom;
import com.itszt.elec.domain.ElecRole;
import com.itszt.elec.service.bean.LoginResult;

import java.util.List;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/18.
 */
public interface UserService {

    public LoginResult doLogin(String username, String userpwd);

    public List<ElecRole> queryUserRoles(String userid);

    public TreeSet<ElecPopedom> queryUserPopedoms(String userid);


}
