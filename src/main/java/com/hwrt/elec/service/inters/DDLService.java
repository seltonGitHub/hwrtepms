package com.hwrt.elec.service.inters;

import com.hwrt.elec.domain.ElecSystemddl;

import java.util.List;

/**
 */
public interface DDLService {

    public List<String> showAllKeywords();

    public List<ElecSystemddl> showKeywordDatas(String keyword);

    public boolean addKeyword(String keyword,String[] keywordDatas);
    public void removeKeyword(String keyword);
}
