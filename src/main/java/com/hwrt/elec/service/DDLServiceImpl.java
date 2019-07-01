package com.hwrt.elec.service;

import com.hwrt.elec.dao.DDLDao;
import com.hwrt.elec.service.inters.DDLService;
import com.hwrt.elec.domain.ElecSystemddl;
import com.hwrt.elec.service.cache.DDLCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 */
@Service
public class DDLServiceImpl implements DDLService {

    @Autowired
    private DDLDao ddlDao;
    @Autowired
    private DDLCache ddlCache;
    @Override
    public List<String> showAllKeywords() {

        List<String> allKeywords = ddlCache.getAllKeywords();
        if (allKeywords==null||allKeywords.size()<=0) {

            allKeywords=ddlDao.queryAllKeywords();

            if (allKeywords!=null&&allKeywords.size()>0) {
                ddlCache.saveAllKeywords(allKeywords);
            }

        }
        return allKeywords;
    }

    @Override
    public List<ElecSystemddl> showKeywordDatas(String keyword) {
        List<ElecSystemddl> keywordData = ddlCache.getKeywordData(keyword);
        if (keywordData==null||keywordData.size()<=0) {
            keywordData=ddlDao.queryKeywordDatas(keyword);
            if (keywordData!=null) {
                ddlCache.saveKeywordData(keyword,keywordData);
            }
        }
        return keywordData;
    }

    @Override
    public boolean addKeyword(String keyword, String[] keywordDatas) {
        if (keywordDatas==null||keywordDatas.length==0) {
            return false;
        }

        try {
            for (int i = 0; i < keywordDatas.length; i++) {
                String keywordData=keywordDatas[i];
                ddlDao.insertKeywordData(keyword,keywordData,i+1);
            }
            //清除缓存
            ddlCache.deleteKeywordDatas(keyword);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    @Override
    public void removeKeyword(String keyword) {

        ddlDao.deleteKeyword(keyword);
        //清除缓存
        ddlCache.deleteKeywordDatas(keyword);
    }
}
