<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<title>登录和注册</title>
		<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #666666;
	background: #fff;
	text-align: center;
}

* {
	margin: 0;
	padding: 0;
}

a {
	color: #1E7ACE;
	text-decoration: none;
}

a:hover {
	color: #000;
	text-decoration: underline;
}

h3 {
	font-size: 14px;
	font-weight: bold;
}

pre,p {
	color: #1E7ACE;
	margin: 4px;
}

input,select,textarea {
	padding: 1px;
	margin: 2px;
	font-size: 11px;
}

.buttom {
	padding: 1px 10px;
	font-size: 12px;
	border: 1px #1E7ACE solid;
	background: #D0F0FF;
}

#formwrapper {
	width: 450px;
	margin: 15px auto;
	padding: 20px;
	text-align: left;
	border: 1px #1E7ACE solid;
}

fieldset {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #1E7ACE;
	background: #fff;
}

fieldset legend {
	color: #1E7ACE;
	font-weight: bold;
	padding: 3px 20px 3px 20px;
	border: 1px solid #1E7ACE;
	background: #fff;
}

fieldset label {
	float: left;
	width: 120px;
	text-align: right;
	padding: 4px;
	margin: 1px;
}

fieldset div {
	clear: left;
	margin-bottom: 2px;
}

.enter {
	text-align: center;
}

.clear {
	clear: both;
}
</style>
		<script type="text/javascript">
function checkForm(t) {
	if (t == 1) {
		document.forms[0].target = "_blank";
		document.forms[0].action = "../userinfo.do?action=login";
	} else {
		document.forms[0].action = "../userinfo.do?action=add";
	}

	document.forms[0].submit();
}</script>
		<script src="../Web/js/My97DatePicker/WdatePicker.js"
			type="text/javascript">
</script>
	</head>
	<body>
		<form action="../userinfo.do" method="post">
			<div id="formwrapper">
				<h3>
					已注册用户登录
				</h3>
				<fieldset>
					<legend>
						用户登录
					</legend>
					<div>
						<label for="Name">
							用户名
						</label>
						<input type="text" name="txtName" />
						<br />
					</div>
					<div>
						<label for="password">
							密码
						</label>
						<input type="password" name="txtPwd" />
						<br />
					</div>
					<div class="cookiechk" style="text-align: center;">
						<input type="button" onclick="checkForm(1);" class="buttom"
							value="登录" />

					</div>
				</fieldset>
				<br />
				<h3>
					未注册创建帐户
				</h3>
				<fieldset>
					<legend>
						用户注册
					</legend>
					<p>
						<strong>请填写注册信息</strong>
					</p>
					<div>
						<label for="name">
							用户名
						</label>
						<input type="text" name="LoginName" />

						<br />
					</div>

					<div>
						<label for="Pwd">
							密码
						</label>
						<input type="text" name="Pwd" />
						<input type="hidden" name="Name" value="" />
						<input type="hidden" name="Email" value="" />
						<input type="hidden" name="Role" value="普通用户" />
						<br />
					</div>
					<div>
						<label for="Address">
							住址
						</label>
						<input type="text" name="Address" id="Address" />

						<br />
					</div>
					<div>
						<label for="Phone">
							电话
						</label>
						<input type="text" name="Phone" />

						<br />
					</div>
					<div class="enter">
						<input type="button" onclick="checkForm(2);" class="buttom"
							value="注册" />
					</div>
				</fieldset>
			</div>
		</form>
	</body>
</html>
