<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>biaoyang添加</title>
		<script src="../js/myjs.js" type="text/javascript">
</script>
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<link href="../css/select.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery.js">
</script>
		<script src="../js/select-ui.min.js" type="text/javascript">
</script>


		<script type="text/javascript">
$(document).ready(function(e) {
	$(".select1").uedSelect( {
		width : 345
	});
	$(".select2").uedSelect( {
		width : 167
	});
	$(".select3").uedSelect( {
		width : 100
	});
});
</script>
		<script type="text/javascript">
$('.tablelist tbody tr:odd').addClass('odd');
</script>
		<link rel="stylesheet"
			href="../../kindeditor/themes/default/default.css" />
		<link rel="stylesheet"
			href=".../../kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="../../kindeditor/kindeditor.js">
</script>
		<script charset="utf-8" src="../../kindeditor/lang/zh_CN.js">
</script>
		<script charset="utf-8"
			src=".../../kindeditor/plugins/code/prettify.js">
</script>
	</head>
	<body>
		<form name="form1" action="../../biaoyang.do" method="post">
			<input type="hidden" name="action" value="add" />
			<div class="place">
				<span>当前位置：</span>
				<ul class="placeul">
					<li>
						<a href="#">表扬信</a>
					</li>
				</ul>
			</div>
			<!--中间部分开始-->
			<div class="formbody">
				<div class="formtitle">
					<span>表扬信</span>
				</div>
				<!--主体表单开始-->
				<!--大文本框样式为textinput,下拉框样式为select1,下拉框需用<div class="vocation"></div>包含-->
				<ul class="forminfo">
					<li>
						<label>
							失物招领:
						</label>
						<div class="vocation">
							<select name="ShiWuZLId" class="select1">
								<%
									List<shiwuzl> list = new shiwuzlDao().GetList("");
									if (list != null && list.size() > 0) {
										for (shiwuzl s : list) {
								%>
								<option value="<%=s.getId()%>"><%=s.getTitle()%></option>
								<%
									}
									}
								%>
							</select>
						</div>
						<input type="hidden" id="UserId" name="UserId" value="0" />
					</li>
					<li>
						<label>
							标题:
						</label>
						<input type="text" id="Title" name="Title" class="dfinput" />
					</li>
					<li>
						<label>
							内容:
						</label>
						<textarea style="width: 700px; height: 180px; visibility: hidden;"
							id="Contents" name="Contents"></textarea>
						<script>
var ediContents;
KindEditor.ready(function(K) {
	ediContents = K.create('#Contents', {
		resizeType : 1,
		allowPreviewEmoticons : true,
		allowImageUpload : true,
		uploadJson : '../../upload_json.jsp',
		fileManagerJson : '../../file_manager_json.jsp'
	});
});
</script>
					</li>
					<li>
						<label>
							时间:
						</label>
						<input type="text" name="Times" id="Times"
							onclick="WdatePicker({el:'Times','dateFmt':'yyyy-MM-dd'})"
							class="dfinput" />
					</li>
					<script src="../js/My97DatePicker/WdatePicker.js"
						type="text/javascript">
</script>
					<script type="text/javascript">
function checkForm() {
	ediContents.sync();
	document.forms[0].submit();
}</script>
					<li>
						<label>
							&nbsp;
						</label>
						<input name="btnSubmit" type="button" class="btn" value="提交"
							onclick="checkForm();" />
					</li>
				</ul>
				<!--主体表单结束-->
			</div>
			<!--中间结束-->
		</form>
	</body>
</html>

