<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!--顶部 开始-->
<div class="top">
	<div class="top_main">
		<div class="top_left">
			您好，欢迎来到失物招领系统
		</div>
		<ul class="top_right">
			<%
				if (session.getAttribute("user") == null) {
			%>
			<a href="Login.jsp">注册登录</a>
			<%
				} else {
					userinfo user = (userinfo) session.getAttribute("user");
			%>
			<a href="../Web/index.htm"><%=user.getName()%></a>
			<%
				}
			%>

		</ul>
		<div class="clear">
		</div>
	</div>
</div>
<!--顶部 over-->
<!--banner 开始-->
<div class="banner">
	<div class="banner_text">
		失物招领系统
	</div>
</div>
<!--banner over-->
<!--导航 开始-->
<div class="navbg">
	<ul id="nav" class="nav clearfix">
		<li class="nLi on">
			<h3>
				<a href="Index.jsp">首页</a>
			</h3>
		</li>
		<li class="nLi">
			<!--假设当前频道为"预告片"，手动或后台程序添加titOnClassName类名（默认是'on'），相当于设置参数defaultIndex:1。若同时设置参数returnDefault:true，则鼠标移走后0.3秒返回当前频道-->
			<h3>
				<a href="Aritcle.jsp">站内通知</a>
			</h3>
		</li>

		<li class="nLi ">
			<h3>
				<a href="XunWu.jsp">寻物启事</a>
			</h3>
		</li>
		<li class="nLi ">
			<h3>
				<a href="ZhaoLing.jsp">失物招领</a>
			</h3>
		</li>
		<li class="nLi">
			<h3>
				<a href="RenLing.jsp">认领公告</a>
			</h3>
		</li>
		<li class="nLi">
			<h3>
				<a href="BiaoYang.jsp">表扬信</a>
			</h3>
		</li>
		<li class="nLi">
			<!--假设当前频道为"预告片"，手动或后台程序添加titOnClassName类名（默认是'on'），相当于设置参数defaultIndex:1。若同时设置参数returnDefault:true，则鼠标移走后0.3秒返回当前频道-->
			<h3>
				<a href="../Web/index.htm">个人中心</a>
			</h3>
		</li>
	</ul>

	<script id="jsID" type="text/javascript">

jQuery("#nav").slide( {
	type : "menu", // 效果类型，针对菜单/导航而引入的参数（默认slide）
	titCell : ".nLi", //鼠标触发对象
	targetCell : ".sub", //titCell里面包含的要显示/消失的对象
	effect : "slideDown", //targetCell下拉效果
	delayTime : 300, //效果时间
	triggerTime : 0, //鼠标延迟触发时间（默认150）
	returnDefault : true
//鼠标移走后返回默认状态，例如默认频道是"预告片"，鼠标移走后会返回"预告片"（默认false）
		});
</script>

	<div class="clear">
	</div>
</div>
<!--导航 over-->
<div class="ba_bottom">
</div>
