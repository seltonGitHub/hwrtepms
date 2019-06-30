package com.itszt.elec.dao;

import com.itszt.elec.domain.ElecPopedom;
import com.itszt.elec.domain.ElecRole;
import com.itszt.elec.domain.ElecUser;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.TreeSet;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */
@Repository
public interface RoleDao {

    @Select("select * from elec_role")
    public List<ElecRole> queryAllRoles();

    @Select("SELECT * FROM elec_user user INNER JOIN elec_role_user roleuser ON user.userID= roleuser.userID WHERE roleuser.roleID=#{roleID}")
    public TreeSet<ElecUser> queryRoleUsers(String roleID);

    @Insert("insert into elec_role_user values(#{userid},#{roleID})")
    public void insertRoleUser(@Param("roleID") String roleID, @Param("userid")String userid);

    @Delete("delete from elec_role_user where roleID=#{roleID} and userID=#{userid}")
    public void deleteRoleUser(@Param("roleID") String roleID, @Param("userid")String userid);

    @Delete("delete from elec_role_user where roleID=#{roleID}")
    public void deleteRoleAllUsers(@Param("roleID") String roleID);

    @Delete("delete from elec_role_popedom where roleID=#{roleID}")
    public void deleteRoleAllPopes(@Param("roleID") String roleID);

    @Insert("insert into elec_role_popedom values(#{roleID},#{popeID})")
    public void insertRolePopedom(@Param("roleID") String roleID, @Param("popeID")String popeID);

    @Delete("delete from elec_role_popedom where roleID=#{roleID} and mid=#{popeID}")
    public void deleteRolePopedom(@Param("roleID") String roleID, @Param("popeID")String popeID);


}
