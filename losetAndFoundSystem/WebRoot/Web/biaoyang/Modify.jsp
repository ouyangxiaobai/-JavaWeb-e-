<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>biaoyang编辑页面</title>
      <script src="../js/myjs.js" type="text/javascript"></script>
	 <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script src="../js/select-ui.min.js" type="text/javascript"></script>


    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width: 345
            });
            $(".select2").uedSelect({
                width: 167
            });
            $(".select3").uedSelect({
                width: 100
            });
        });
    </script>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
	</head>
<body>
<form name="form1" action="../../biaoyang.do" method="post">
<input type="hidden" name="action" value="update"/>
<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
<%
	biaoyang model = new biaoyangDao().GetModel(Integer.parseInt(request.getParameter("id")));
%>
<div class="place">
        <span>当前位置：</span>
        <ul class="placeul">
            <li><a href="#">首页</a></li>
        </ul>
    </div>
	<!--中间部分开始-->
    <div class="formbody">
        <div class="formtitle">
            <span>biaoyang编辑</span></div>
			<!--主体表单开始-->
			<!--大文本框样式为textinput,下拉框样式为select1,下拉框需用<div class="vocation"></div>包含-->
        <ul class="forminfo">
		 	 <li>
	<label>
		ShiWuZLId:</label>
		<input type="text" id="ShiWuZLId" name="ShiWuZLId" value="<%=model.getShiWuZLId() %>" class="dfinput" />
		</li>
	 <li>
	<label>
		UserId:</label>
		<input type="text" id="UserId" name="UserId" value="<%=model.getUserId() %>" class="dfinput" />
		</li>
	 <li>
	<label>
		Title:</label>
		<input type="text" id="Title" name="Title" value="<%=model.getTitle() %>" class="dfinput" />
		</li>
	 <li>
	<label>
		Contents:</label>
		<input type="text" id="Contents" name="Contents" value="<%=model.getContents() %>" class="dfinput" />
		</li>
	 <li>
	<label>
		Times:</label>
		 <input type="text"  name="Times" id="Times" onclick="WdatePicker({el:'Times','dateFmt':'yyyy-MM-dd'})" value="<%=model.getTimes() %>" class="dfinput" />
		</li>
<script src="../js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" >
		 function checkForm(){
		var intShiWuZLId=document.getElementById("ShiWuZLId");
		if(!checkNum(intShiWuZLId.value)){
		alert("ShiWuZLId必须是数字!");
		return false;
		}
		var intUserId=document.getElementById("UserId");
		if(!checkNum(intUserId.value)){
		alert("UserId必须是数字!");
		return false;
		}
		document.forms[0].submit();		}	</script>
            <li>
               <label>
                    &nbsp;</label>
					<input name="btnSubmit" type="button" class="btn" value="提交" onclick="checkForm();"/>
			</li>
        </ul>
		 <!--主体表单结束-->
    </div>
	<!--中间结束-->
  </form>
</body>
</html>



