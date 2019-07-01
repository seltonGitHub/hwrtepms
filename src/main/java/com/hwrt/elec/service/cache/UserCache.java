package com.hwrt.elec.service.cache;

import com.hwrt.elec.domain.ElecUser;
import org.springframework.stereotype.Component;

/**
 */
@Component
public class UserCache  extends CommonCache{


    public void saveUser(String username, String userpwd, ElecUser user){

        setOneBean(user,username,userpwd);
    }

    public ElecUser getUser(String username, String userpwd){

       return getOneBean(ElecUser.class,username,userpwd);

    }

}
