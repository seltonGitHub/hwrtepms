package com.hwrt.elec.dao;

import com.hwrt.elec.domain.ElecFileupload;
import com.hwrt.elec.domain.ElecSystemddl;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 */
@Repository
public interface DataChartDao {


    @Select("select * from elec_systemddl where keyword='所属单位'")
    public List<ElecSystemddl> queryAllProjIDs();
    @Select("select * from elec_systemddl where keyword='图纸类别'")
    public List<ElecSystemddl> queryAllBelongTos();
    @Insert("insert into elec_fileupload values(null,#{projid},#{belongto},#{filename},#{fileurl},#{progresstime},#{isdelete},#{createempid},#{createdate},#{comment})")
    @SelectKey(keyProperty="seqid",keyColumn="SeqID",before=false,resultType=Integer.class,statement="select last_insert_id() ")
    public void insertUpload(ElecFileupload elecFileupload);

    public List<ElecFileupload> queryFilesWithCondition(@Param("projId") String projId, @Param("belongTo")String belongTo);
}
