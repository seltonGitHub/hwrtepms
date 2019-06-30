package com.itszt.elec.service;

import com.itszt.elec.Constant;
import com.itszt.elec.dao.DataChartDao;
import com.itszt.elec.domain.ElecFileupload;
import com.itszt.elec.domain.ElecSystemddl;
import com.itszt.elec.service.bean.DataCharUpReuslt;
import com.itszt.elec.service.inters.DataCharService;
import com.itszt.elec.util.DateFormatUtil;
import com.itszt.elec.util.StringUtil;
import com.itszt.elec.util.UploadFile;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator--善知  on 2018/6/17.
 */
@Service
public class DataCharServiceImpl implements DataCharService {
    @Autowired
    private DataChartDao dataChartDao;
    @Autowired
    private HttpSolrServer solrServer;

    @Override
    public List<ElecSystemddl> showAllProjIDs() {
        return dataChartDao.queryAllProjIDs();
    }

    @Override
    public List<ElecSystemddl> showAllBelongTos() {
        return dataChartDao.queryAllBelongTos();
    }

    public DataCharUpReuslt uploadFiles(String projId, String belongTo, MultipartFile[] uploads, String[] comments) {
        String dirPath = projId + "/" + belongTo;
        DataCharUpReuslt dataCharUpReuslt = new DataCharUpReuslt();
        dataCharUpReuslt.success = true;
        dataCharUpReuslt.resultInfo = DataCharUpReuslt.OK;

        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < uploads.length; i++) {
            MultipartFile file = uploads[i];
            boolean b = UploadFile.uploadFile(dirPath, file);
            if (!b) {
                stringBuilder.append(file.getOriginalFilename() + " 上传失败！请重试！<br>");
                dataCharUpReuslt.success = false;
            } else {
                //上传成功，入库
                String comment = comments[i];
                ElecFileupload elecFileupload = saveDB(dirPath, projId, belongTo, comment, file);

                if (elecFileupload == null) {
                    stringBuilder.append(file.getOriginalFilename() + " 上传失败！请重试！<br>");
                    dataCharUpReuslt.success = false;

                } else {
                    //提交solr
                    boolean solrSuccess = saveSolr(elecFileupload);
                    if (!solrSuccess) {
                        stringBuilder.append(file.getOriginalFilename() + " 上传失败！请重试！<br>");
                        dataCharUpReuslt.success = false;
                    }
                }

            }
        }
        if (!dataCharUpReuslt.success) {
            dataCharUpReuslt.resultInfo = stringBuilder.toString();

        }

        return dataCharUpReuslt;


    }

    private boolean saveSolr(ElecFileupload elecFileupload) {
        try {
            SolrInputDocument document = new SolrInputDocument();
            document.addField(Constant.SOLR_FILE_ID, elecFileupload.getSeqid());
            document.addField(Constant.SOLR_FILE_elecProjID, elecFileupload.getProjid());
            document.addField(Constant.SOLR_FILE_elecBelongTo, elecFileupload.getBelongto());
            document.addField(Constant.SOLR_FILE_elecFileName, elecFileupload.getFilename());
            document.addField(Constant.SOLR_FILE_elecFileURL, elecFileupload.getFileurl());
            document.addField(Constant.SOLR_FILE_elecProgressTime, elecFileupload.getProgresstime());
            document.addField(Constant.SOLR_FILE_elecIsDelete, elecFileupload.getIsdelete());
            document.addField(Constant.SOLR_FILE_elecCreateEmpID, elecFileupload.getCreateempid());
            document.addField(Constant.SOLR_FILE_elecCreateDate, elecFileupload.getCreatedate());
            document.addField(Constant.SOLR_FILE_eleccomment, elecFileupload.getComment());

            solrServer.add(document);
            solrServer.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    private ElecFileupload saveDB(String dirPath, String projId, String belongTo, String comment, MultipartFile file) {

        //入库
        try {
            ElecFileupload elecFileupload = new ElecFileupload();

            elecFileupload.setProjid(projId);
            elecFileupload.setBelongto(belongTo);
            elecFileupload.setComment(comment);
            elecFileupload.setFileurl(Constant.FILE_PATH_PREFIX + dirPath + "/" + file.getOriginalFilename());
            elecFileupload.setFilename(file.getOriginalFilename());
            elecFileupload.setProgresstime(DateFormatUtil.formatDateYYYY_MM_DD(new Date()));
            elecFileupload.setCreatedate(new Date());
            elecFileupload.setCreateempid("123456A");

            dataChartDao.insertUpload(elecFileupload);
            return elecFileupload;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ElecFileupload> showUploadFiles(String projId, String belongTo) {


        return dataChartDao.queryFilesWithCondition(projId, belongTo);
    }

    @Override
    public List<ElecFileupload> queryFiles(String projId, String belongTo, String queryString) {
        List<ElecFileupload> elecFileuploads = new ArrayList<>();
        try {
            SolrQuery solrQuery = new SolrQuery();
            if (StringUtil.isNotEmpty(queryString)) {
                solrQuery.setQuery(Constant.SOLR_FILE_elecSearch + ":" + queryString);
            }else {
                solrQuery.setQuery("*:*");
            }


//        solrQuery.setStart(0);
//        solrQuery.setRows(5);
            solrQuery.setSort(Constant.SOLR_FILE_ID, SolrQuery.ORDER.desc);
            if (StringUtil.isNotEmpty(projId)) {
                solrQuery.addFilterQuery(Constant.SOLR_FILE_elecProjID + ":\"" + projId + "\"");
            }
            if (StringUtil.isNotEmpty(belongTo)) {
                solrQuery.addFilterQuery(Constant.SOLR_FILE_elecBelongTo + ":\"" + belongTo + "\"");
            }

            QueryResponse response = solrServer.query(solrQuery);

            SolrDocumentList results = response.getResults();
            String highlight="<b><font color='red'>"+queryString+"</font></b>";
            for (SolrDocument document : results) {
//                //就是我们的一个json
//                for (String key: document.getFieldNames()) {
//                    System.out.println("key:  "+key);
//                    System.out.println("values:  "+document.getFieldValue(key));
//                    System.out.println("-------------------");
//
//                }
//                System.out.println("==========================================================");


//                elecFileupload.setSeqid((Integer) document.getFieldValue(Constant.SOLR_FILE_ID));
//                elecFileupload.setProjid(document.getFieldValue(Constant.SOLR_FILE_elecProjID).toString());
                Object id = document.getFieldValue(Constant.SOLR_FILE_ID);
                if (id == null) {
                    continue;
                }
                ElecFileupload elecFileupload = new ElecFileupload();
                elecFileuploads.add(elecFileupload);
                elecFileupload.setSeqid((Integer) id);
                elecFileupload.setProjid(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecProjID)));
                elecFileupload.setBelongto(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecBelongTo)));
                elecFileupload.setFilename(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecFileName)).replace(queryString,highlight));
                elecFileupload.setFileurl(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecFileURL)));
                elecFileupload.setProgresstime(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecProgressTime)));
                elecFileupload.setIsdelete(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecIsDelete)));
                elecFileupload.setCreateempid(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecCreateEmpID)));
                elecFileupload.setCreatedate(DateFormatUtil.parseDateYYYY_MM_DD(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_elecCreateDate))));
                elecFileupload.setComment(String.valueOf(document.getFieldValue(Constant.SOLR_FILE_eleccomment)).replace(queryString,highlight));


            }
        } catch (SolrServerException e) {
            e.printStackTrace();
        }
        return elecFileuploads;
    }
}
