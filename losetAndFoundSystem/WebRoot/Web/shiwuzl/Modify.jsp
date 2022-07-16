<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>shiwuzl编辑页面</title>
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
		<form name="form1" action="../../shiwuzl.do" method="post">
			<input type="hidden" name="action" value="update" />
			<input type="hidden" name="id"
				value="<%=request.getParameter("id")%>" />
			<%
				shiwuzl model = new shiwuzlDao().GetModel(Integer.parseInt(request
						.getParameter("id")));
			%>
			<div class="place">
				<span>当前位置：</span>
				<ul class="placeul">
					<li>
						<a href="#">失物招领编辑</a>
					</li>
				</ul>
			</div>
			<!--中间部分开始-->
			<div class="formbody">
				<div class="formtitle">
					<span>失物招领编辑</span>
				</div>
				<!--主体表单开始-->
				<!--大文本框样式为textinput,下拉框样式为select1,下拉框需用<div class="vocation"></div>包含-->
				<ul class="forminfo">
					
					<li>
						<label>
							标题:
						</label>
						<input type="text" id="Title" name="Title"
							value="<%=model.getTitle()%>" class="dfinput" />
							<input type="hidden" id="UserId" name="UserId"
							value="<%=model.getUserId()%>"  />
					</li>
					<li>
						<label>
							物品:
						</label>
						<input type="text" id="WuPin" name="WuPin"
							value="<%=model.getWuPin()%>" class="dfinput" />
					</li>
					<li>
						<label>
							时间:
						</label>
						<input type="text" name="Times" id="Times"
							onclick="WdatePicker({el:'Times','dateFmt':'yyyy-MM-dd HH:mm:ss'})"
							value="<%=model.getTimes()%>" class="dfinput" />
					</li>
					<li>
						<label>
							地点:
						</label>
						<input type="text" id="Address" name="Address"
							value="<%=model.getAddress()%>" class="dfinput" />
					</li>
					<li>
						<label>
							标识:
						</label>
						<input type="text" id="BiaoShi" name="BiaoShi"
							value="<%=model.getBiaoShi()%>" class="dfinput" />
					</li>
					<li>
						<label>
							其他说明:
						</label>
						<textarea style="width: 700px; height: 180px; visibility: hidden;"
							id="Contents" name="Contents">
							<%=model.getContents()%>
							</textarea>
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
							联系人:
						</label>
						<input type="text" id="LinkName" name="LinkName"
							value="<%=model.getLinkName()%>" class="dfinput" />
					</li>
					<li>
						<label>
							联系电话:
						</label>
						<input type="text" id="Phone" name="Phone"
							value="<%=model.getPhone()%>" class="dfinput" />
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



