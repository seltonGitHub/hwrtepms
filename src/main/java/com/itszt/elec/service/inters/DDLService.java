package com.itszt.elec.service.inters;

import com.itszt.elec.domain.ElecSystemddl;

import java.util.List;

/**
 * Created by Administrator--善知  on 2018/5/20.
 */
public interface DDLService {

    public List<String> showAllKeywords();

    public List<ElecSystemddl> showKeywordDatas(String keyword);

    public boolean addKeyword(String keyword,String[] keywordDatas);
    public void removeKeyword(String keyword);
}
