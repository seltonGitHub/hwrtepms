package com.itszt.elec.service.inters;

import com.itszt.elec.domain.ElecFileupload;
import com.itszt.elec.domain.ElecSystemddl;
import com.itszt.elec.service.bean.DataCharUpReuslt;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Administrator--善知  on 2018/6/17.
 */
public interface DataCharService {
    //1.列出全部所属单位
    public List<ElecSystemddl> showAllProjIDs();
    //2.列出全部图纸类别
    public List<ElecSystemddl> showAllBelongTos();
    //3.上传文件
    public DataCharUpReuslt uploadFiles(String projId, String belongTo, MultipartFile[] uploads, String[] comments);
    //4.根据条件，展示上传文件
    public List<ElecFileupload> showUploadFiles(String projId,String belongTo);

    public List<ElecFileupload> queryFiles(String projId,String  belongTo,String  queryString);
}
