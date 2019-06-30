package com.itszt.elec.dao;

import com.itszt.elec.domain.ElecSystemddl;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */
@Repository
public interface DDLDao {
    @Select("select distinct keyword from elec_systemddl")
    public List<String> queryAllKeywords();
    @Select("select * from elec_systemddl where keyword=#{keyword}")
    public List<ElecSystemddl> queryKeywordDatas(String keyword);

    @Insert("insert into elec_systemddl(keyword,ddlCode,ddlName) values(#{keyword},#{ddlCode},#{keywordData})")
    public void insertKeywordData(@Param("keyword") String keyword, @Param("keywordData")String keywordData,@Param("ddlCode") Integer ddlCode);

    @Delete("delete from elec_systemddl where keyword=#{keyword}")
    public void deleteKeyword(String keyword);
}
