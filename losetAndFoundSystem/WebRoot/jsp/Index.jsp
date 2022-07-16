<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>首页</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">

			<script type="text/javascript" src="js/jquery1.42.min.js">
</script>

			<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js">
</script>
	</head>
	<body>
		<form id="form1" runat="server">
			<jsp:include page="Top.jsp" />

			<div class="main">

				<!--js图片 开始-->
				<div id="slideBox" class="slideBox">
					<div class="hd">
						<ul>

							<li>
								1
							</li>
							<li>
								2
							</li>
							<li>
								3
							</li>
						</ul>
					</div>
					<div class="bd">
						<ul>
							<li>
								<a href='http://www.baidu.com' target="_blank" title='轮播图1'>
									<img src='images/2015032217430720.jpg' /> </a>
							</li>
							<li>
								<a href='http://www.baidu.com' target="_blank" title='轮播图2'>
									<img src='images/2015032217432889.jpg' /> </a>
							</li>
							<li>
								<a href='http://www.baidu.com' target="_blank" title='轮播图3'>
									<img src='images/2015032217434232.jpg' /> </a>
							</li>
						</ul>
					</div>
				</div>

				<script type="text/javascript">
jQuery(".slideBox").slide( {
	mainCell : ".bd ul",
	autoPlay : true
});
</script>

				<div class="main_left">
					<div class="new" style="margin-top: 17px;">
						<div class="new_title">
							<div class="notice_t_left">
								站内通知
							</div>
							<a class="notice_t_right" href="Aritcle.jsp">更多>></a>
							<div class="clear">
							</div>
						</div>
						<ul class="new_content">
							<%
								List<article> list = new articleDao().GetListByPage2(10, 1, "");
								if (list != null && list.size() > 0) {
									for (article a : list) {
							%>
							<li>
								<span>[<%=a.getAddTime()%>]</span><a
									href='ArticleDetail.jsp?id=<%=a.getId()%>'> <%=a.getTitle()%>
								</a>
							</li>
							<%
								}
								}
							%>
						</ul>
					</div>
					<!--参考资料 over-->
				</div>
				<div class="main_right">

					<!-- 开始-->
					<div class="honor" style="margin-top: 17px;">
						<div class="honor_title">
							表扬信
						</div>
						<ul class="honor_content">
							<%
								List<biaoyang> yl = new biaoyangDao().GetListByPage2(10, 1, "");
								if (yl != null && yl.size() > 0) {
									for (biaoyang a : yl) {
							%>
							<li>
								<a href='BiaoYangDetail.jsp?id=<%=a.getId()%>'> <%=a.getTitle()%>
								</a>
							</li>
							<%
								}
								}
							%>

						</ul>
					</div>
					<!-- over-->
				</div>
				<div class="mian_main">
					<!-- 开始-->
					<div class="new" style="margin-top: 17px;">
						<div class="new_title">
							<div class="notice_t_left">
								失物招领
							</div>
							<a class="notice_t_right" href="ZhaoLing.jsp">更多>></a>
							<div class="clear">
							</div>
						</div>
						<ul class="new_content">

							<%
								List<shiwuzl> dl = new shiwuzlDao().GetListByPage2(10, 1, "");
								if (dl != null && dl.size() > 0) {
									for (shiwuzl a : dl) {
							%>
							<li>
								<span>[<%=a.getAddTime()%>]</span><a
									href='ZhaoLingDetail.jsp?id=<%=a.getId()%>'> <%=a.getTitle()%>
								</a>
							</li>
							<%
								}
								}
							%>

						</ul>
					</div>
					<!-- over-->
				</div>
				<div class="clear">
				</div>
			</div>
			<!-- 开始-->
			<div class="teacher">
				<div class="tea_title">
					<div class="notice_t_left">
						寻物启事
					</div>
					<a class="notice_t_right" href="XunWu.jsp">更多>></a>
					<div class="clear">
					</div>
				</div>
				<div class="picMarquee-left">
					<div class="bd">
						<ul class="picList">
							<%
								List<shiwudj> lp = new shiwudjDao().GetList("");
								if (lp != null && lp.size() > 0) {
									for (shiwudj a : lp) {
							%>
							<li>
								<div class="pic">
									<a href="XunWuDetail.jsp?id=<%=a.getId()%>" target="_blank">
										<img src='<%=a.getRemark()%>' /> </a>
								</div>
								<div class="title">
									<a href='XunWuDetail.jsp?id=<%=a.getId()%>' target="_blank">
										<%=a.getTitle()%> </a>
								</div>
							</li>
							<%
								}
								}
							%>



						</ul>
					</div>
				</div>

				<script type="text/javascript">
jQuery(".picMarquee-left").slide( {
	mainCell : ".bd ul",
	autoPlay : true,
	effect : "leftMarquee",
	vis : 5,
	interTime : 50
});
</script>

			</div>
			<!-- over-->
			<!--bottom 开始-->
			<jsp:include page="Foot.jsp" />
			<!--bottom over-->
		</form>
	</body>
</html>
