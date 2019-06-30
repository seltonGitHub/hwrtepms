package com.itszt.elec.service.bean;

import java.util.List;

/**
 * Created by Administrator--善知  on 2018/5/21.
 */
public class MenuItemBean {

    private String mid;
    private String pid;
    private String icon;
    private String name;
    private String target;
    private boolean isParent;
    private String url;
    private List<MenuItemBean> nodes;


    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(boolean parent) {
        isParent = parent;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<MenuItemBean> getNodes() {
        return nodes;
    }

    public void setNodes(List<MenuItemBean> nodes) {
        this.nodes = nodes;
    }
}
