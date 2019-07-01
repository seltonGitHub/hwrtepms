package com.hwrt.elec.service.inters;

import com.hwrt.elec.domain.ElecDevicePlan;
import com.hwrt.elec.domain.ElecExportfields;
import com.hwrt.elec.service.bean.DevicePlanResult;
import com.hwrt.elec.util.PageBean;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 */
public interface DevicePlanService {


    public String[] titles={"所属单位", "设备名称","规格型号","厂家","数量", "使用单位", "金额" ,"计划时间" };
    public String dateFormat="yyyy-MM-dd";
    public int columnCount=8;
    //1.处理导入
    public DevicePlanResult importDevicePlan(MultipartFile file);

    //2.存储当前的导出模板
    public ElecExportfields saveExportPlan(String dbName, String excelName);
    //3.生成导出数据
    public Workbook genExportDatas(ElecExportfields elecExportfields);

    //4.展现全部输
    public List<ElecDevicePlan> showAllPlans();
    //5.展现某个页面数据
    public PageBean<ElecDevicePlan> showPagePlans(HttpServletRequest request);

    //6.根据约束条件，展现某个页面数据
    public PageBean<ElecDevicePlan> showConditionPagePlans(HttpServletRequest request,String jctId ,String devName ,String planDatef,String planDatet,String devType);
}
