package com.itszt.elec.service.cache;

import com.alibaba.fastjson.JSON;
import com.itszt.elec.domain.ElecUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator--善知  on 2018/5/18.
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
