package com.hwrt.elec.service.cache;

import com.hwrt.elec.Constant;
import com.hwrt.elec.domain.ElecSystemddl;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 */
@Component
public class DDLCache extends CommonCache {

    //1.类别的keywords   存 取  删
    public void saveAllKeywords(List<String> allkeyWords){
        saveListStrings(allkeyWords, Constant.REDIS_KEY_ALLKEYWORDS);

    }

    public List<String> getAllKeywords(){
        return getListStrings(Constant.REDIS_KEY_ALLKEYWORDS);
    }

    public void deleteAllKeywords(){
        deleteOneData(Constant.REDIS_KEY_ALLKEYWORDS);
    }

    //2.每个keyword 的 数据项    存 取 删

    public void saveKeywordData(String keyword, List<ElecSystemddl> systemddls){
        saveListBeans(systemddls,keyword);

    }
    public List<ElecSystemddl> getKeywordData(String keyword){
       return   getListBeans(ElecSystemddl.class,keyword);
    }

    public void deleteKeywordDatas(String keyword){
        deleteOneData(keyword);
    }





}
