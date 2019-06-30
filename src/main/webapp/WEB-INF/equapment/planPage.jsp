<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#f5fafe">
    <TR>
        <TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width="25"><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
        <TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width="100">设备计划信息列表</TD>
        <td>


            &nbsp;&nbsp;<input type="button" height=20 style="font-size:12px; color:black; height=20;width=50" name="chkall" value="全选" onClick="CheckAll(this.form)">
            <input type="button" height=20 style="font-size:12px; color:black; height=20;width=50"  name="chkOthers" value="取消" onClick="CheckOthers(this.form)">


        </td>
        <td class="ta_01" align="right"  >
            <input name="BT_Search" type="button" style="font-size:12px; color:black; height=20;width=50" id="BT_Search" value="查询"  onclick="searchplan()"/>

            <input name="BT_Add" type="button" style="font-size:12px; color:black; height=20;width=50" id="BT_Add" onClick="openWindow('planAdd.jsp',800,450);" value="添加" />
            <input name="BT_import" type="button" style="font-size:12px; color:black; height=20;width=50" id="BT_import" onClick="openWindow('/device/DevicePlanImport.html','600','450');" value="导入">

            <input name="BT_export" type="button"  id="BT_export" value="导出" style="font-size:12px; color:black; height=20;width=50" onClick="openWindow('/device/exportDatas.html','600','400')" >
            <input type="button" name="setexcelExport" style="font-size:12px; color:black; height=20;width=80"  value="导出设置" id="setexcelExport"  onClick="openWindow('/device/planExport.html','600','450')"  >


            <input type="button" name="chkall" height=20 style="font-size:12px; color:black; height=20;width=50"  value="购置" onclick="jsDPToD()">
            <input type="button" name="chkall2" height=20 style="font-size:12px; color:black; height=20;width=80"  value="计划顺延" onclick="jsPlanNext()">


        </td>
    </TR>
</table>

<table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#f5fafe">
    <tr>
        <td class="ta_01" align="center" bgcolor="#f5fafe">
            <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
                   style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
                <tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
                    <td align="center" width="5%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
                    <td align="center" width="22%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">名称</td>
                    <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">数量</td>
                    <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">金额</td>
                    <td align="center" width="14%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">规格型号</td>
                    <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">用途</td>
                    <td align="center" width="11%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">使用单位</td>

                    <td width="9%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">是否购置</td>


                    <td width="5%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
                    <td width="5%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>

                </tr>

                <c:forEach items="${pageBean.beans}" var="devicePlan" varStatus="vs">

                    <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
                                ${vs.count}
                        </td>

                        <td align="center"  width="22%">
                            <a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=5cb793a299f64ae9a17953749715121d&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">
                                    ${devicePlan.devname}
                            </a></td>
                        <td align="center"  width="9%">${devicePlan.quality}</td>
                        <td align="center"  width="9%">	${devicePlan.devexpense}</td>

                        <td align="center"  width="14%">
                                ${devicePlan.spectype}
                        </td>
                        <td align="center"  width="9%">
                            吃
                        </td>
                        <td align="center"  width="11%" style="HEIGHT: 22px">
                                ${devicePlan.useunit}</td>

                        <td align="center" >
                            <input type="checkbox" id="devPlanId"  name="devPlanId" value="5cb793a299f64ae9a17953749715121d" />
                        </td>


                        <td align="center">
                            <a href="javascript:;"
                               onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=5cb793a299f64ae9a17953749715121d&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
                                <IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
                        </td>
                        <td align="center" >
                            <a href="javascript:Pub.submitActionWithForm('Form2','delDevicePlan.do?editflag=1&devPlanId=5cb793a299f64ae9a17953749715121d&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
                               onclick="returnMethod()"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
                        </td>

                    </tr>
                </c:forEach>


            </table>
        </td>
    </tr>


    <tr>
        <td colspan="2" align="right">
            <%@include file="pageUI.jsp"%>
        </td>
    </tr>
</table>