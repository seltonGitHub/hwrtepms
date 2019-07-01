package com.hwrt.elec.dao;

import com.hwrt.elec.domain.ElecDevicePlan;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 */
@Repository
public interface DevicePlanDao {
    @Insert("insert into elec_device_plan(JctID,DevName,SpecType,ProduceHome,Quality,UseUnit,DevExpense,PlanDate) values" +
            "(#{jctid},#{devname},#{spectype},#{producehome},#{quality},#{useunit},#{devexpense},#{plandate})")
    public void insertPlan(ElecDevicePlan elecDevicePlan);

    @Insert("insert into elec_exportfields(belongTo,expNameList,expFieldName) values(#{uuid},#{excelName},#{dbName})")
    public void insertExportPlan(@Param("uuid") String uuid,@Param("dbName")  String dbName, @Param("excelName") String excelName);

    @Select("select * from elec_device_plan")
    public List<ElecDevicePlan> queryPlansNoFilter();

    @Select("select * from elec_device_plan limit #{start},#{num}")
    public List<ElecDevicePlan> queryPlansNoFilterPage(@Param("start")int start,@Param("num")int num);
    @Select("select count(*) from elec_device_plan")
    public Integer queryPlansNoFilterCount();

    public List<ElecDevicePlan> querAllplans( Map<String,String> dbNames);

    public List<ElecDevicePlan> querAllplans2( @Param("dbNames") String[] dbNames);


    public List<ElecDevicePlan> queryPlansByCondition(@Param("start")int start,@Param("num") int num,@Param("jctId") String jctId,
                                                      @Param("devName")String devName,
                                                      @Param("planDatef") String planDatef,
                                                      @Param("planDatet") String planDatet,
                                                      @Param("devType") String devType);

    public Integer queryPlansByConditionCount(@Param("jctId") String jctId,
                                                      @Param("devName")String devName,
                                                      @Param("planDatef") String planDatef,
                                                      @Param("planDatet") String planDatet,
                                                      @Param("devType") String devType);
}
