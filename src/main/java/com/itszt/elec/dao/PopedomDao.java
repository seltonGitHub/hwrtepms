package com.itszt.elec.dao;

import com.itszt.elec.domain.ElecPopedom;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.TreeSet;

/**
 */
@Repository
public interface PopedomDao {
    @Select("select * from elec_popedom")
    public TreeSet<ElecPopedom> queryAllPopedoms();

    @Select("SELECT ep.*,erp.* FROM elec_popedom ep  INNER JOIN elec_role_popedom erp ON ep.MID=erp.mid where erp.roleID=#{roleID}")
    public TreeSet<ElecPopedom> queryRolePopedoms(String roleID);
}
