<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>shiwudj添加</title>
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
		<script>
KindEditor.ready(function(K) {
	var uploadbutton = K.uploadbutton( {
		button : K('#uploadButton')[0],
		fieldName : 'imgFile',
		url : '../../upload_json.jsp?dir=image',
		afterUpload : function(data) {
			if (data.error === 0) {
				var url = K.formatUrl(data.url, 'absolute');
				K('#Remark').val(url);
			} else {
				alert(data.message);
			}
		},
		afterError : function(str) {
			alert('自定义错误信息: ' + str);
		}
	});
	uploadbutton.fileBox.change(function(e) {
		uploadbutton.submit();
	});
});
</script>

	</head>
	<body>
		<form name="form1" action="../../shiwudj.do" method="post">
			<input type="hidden" name="action" value="add" />
			<div class="place">
				<span>当前位置：</span>
				<ul class="placeul">
					<li>
						<a href="#">失物登记</a>
					</li>
				</ul>
			</div>
			<!--中间部分开始-->
			<div class="formbody">
				<div class="formtitle">
					<span>失物登记</span>
				</div>
				<!--主体表单开始-->
				<!--大文本框样式为textinput,下拉框样式为select1,下拉框需用<div class="vocation"></div>包含-->
				<ul class="forminfo">
					<li>
						<label>
							标题:
						</label>
						<input type="text" id="Title" name="Title" class="dfinput" />
					</li>

					<li>
						<label>
							丢失物品:
						</label>
						<input type="text" id="WuPin" name="WuPin" class="textinput" />
					</li>
					<li>
						<label>
							物品图片:
						</label>
						<input type="text" id="Remark" name="Remark" class="dfinput" />
						<input type="button" id="uploadButton" value="上传" />
					</li>
					<li>
						<label>
							丢失时间:
						</label>
						<input type="text" name="Times" id="Times" class="dfinput" />
					</li>
					<li>
						<label>
							地点:
						</label>
						<input type="text" id="Address" name="Address" class="dfinput" />
					</li>
					<li>
						<label>
							外形:
						</label>
						<input type="text" id="WaiXing" name="WaiXing" class="textinput" />
					</li>
					<li>
						<label>
							其他特征:
						</label>
						<input type="text" id="OtherBiaoShi" name="OtherBiaoShi"
							class="textinput" />
					</li>
					<li>
						<label>
							电话:
						</label>
						<input type="text" id="Phone" name="Phone" class="dfinput" />
						<%
							userinfo user = (userinfo) session.getAttribute("user");
						%>
						<input type="hidden" id="UserId" name="UserId"
							value="<%=user.getId()%>" />
					</li>

					<li>
						<label>
							报酬:
						</label>
						<input type="text" id="BaoChou" name="BaoChou" class="textinput" />
					</li>
					<li>
						<label>
							其他说明:
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

