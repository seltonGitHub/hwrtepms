package com.itszt.elec.service;

import com.itszt.elec.dao.DevicePlanDao;
import com.itszt.elec.domain.ElecDevicePlan;
import com.itszt.elec.domain.ElecExportfields;
import com.itszt.elec.service.bean.DevicePlanResult;
import com.itszt.elec.service.inters.DevicePlanService;
import com.itszt.elec.util.PageBean;
import com.itszt.elec.util.PageInfo;
import com.itszt.elec.util.StringUtil;
import com.itszt.elec.util.VerifyDataUtil;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator--善知  on 2018/6/15.
 */
@Service
public class
DevicePlanServiceImpl implements DevicePlanService{
    private Logger logger=Logger.getLogger(DevicePlanServiceImpl.class);
    @Autowired
    private DevicePlanDao devicePlanDao;
    @Override
    public DevicePlanResult importDevicePlan(MultipartFile file) {
        DevicePlanResult devicePlanResult=new DevicePlanResult();
        devicePlanResult.success=true;
        devicePlanResult.resultInfo=DevicePlanResult.IMPORT_SUCCESS;

        try {
            checkExcel(file.getInputStream(),devicePlanResult);
            if (devicePlanResult.success) {
                importExcel(file.getInputStream(),devicePlanResult);
            }
        } catch (IOException e) {
            e.printStackTrace();
            devicePlanResult.success=false;
            devicePlanResult.resultInfo=DevicePlanResult.IMPORT_ERROR;
        }

        return devicePlanResult;
    }

    @Override
    public ElecExportfields saveExportPlan(String dbName, String excelName) {

        try {
            String uuid=System.currentTimeMillis()+"";
            devicePlanDao.insertExportPlan(uuid,dbName,excelName);

            ElecExportfields elecExportfields=new ElecExportfields();
            elecExportfields.setBelongto(uuid);
            elecExportfields.setExpnamelist(excelName);
            elecExportfields.setExpfieldname(dbName);
            return elecExportfields;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Workbook genExportDatas(ElecExportfields elecExportfields) {
        String[] dbNames = elecExportfields.getExpfieldname().split("#");
//        Map<String,String> map=new HashMap<>();
//
//        for (String s : split) {
//            map.put(s,s);
//        }

//
//        List<ElecDevicePlan> elecDevicePlans = devicePlanDao.querAllplans(map);
//        System.out.println("elecDevicePlans = " + elecDevicePlans);

        List<ElecDevicePlan> elecDevicePlans = devicePlanDao.querAllplans2(dbNames);
        //创建工作簿
        XSSFWorkbook workBook = new XSSFWorkbook();
        //创建工作表
        XSSFSheet sheet = workBook.createSheet("设备计划");
        //创建行,第0行
        XSSFRow row = sheet.createRow(0);
        //创建单元格
        String[] excelNames = elecExportfields.getExpnamelist().split("#");
        //标题行
        for (int i = 0; i < excelNames.length; i++) {
            XSSFCell cell = row.createCell(i);
            cell.setCellValue(excelNames[i]);
        }
        //数据行们
        for (int i = 0; i < elecDevicePlans.size(); i++) {

            XSSFRow rowData = sheet.createRow(i+1);
            ElecDevicePlan elecDevicePlan=elecDevicePlans.get(i);

            for (int j = 0; j < excelNames.length; j++) {
                XSSFCell cellData00 = rowData.createCell(j);

                String fieldName = dbNames[j].toLowerCase();

                try {
                    Field declaredField = elecDevicePlan.getClass().getDeclaredField(fieldName);
                    declaredField.setAccessible(true);

                    cellData00.setCellValue(declaredField.get(elecDevicePlan).toString());
                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }

//        FileOutputStream fileOutputStream = new FileOutputStream(new File("C:\\Users\\Administrator\\Desktop\\java-3work\\testpoi\\测试07.xlsx"));
//        workBook.write(fileOutputStream);
//
//        workBook.close();//最后记得关闭工作簿

        return workBook;
    }

    @Override
    public List<ElecDevicePlan> showAllPlans() {
        return devicePlanDao.queryPlansNoFilter();
    }

    @Override
    public PageBean<ElecDevicePlan> showPagePlans(HttpServletRequest request) {
        PageInfo<ElecDevicePlan> planPageInfo=new PageInfo<>(request);

        planPageInfo.setTotalResult(devicePlanDao.queryPlansNoFilterCount());

        int beginResult = planPageInfo.getBeginResult();

        List<ElecDevicePlan> elecDevicePlans = devicePlanDao.queryPlansNoFilterPage(beginResult, PageInfo.PAGE_CAPACITY);

        planPageInfo.setBeans(elecDevicePlans);

        PageBean pageBean = planPageInfo.getPageBean();
        pageBean.setRequestUrl("/device/DeviceBuyPlanEdit.html");

        return  pageBean;
    }

    @Override
    public PageBean<ElecDevicePlan> showConditionPagePlans(HttpServletRequest request, String jctId, String devName, String planDatef, String planDatet, String devType) {



        PageInfo<ElecDevicePlan> planPageInfo=new PageInfo<>(request);

        planPageInfo.setTotalResult(devicePlanDao.queryPlansByConditionCount( jctId , devName , planDatef, planDatet, devType));

        int beginResult = planPageInfo.getBeginResult();

        List<ElecDevicePlan> elecDevicePlans = devicePlanDao.queryPlansByCondition(beginResult, PageInfo.PAGE_CAPACITY, jctId , devName , planDatef, planDatet, devType);

        planPageInfo.setBeans(elecDevicePlans);

        PageBean pageBean = planPageInfo.getPageBean();

        StringBuilder stringBuilder=new StringBuilder("/device/searchDevicePlan.html?");

        if (StringUtil.isNotEmpty(jctId)) {
            stringBuilder.append("jctId=");
            stringBuilder.append(jctId);
            stringBuilder.append("&");
        }
        if (StringUtil.isNotEmpty(devName)) {
            stringBuilder.append("devName=");
            stringBuilder.append(devName);
            stringBuilder.append("&");
        }
        if (StringUtil.isNotEmpty(planDatef)) {
            stringBuilder.append("planDatef=");
            stringBuilder.append(planDatef);
            stringBuilder.append("&");
        }
        if (StringUtil.isNotEmpty(planDatet)) {
            stringBuilder.append("planDatet=");
            stringBuilder.append(planDatet);
            stringBuilder.append("&");
        }
        if (StringUtil.isNotEmpty(devType)) {
            stringBuilder.append("devType=");
            stringBuilder.append(devType);

        }



        pageBean.setRequestUrl(stringBuilder.substring(0,stringBuilder.length()-1));

        return pageBean;
    }

    @Transactional
    private void importExcel(InputStream inputStream, DevicePlanResult devicePlanResult) throws IOException {
            //读取工作簿
            XSSFWorkbook workBook = new XSSFWorkbook(inputStream);
            //读取工作表
            XSSFSheet sheet = workBook.getSheetAt(0);
            //获取总行数
            int rowNum = sheet.getLastRowNum() + 1;


            for (int i = 1; i < rowNum; i++) {
                ElecDevicePlan elecDevicePlan=new ElecDevicePlan();
                //读取行
                XSSFRow row = sheet.getRow(i);
                StringBuilder lineData = new StringBuilder();
                //处理全空行
                for (int m = 0; m < columnCount; m++) {
                    //读取单元格
                    XSSFCell cell = row.getCell(m);
                    if (cell == null) {
                        continue;
                    }
                    cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    String value = cell.getStringCellValue();
                    lineData.append(value);
                }

                if (!StringUtil.isNotEmpty(lineData.toString().trim())) {
                    continue;
                }

                for (int j = 0; j < columnCount; j++) {
                    //读取单元格
                    XSSFCell cell = row.getCell(j);
                    cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    String value = cell.getStringCellValue();

                   switch (j){
                       case 0:
                           elecDevicePlan.setJctid(value);
                           break;
                       case 1:
                           elecDevicePlan.setDevname(value);
                           break;
                       case 2:
                           elecDevicePlan.setSpectype(value);
                           break;
                       case 3:
                           elecDevicePlan.setProducehome(value);
                           break;
                       case 4:
                           elecDevicePlan.setQuality(value);
                           break;
                       case 5:
                           elecDevicePlan.setUseunit(value);
                           break;
                       case 6:
                           elecDevicePlan.setDevexpense(Double.parseDouble(value));
                           break;
                       case 7:
                           elecDevicePlan.setPlandate(value);
                           break;

                   }

                }
                devicePlanDao.insertPlan(elecDevicePlan);
            }

    }

    private void checkExcel(InputStream inputStream, DevicePlanResult devicePlanResult) {

        try {
            //读取工作簿
            XSSFWorkbook workBook = new XSSFWorkbook(inputStream);
            //读取工作表
            XSSFSheet sheet = workBook.getSheetAt(0);
            //获取总行数
            int rowNum = sheet.getLastRowNum()+1;
            //获取总列数
//            int cellNum = sheet.getRow(0).getLastCellNum();

            //做检查title的校验
            StringBuilder errorInfo=new StringBuilder();

            XSSFRow rowTitle = sheet.getRow(0);
            if (rowTitle!=null) {
                for (int j = 0; j < columnCount; j++) {
                    XSSFCell cell = rowTitle.getCell(j);
                    cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    String value = cell.getStringCellValue();
                    boolean checkTitle = checkTitle(value, j);
                    if (!checkTitle) {
                        devicePlanResult.success=false;
                        errorInfo.append(value+" 列位置错误，请重新下载模板<br>");
                    }
                }

            }else {
                errorInfo.append("标题列不存在，请重新下载模板<br>");
                //title列不存在
                devicePlanResult.success=false;
            }



            //    ElecDevicePlan elecDevicePlan=new ElecDevicePlan();
            for (int i = 1; i < rowNum; i++) {
                //读取行
                XSSFRow row = sheet.getRow(i);
                StringBuilder lineData=new StringBuilder();
                //处理全空行
                for (int m = 0; m < columnCount; m++) {
                    //读取单元格
                    XSSFCell cell = row.getCell(m);
                    if (cell==null) {
                        continue;
                    }
                    cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    String value = cell.getStringCellValue();
                    lineData.append(value);
                }

                if (!StringUtil.isNotEmpty(lineData.toString().trim())) {
                    continue;
                }

                for (int j = 0; j < columnCount; j++) {

                    //读取单元格
                    XSSFCell cell = row.getCell(j);
                    if (cell==null) {

                        devicePlanResult.success=false;
                        errorInfo.append(i);
                        errorInfo.append("行的");
                        errorInfo.append(j);
                        errorInfo.append("列的数据格式错误，请检查数据！<br>");
                        continue;
                    }
                    cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    String value = cell.getStringCellValue();
                    logger.error("解析到一个数据："+value);

                    boolean isRight=checkData(value,i,j);
                    if (!isRight) {
                        devicePlanResult.success=false;
                        errorInfo.append(i);
                        errorInfo.append("行的");
                        errorInfo.append(j);
                        errorInfo.append("列的数据格式错误，请检查数据！<br>");
                    }
                }
            }

            if (!devicePlanResult.success){
                devicePlanResult.resultInfo=errorInfo.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
            devicePlanResult.success=false;
            devicePlanResult.resultInfo=DevicePlanResult.IMPORT_ERROR;
        }

    }

    private boolean checkData(String value, int i, int j) {

        if (!StringUtil.isNotEmpty(value)){
            return false;
        }

        if (j==4){
            return VerifyDataUtil.isInt(value);
        }

        if (j==6){
            return VerifyDataUtil.isNumber(value);
        }

        if (j==7){
            return VerifyDataUtil.isFormatDate(value,dateFormat);
        }
        return true;
    }

    private boolean checkTitle(String value,  int j) {

            if (j<titles.length){
                //标题行
                return titles[j].trim().equals(value);
            }
        return false;
    }
}
