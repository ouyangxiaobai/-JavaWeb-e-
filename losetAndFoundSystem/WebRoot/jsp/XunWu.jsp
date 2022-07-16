﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<title>寻物启事</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">

			<script type="text/javascript" src="js/jquery1.42.min.js">
</script>

			<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js">
</script>
	</head>
	<body>
		<form id="form1" method="post" action="XunWu.jsp">
			<jsp:include page="Top.jsp" />
			<%
				request.setCharacterEncoding("UTF-8");
				String keys = request.getParameter("keyword");
				String sw = " 1=1 ";
				if (keys == null || keys.equals("")) {
					keys = "";
				} else {
					sw += " and Title like '%" + keys + "%'";
				}
			%>
			<div class="main">
				<div class="search" style="display: none;">

					<input name="keyword" type="text" class="input" id="keyword"
						value="" style="float: left;" />
					<label for="keyword" id="for-keyword" class="label">
					</label>
					<span class="submit" onclick="search();">搜索</span>
					<script type="text/javascript">

function search() {
	document.forms[0].submit();
}
var tip = function(q, for_q) {
	q = document.getElementById(q);
	for_q = document.getElementById(for_q);
	q.onfocus = function() {
		for_q.style.display = 'none';
		q.style.backgroundPosition = "right -17px";
	}
	q.onblur = function() {
		if (!this.value)
			for_q.style.display = 'block';
		q.style.backgroundPosition = "right 0";
	}
	for_q.onclick = function() {
		this.style.display = 'none';
		q.focus();
	}
};
tip('keyword', 'for-keyword');
</script>
				</div>
				<div class="s_left">
					<div class="s_left_title">
						失物招领
					</div>
					<ul class="s_left_content">
						<%
							List<shiwuzl> list = new shiwuzlDao().GetList("");
							if (list != null && list.size() > 0) {
								for (shiwuzl c : list) {
						%>
						<li>
							<a href='ZhaoLingDetail.jsp?cId=<%=c.getId()%>'><%=c.getTitle()%></a>
						</li>
						<%
							}
							}
						%>


					</ul>
				</div>
				<div class="s_right">
					<div class="s_right_title">
						<div class="s_right_title_left">
							寻物启事
						</div>
						<div class="s_right_title_right">
							当前位置：
							<a href="Index.jsp">首页</a>&nbsp;>>&nbsp;
							<a href="#">寻物启事</a>
						</div>
						<div class="clear">
						</div>
					</div>
					<div class="right_main">
						<table cellpadding="0" cellspacing="0" class="table2">
							<%
								List<shiwudj> lp = new shiwudjDao().GetList(sw);
								if (lp != null && lp.size() > 0) {
									for (shiwudj a : lp) {
							%>

							<tr style="height: 141px;">
								<td width="110px" class="td2_2">
									<a href='XunWuDetail.jsp?id=<%=a.getId()%>'> <img
											src="<%=a.getRemark()%>" width="105" height="140"
											alt="<%=a.getTitle()%>" /> </a>
								</td>
								<td class="td2_2">

									物品：<%=a.getWuPin()%><br />
									地点：<%=a.getAddress()%><br />
									时间：<%=a.getTimes()%><br />
								</td>

							</tr>
							<%
								}
								}
							%>
						</table>
						<div>

						</div>
					</div>
				</div>
				<div class="clear">
				</div>
			</div>
			<!--bottom 开始-->
			<jsp:include page="Foot.jsp" />
			<!--bottom over-->
		</form>
	</body>
</html>
