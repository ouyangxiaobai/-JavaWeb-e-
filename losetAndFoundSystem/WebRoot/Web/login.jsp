<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>欢迎登录后台管理系统</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />

		<script src="js/jquery.js">
</script>

		<script src="js/cloud.js" type="text/javascript">
</script>

		<script language="javascript">
$(function() {
	$('.loginbox').css( {
		'position' : 'absolute',
		'left' : ($(window).width() - 692) / 2
	});
	$(window).resize(function() {
		$('.loginbox').css( {
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
	})
});
</script>

	</head>
	<body
		style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
		<form id="form1" method="post" action="../userinfo.do?action=login">
			<div id="mainBody">
				<div id="cloud1" class="cloud">
				</div>
				<div id="cloud2" class="cloud">
				</div>
			</div>
			<div class="logintop">
				<span>欢迎登录后台管理界面平台</span>
				<ul>
					<li>
						<a href="#">帮助</a>
					</li>
					<li>
						<a href="#">关于</a>
					</li>
				</ul>
			</div>
			<div class="loginbody">
				<span class="systemlogo"></span>
				<div class="loginbox">
					<ul>
						<li>
							<input id="txtName" name="txtName" class="loginuser" type="text"></input>
						</li>
						<li>
							<input id="txtPwd" name="txtPwd" class="loginpwd" type="password"></input>
						</li>
						
						<li>
							<input type="submit" class="loginbtn" value="登录" />


						</li>
					</ul>
				</div>
			</div>
			<div class="loginbm">
				版权所有 @2015毕业设计
			</div>
		</form>
	</body>
</html>
