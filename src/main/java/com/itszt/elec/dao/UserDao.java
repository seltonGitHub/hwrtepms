package com.itszt.elec.dao;

import com.itszt.elec.domain.ElecPopedom;
import com.itszt.elec.domain.ElecRole;
import com.itszt.elec.domain.ElecUser;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/18.
 */
@Repository
public interface UserDao {
    @Select("select * from elec_user where logonName=#{username} and logonPwd=#{userpwd}")
    public ElecUser queryUserByNameAndPass(@Param("username") String username, @Param("userpwd")String userpwd);
    @Select("select * from elec_user")
    public TreeSet<ElecUser> queryAllUsers();
    @Select("SELECT eru.*,er.* FROM elec_role_user eru INNER JOIN elec_role er ON eru.roleID=er.roleID WHERE eru.userID=#{userid}")
    public List<ElecRole> queryUserRoles(String userid) ;


}
