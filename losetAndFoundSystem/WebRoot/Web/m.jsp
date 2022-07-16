<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>欢迎页面</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.js">
</script>
		<script type="text/javascript">
$(document).ready(function() {
	$(".click").click(function() {
		$(".tip").fadeIn(200);
	});

	$(".tiptop a").click(function() {
		$(".tip").fadeOut(200);
	});

	$(".sure").click(function() {
		$(".tip").fadeOut(100);
	});

	$(".cancel").click(function() {
		$(".tip").fadeOut(100);
	});

});
</script>

	</head>
	<body>
		<form name="form1" action="Category.do" method="post">
			<div class="place">
				<span>当前位置:</span>
				<ul class="placeul">
					<li>
						<a href="#">欢迎页</a>
					</li>
				</ul>
			</div>
			<div class="rightinfo">
				<!--操作按钮开始===========================-->
				<!--操作按钮结束===========================-->
				<!--查询开始===========================-->

				<!--查询结束===========================-->
				<!--列表 开始===========================-->
				欢迎进入后台管理
				<!--列表 结束===========================-->
				<!--p s===========================-->
				<div class="pagin">

				</div>
				<!--p e===========================-->
			</div>

			<script type="text/javascript">
$('.tablelist tbody tr:odd').addClass('odd');
</script>
		</form>
	</body>
</html>
