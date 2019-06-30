package com.itszt.elec.controller;

import com.itszt.elec.domain.ElecFileupload;
import com.itszt.elec.domain.ElecSystemddl;
import com.itszt.elec.service.bean.DataCharUpReuslt;
import com.itszt.elec.service.inters.DataCharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 */
@RequestMapping("dataChart")
@Controller
public class DataChartController {
    @Autowired
    private DataCharService dataCharService;


    @RequestMapping("dataChartIndex")
    public String goToDataChartIndex(Model model){
        List<ElecSystemddl> allProjIDs = dataCharService.showAllProjIDs();
        List<ElecSystemddl> allBelongTos = dataCharService.showAllBelongTos();

        model.addAttribute("allProjIDs",allProjIDs);
        model.addAttribute("allBelongTos",allBelongTos);

        return "dataChart/dataChartIndex";
    }


    @RequestMapping("dataChartAdd")
    public String gotToDataChartAdd(Model model){
        List<ElecSystemddl> allProjIDs = dataCharService.showAllProjIDs();
        List<ElecSystemddl> allBelongTos = dataCharService.showAllBelongTos();

        model.addAttribute("allProjIDs",allProjIDs);
        model.addAttribute("allBelongTos",allBelongTos);

        return "dataChart/dataChartAdd";
    }

    @RequestMapping("doUpload")
    public String doUpload(String projId, String belongTo, MultipartFile[] uploads,String[] comments,Model model){
        DataCharUpReuslt dataCharUpReuslt = dataCharService.uploadFiles(projId, belongTo, uploads, comments);

        model.addAttribute("result",dataCharUpReuslt.getResultInfo());
        return "forward:/dataChart/dataChartAdd.html";
    }


    @RequestMapping("showUploadFiles")
    public String showUploadFiles(String projId,String belongTo,Model model){

        List<ElecFileupload> elecFileuploads = dataCharService.showUploadFiles(projId, belongTo);
        model.addAttribute("files",elecFileuploads);
        return "/dataChart/dataChartAddList";

    }

    @RequestMapping("queryFiles")
    public String queryFiles(@ModelAttribute @RequestParam("projId") String projId,
                             @ModelAttribute  @RequestParam("belongTo") String  belongTo,
                             @ModelAttribute @RequestParam("queryString")  String  queryString, Model model){
        System.out.println("projId = [" + projId + "], belongTo = [" + belongTo + "], queryString = [" + queryString + "], model = [" + model + "]");
        List<ElecFileupload> elecFileuploads = dataCharService.queryFiles(projId, belongTo, queryString);
        model.addAttribute("elecFileuploads",elecFileuploads);
        return "forward:/dataChart/dataChartIndex.html";

    }
}
