<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>userinfo编辑页面</title>
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
	</head>
	<body>
		<form name="form1" action="../../userinfo.do" method="post">
			<input type="hidden" name="action" value="update" />
			<input type="hidden" name="id"
				value="<%=request.getParameter("id")%>" />
			<%
				userinfo model = new userinfoDao().GetModel(Integer
						.parseInt(request.getParameter("id")));
			%>
			<div class="place">
				<span>当前位置：</span>
				<ul class="placeul">
					<li>
						<a href="#">用户编辑</a>
					</li>
				</ul>
			</div>
			<!--中间部分开始-->
			<div class="formbody">
				<div class="formtitle">
					<span>用户编辑</span>
				</div>
				<!--主体表单开始-->
				<!--大文本框样式为textinput,下拉框样式为select1,下拉框需用<div class="vocation"></div>包含-->
				<ul class="forminfo">
					<li>
						<label>
							姓名:
						</label>
						<input type="text" id="Name" name="Name"
							value="<%=model.getName()%>" class="dfinput" />
					</li>
					<li>
						<label>
							登录名:
						</label>
						<input type="text" id="LoginName" name="LoginName"
							value="<%=model.getLoginName()%>" class="dfinput" />
					</li>
					<li>
						<label>
							密码:
						</label>
						<input type="text" id="Pwd" name="Pwd"
							value="<%=model.getPwd()%>" class="dfinput" />
					</li>
					<li>
						<label>
							电话:
						</label>
						<input type="text" id="Phone" name="Phone"
							value="<%=model.getPhone()%>" class="dfinput" />
					</li>
					<li>
						<label>
							邮箱:
						</label>
						<input type="text" id="Email" name="Email"
							value="<%=model.getEmail()%>" class="dfinput" />
					</li>
					<li>
						<label>
							地址:
						</label>
						<input type="text" id="Address" name="Address"
							value="<%=model.getAddress()%>" class="dfinput" />
					</li>
					<li>
						<label>
							角色:
						</label>
						<div class="vocation">
							<select name="Role" class="select1">

								<option value="普通用户" <%=model.getRole().equals("普通用户")?"selected='selected'":"" %>>
									普通用户
								</option>
								<option value="管理员" <%=model.getRole().equals("管理员")?"selected='selected'":"" %>>
									管理员
								</option>
							</select>
						</div>
					</li>
					<script src="../js/My97DatePicker/WdatePicker.js"
						type="text/javascript">
</script>
					<script type="text/javascript">
function checkForm() {
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



