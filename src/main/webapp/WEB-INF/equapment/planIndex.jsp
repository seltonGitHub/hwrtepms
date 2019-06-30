<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page language="java" pageEncoding="UTF-8"%>




<html>

	<head>
		<title>设备购置计划</title>
		<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet" />
		<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
		
<script language="javascript">

function CheckOthers(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
			if (e.checked==false)
			{
				e.checked = true;// form.chkall.checked;
			}
			else
			{
				e.checked = false;
			}
			e.checked = false;
	}
}

function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
			e.checked = true// form.chkall.checked;
	}
}


  function jsNext(){
     
     changeformvalue();
	 document.F1.direction.value="NEXT";
	 document.F1.goPage.value=""; 
	 Pub.submitActionWithForm('Form2','changePage.do','F1');     

  }
  function jsPrevious(){

     changeformvalue();
	 document.F1.direction.value="PREVIOUS";
	 document.F1.goPage.value="";
     Pub.submitActionWithForm('Form2','changePage.do','F1');     
  }	
  
  function jsJumpToBegin(){
     changeformvalue();
	 document.F1.pageNO.value="1";
	 Pub.submitActionWithForm('Form2','changePage.do','F1');     
 }

  function jsJumpToEnd(){
    changeformvalue();
	document.F1.pageNO.value=document.Form2.sumPage.value;
    Pub.submitActionWithForm('Form2','changePage.do','F1');     
  }
  
  function jsJumpto(){
  
     changeformvalue();
	 var gopage=parseInt(document.F1.goPage.value);
	 var sumpage=parseInt(document.F1.sumPage.value);
	
	 if(gopage<=sumpage&&gopage>=1)
	 {	 	
	 	document.F1.pageNO.value=document.F1.goPage.value;
        Pub.submitActionWithForm('Form2','changePage.do','F1');   
	 }
	 else{
	    alert("不存在此页，请重新输入页数"); 
	 }
}
   
  function changeformvalue(){
	
    document.F1.direction.value=document.Form2.direction.value;
	document.F1.goPage.value=document.Form2.goPage.value;
	document.F1.typeView.value=document.Form2.typeView.value;
	document.F1.pageNO.value=document.Form2.pageNO.value;
	document.F1.changeFlag.value=document.Form2.changeFlag.value;
	document.F1.sumPage.value=document.Form2.sumPage.value;
	document.F1.lastRecordIndex.value=document.Form2.lastRecordIndex.value;
	
	}

  function  searchplan(){
     changeformvalue();
     Pub.submitActionWithForm('Form2','/device/searchDevicePlan.html','F1');

  }
  
  function jsPlanNext(){

     changeformvalue();  
	 document.F1.direction.value="";
	 document.F1.goPage.value="";
	 Pub.submitActionWithForm('Form2','devicePlanNextDate.do','F1');   
  }
  
  
  function jsDPToD(){
  
     changeformvalue();
	 document.F1.direction.value="";
	 document.F1.goPage.value="";
	 
	 var devplan=document.Form2.devPlanId;
	 var devplanid="";
	 var flag=0;
	
	 if(typeof(devplan)=="undefined"){ 
	    return;
	 }
	 
	 if(typeof(devplan.length)!="undefined"){   //多个
	 
	     for(var i=0;i<devplan.length;i++){
	         if(devplan[i].checked==true){
	            
	            devplanid+=devplan[i].value+",";  
	            flag=1;       
	         }     
	     }
	 }else{                                  //只有一个


	    if(devplan.checked==true){
	            
	            devplanid+=devplan.value+",";  
	            flag=1;       
	     }       	
	 }
	  
	 document.F1.plantodev.value=devplanid;
	 
	 if(flag==1){
	   Pub.submitActionWithForm('Form2','devicePlanToDevice.do','F1');
	 }	 
  }
  
  
  function savewithopener(path){
     
     changeformvalue();
     document.F1.pageNO.value="1";
	 document.F1.direction.value="";
	 document.F1.goPage.value=document.F1.pageNO.value;
	 Pub.submitActionWithForm('Form2',path,'F1');  
 }
 function returnMethod(){
	 return confirm("确认要删除？");
 }
</script>

	</head>
	<body>
		<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		
			    <tr>
			      <td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			       <font face="宋体" size="2"><strong>设备购置计划</strong></font>
			     </td>
		        </tr>
		        <TR height=10><td></td></TR>
				<tr>
					<td>
<form name="F1" method="post"  id="F1" style="margin:0px;">
					
				    <input type="hidden" name="typeView" value="" >
				    <input type="hidden" name="direction" value="">
                    <input type="hidden" name="pageNO" value="" >
                    <input type="hidden" name="sumPage" value="" > 
                    <input type="hidden" name="lastRecordIndex" value="" >
                    <input type="hidden" name="changeFlag" value="" >
                    <input type="hidden" name="goPage" value="" >
                    <input type="hidden" name="plantodev" value="" >
                  
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">所属单位：</td>
								<td class="ta_01" >		
									<select name="jctId" id="jctId" style="width:200px">
									
		                            <option value="">全部</option>
		                            
					                
					                
									<option value="1">北京</option>	
		
									<option value="2">上海</option>	
									
									<option value="3">深圳</option>	
									
									<option value="4">厦门</option>	
									
									<option value="5">成都</option>	
									
									<option value="6">海尔滨</option>	
									
									<option value="7">长春</option>	
									
									<option value="8">沈阳</option>	
									
									<option value="9">广州</option>	
									
									<option value="10">西安</option>	
									
									<option value="11">南宁</option>	
									
									<option value="12">天津</option>	
									
									<option value="13">海南</option>	
											
				                  
				                  
												
					             </select>
								</td>
								<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备名称：</td>
								<td class="ta_01" >

									<input name="devName" type="text" id="devName"  size="22" value="" />
								</td>
							</tr>
							<tr>
								<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">计划时间：</td>
								<td class="ta_01" width="300" >

									<input name="planDatef" type="text" id="planDatef" size="10" value=""  onclick="WdatePicker()">
									~
									<input name="planDatet" type="text" id="planDatet" size="10" value="" onclick="WdatePicker()">
								</td>

				<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备类型：</td>
								<td class="ta_01"  width="247">

									<select name="devType" id="devType" style="width:168px">					
									<option value="">全部</option>
					                
					                
											<option value="1">
												电力设备dd
											</option>
											
				                   
											<option value="2">
												电机设备
											</option>
											
				                   
											<option value="3">
												通讯设备
											</option>
											
				                   
											<option value="4">
												防雷设备
											</option>
											
				                   
											<option value="5">
												办公设备
											</option>
											
				                   
											<option value="6">
												电视机房设备
											</option>
											
				                   
											<option value="7">
												发电机房设备
											</option>
											
				                   
				                   
										</select> 
								</td>
					</tr>		
		</table>
</form>
							
<br>							
<form name="Form2" id="Form2" style="margin:0px;">

			<%@ include file="planPage.jsp"%>
		</form>
</body>

</html>
