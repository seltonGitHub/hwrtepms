package com.hwrt.elec.service.inters;

import com.hwrt.elec.domain.ElecPopedom;
import com.hwrt.elec.domain.ElecRole;
import com.hwrt.elec.service.bean.LoginResult;

import java.util.List;
import java.util.TreeSet;

/**
 */
public interface UserService {

    public LoginResult doLogin(String username, String userpwd);

    public List<ElecRole> queryUserRoles(String userid);

    public TreeSet<ElecPopedom> queryUserPopedoms(String userid);


}
