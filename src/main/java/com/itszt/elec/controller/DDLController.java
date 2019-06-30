package com.itszt.elec.controller;

import com.itszt.elec.Constant;
import com.itszt.elec.domain.ElecSystemddl;
import com.itszt.elec.service.inters.DDLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */

@Controller
@RequestMapping("ddl")

public class DDLController {
    @Autowired
    private DDLService ddlService;
    @RequestMapping("dictionaryIndex")
    public String goToDDLIndex(Model model){
        //查询当前全部的数据字典类别
        List<String> keywords = ddlService.showAllKeywords();
        model.addAttribute("keywords",keywords);
        return "system/dictionaryIndex";
    }
    @RequestMapping("showKeywordDatas")
    public String showKeywordDatas(String keyword,Model model){
        if ("default".equals(keyword)){
            return "system/dictionaryEdit";
        }else {
            List<ElecSystemddl> elecSystemddls = ddlService.showKeywordDatas(keyword);
            model.addAttribute("keywordDatas",elecSystemddls);
        }

        return "system/dictionaryEdit";
    }

    @RequestMapping("changeDatas")
    public String changeDatas(String keywordname,String typeflag,String[] itemname,Model model){
        System.out.println("keywordname = [" + keywordname + "], typeflag = [" + typeflag + "], itemname = [" + Arrays.toString(itemname) + "]");
        boolean success =false;
        if ("new".equals(typeflag)) {
            //完全新增一个类别
            success= ddlService.addKeyword(keywordname, itemname);
        }else {
            //修改一个已存在类别的数据项，删光，再放进去
            ddlService.removeKeyword(keywordname);
            success= ddlService.addKeyword(keywordname,itemname);
        }
        if (success) {
            model.addAttribute(Constant.RQEUEST_ERRORINFO,"设置 "+keywordname+"  数据项成功！！");
            model.addAttribute("keywordNow",keywordname);
            model.addAttribute("keywordDatas",itemname);
        }else {
            model.addAttribute(Constant.RQEUEST_ERRORINFO,"设置 "+keywordname+"  数据项失败，请重试！！");
        }

        return "forward:dictionaryIndex.html";
    }




}
