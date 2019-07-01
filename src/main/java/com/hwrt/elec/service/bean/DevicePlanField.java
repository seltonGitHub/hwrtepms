package com.hwrt.elec.service.bean;

import java.util.ArrayList;
import java.util.List;

/**
 */
public class DevicePlanField {
    private String dbName;
    private String excelName;
    private static List<DevicePlanField> devicePlanFieldsAll,devicePlanFieldsInit,devicePlanFieldsNoInit;
    private static String[] dbNames={"JctID","DevName","SpecType","ProduceHome","Quality","UseUnit","DevExpense","PlanDate"};
    private static String[] excelNames={"所属单位code","计划购置设备名称","规格型号","厂家","数量","使用单位","金额","计划时间"};

    private static String[] initdbNames={"JctID","DevName","PlanDate"};
    private static String[] initexcelNames={"所属单位code","计划购置设备名称","计划时间"};

    private static String[] noinitdbNames={"SpecType","ProduceHome","Quality","UseUnit","DevExpense"};
    private static String[] noinitexcelNames={"规格型号","厂家","数量","使用单位","金额"};


    private DevicePlanField(String dbName, String excelName) {
        this.dbName = dbName;
        this.excelName = excelName;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getExcelName() {
        return excelName;
    }

    public void setExcelName(String excelName) {
        this.excelName = excelName;
    }

    public static List<DevicePlanField> getAllDevicePlanFileds(){
        if (devicePlanFieldsAll==null) {
            devicePlanFieldsAll=new ArrayList<>();
            //
            //
            for (int i = 0; i < dbNames.length; i++) {
                DevicePlanField devicePlanField=new DevicePlanField(dbNames[i],excelNames[i]);
                devicePlanFieldsAll.add(devicePlanField);
            }
        }

        return devicePlanFieldsAll;
    }
    public static List<DevicePlanField> getInitDevicePlanFileds(){
        if (devicePlanFieldsInit==null) {
            devicePlanFieldsInit=new ArrayList<>();
            //
            //
            for (int i = 0; i < initdbNames.length; i++) {
                DevicePlanField devicePlanField=new DevicePlanField(initdbNames[i],initexcelNames[i]);
                devicePlanFieldsInit.add(devicePlanField);
            }
        }

        return devicePlanFieldsInit;
    }
    public static List<DevicePlanField> getNoInitDevicePlanFileds(){
        if (devicePlanFieldsNoInit==null) {
            devicePlanFieldsNoInit=new ArrayList<>();
            //
            //
            for (int i = 0; i < noinitdbNames.length; i++) {
                DevicePlanField devicePlanField=new DevicePlanField(noinitdbNames[i],noinitexcelNames[i]);
                devicePlanFieldsNoInit.add(devicePlanField);
            }
        }

        return devicePlanFieldsNoInit;
    }
}
