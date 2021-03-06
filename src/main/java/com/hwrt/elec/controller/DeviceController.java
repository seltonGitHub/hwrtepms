package com.hwrt.elec.controller;

import com.hwrt.elec.domain.ElecDevicePlan;
import com.hwrt.elec.domain.ElecExportfields;
import com.hwrt.elec.service.bean.DevicePlanField;
import com.hwrt.elec.service.bean.DevicePlanResult;
import com.hwrt.elec.util.DownloadFile;
import com.hwrt.elec.util.PageBean;
import com.hwrt.elec.Constant;
import com.hwrt.elec.service.inters.DevicePlanService;
import com.hwrt.elec.util.DateFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

/**
 */
@Controller
@RequestMapping("device")
public class DeviceController {
    @Autowired
    private DevicePlanService devicePlanService;
    @RequestMapping("DeviceBuyPlan")
    public String goToDeviceBuyPlan(Model model,HttpServletRequest request){
        PageBean<ElecDevicePlan> pageBean = devicePlanService.showPagePlans(request);
        model.addAttribute(PageBean.REQUEST_KEY,pageBean);

        return "/equapment/planIndex";
    }


    @RequestMapping("DeviceBuyPlanEdit")
    public String goToDeviceBuyPlanEdit(Model model,HttpServletRequest request){
        PageBean<ElecDevicePlan> pageBean = devicePlanService.showPagePlans(request);
        model.addAttribute(PageBean.REQUEST_KEY,pageBean);

        return "/equapment/planPage";
    }

    @RequestMapping("searchDevicePlan")
    public String searchDevicePlan(Model model,HttpServletRequest request,String jctId ,String devName ,String planDatef,String planDatet,String devType){
        PageBean<ElecDevicePlan> pageBean = devicePlanService.showConditionPagePlans(request,jctId , devName , planDatef, planDatet, devType);
        model.addAttribute(PageBean.REQUEST_KEY,pageBean);

        return "/equapment/planPage";
    }

    @RequestMapping("DevicePlanImport")
    public String goToDevicePlanImport(){
        return "/equapment/planImport";
    }

    @RequestMapping("downloadPlanExcelModel")
    public void downloadPlanExcelModel(HttpServletRequest request,HttpServletResponse response){
        try {
            DownloadFile.download(request,response, Constant.DEVICE_PLAN_MODEL_PATH,Constant.DEVICE_PLAN_MODEL_NAME+ "-"+DateFormatUtil.formatDateYYYY_MM_DD(new Date())+".xlsx");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("uploadPlanExcel")
    public String uploadPlanExcel(Model model, MultipartFile file){

        if (file!=null&&file.getSize()>0) {

            try {

                DevicePlanResult devicePlanResult = devicePlanService.importDevicePlan(file);

                model.addAttribute("result",devicePlanResult.getResultInfo());

            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("result","上传异常，请重试！");
            }

        }else {
            model.addAttribute("result","文件异常，请检查文件！");
        }


        return "forward:/device/DevicePlanImport.html";
    }

    @RequestMapping("planExport")
    public String goToPlanExport(Model model){
        model.addAttribute("noinitfields", DevicePlanField.getNoInitDevicePlanFileds());
        model.addAttribute("initfields", DevicePlanField.getInitDevicePlanFileds());
        return "/equapment/planExport";
    }


    @RequestMapping("savePlanModel")
    public String savePlanModel(String expNameList, String expFieldName, Model model, HttpSession session){

        ElecExportfields elecExportfields = devicePlanService.saveExportPlan(expFieldName, expNameList);
        if (elecExportfields != null) {
            model.addAttribute("result","保存成功！");
            session.setAttribute(Constant.SEESION_KEY_EXPORT_PLAN_MODEL,elecExportfields);
        }else {
            model.addAttribute("result","保存失败！");

        }

        return "forward:/device/planExport.html";

    }




}
