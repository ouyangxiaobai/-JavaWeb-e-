<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>左侧菜单</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />

		<script language="JavaScript" src="js/jquery.js">
</script>

		<script type="text/javascript">
$(function() {
	//导航切换
	$(".menuson li").click(function() {
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});

	$('.title').click(function() {
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if ($ul.is(':visible')) {
			$(this).next('ul').slideUp();
		} else {
			$(this).next('ul').slideDown();
		}
	});
})
</script>

	</head>
	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>系统管理
			<%
				userinfo user = (userinfo) session.getAttribute("user");
			%>
		</div>
		<dl class="leftmenu">
			<%
				if (user.getRole().equals("管理员")) {
			%>
			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>公告管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="article/Add.jsp" target="rightFrame">公告编辑</a><i></i>
					</li>
					<li>
						<cite></cite><a href="article/List.jsp" target="rightFrame">公告列表</a><i></i>
					</li>
				</ul>
			</dd>

			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>表扬管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="biaoyang/Add.jsp" target="rightFrame">表扬编辑</a><i></i>
					</li>
					<li>
						<cite></cite><a href="biaoyang/List.jsp" target="rightFrame">表扬列表</a><i></i>
					</li>
				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>用户管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="userinfo/Add.jsp" target="rightFrame">用户编辑</a><i></i>
					</li>
					<li>
						<cite></cite><a href="userinfo/List.jsp" target="rightFrame">用户列表</a><i></i>
					</li>
				</ul>
			</dd>

			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>认领管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="renling/Add.jsp" target="rightFrame">认领编辑</a><i></i>
					</li>
					<li>
						<cite></cite><a href="renling/List.jsp" target="rightFrame">认领列表</a><i></i>
					</li>
				</ul>
			</dd>
			<%
				}
			%>
			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>寻物启事
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="shiwudj/Add.jsp" target="rightFrame">失物登记</a><i></i>
					</li>
					<li>
						<cite></cite><a href="shiwudj/List.jsp" target="rightFrame">失物登记管理</a><i></i>
					</li>
				</ul>
			</dd>

			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>失物招领
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="shiwuzl/Add.jsp" target="rightFrame">失物招领编辑</a><i></i>
					</li>
					<li>
						<cite></cite><a href="shiwuzl/List.jsp" target="rightFrame">失物招领列表</a><i></i>
					</li>
				</ul>
			</dd>


			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" /> </span>个人资料
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="userinfo/Person.jsp?id=<%=user.getId()%>"
							target="rightFrame">个人资料</a><i></i>
					</li>

				</ul>
			</dd>


		</dl>
	</body>
</html>
