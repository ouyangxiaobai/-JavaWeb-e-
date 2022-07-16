<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<title>认领公告</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="js/jquery1.42.min.js">
</script>

		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js">
</script>
		<script>
function cl(obj) {
	if (obj.value == "请输入标题") {
		obj.value = "";
	}
}
</script>
	</head>
	<body>
		<form id="form1" method="post" action="Gao.jsp">
			<jsp:include page="Top.jsp" />
			<%
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				request.setCharacterEncoding("UTF-8");
				String keys = request.getParameter("keyword");
				String sw = " 1=1 ";
				if (keys == null || keys.equals("")) {
					keys = "";
				} else {
					sw += " and ShiWuZLId in(select Id from shiwuzl where Title like '%"
							+ keys + "%' )";
				}
			%>
			<div class="main">
				<div class="search">
					<input name="keyword" type="text" class="input" id="keyword"
						value="<%=keys.equals("") ? "请输入标题" : keys%>" style="float: left;"
						onclick="cl(this);" />
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

				<div class="s_right" style="width: 1000px;">
					<div class="s_right_title" style="width: 998px;">
						<div class="s_right_title_left">
							认领公告
						</div>
						<div class="s_right_title_right">
							当前位置：
							<a href="Index.jsp">首页</a>&nbsp;>>&nbsp;
							<a href="#">认领公告</a>
						</div>
						<div class="clear">
						</div>
					</div>
					<div class="right_main" style="width: 1000px;">
						<table cellpadding="0" cellspacing="0" class="table2">
							<tr>
								<td class="td1_1" width="310px">
									招领
								</td>
								<td class="td1_1">
									认领人
								</td>
								<td class="td1_1">
									时间
								</td>

							</tr>
							<%
								List<renling> lp = new renlingDao().GetList(sw);
								if (lp != null && lp.size() > 0) {
									for (renling a : lp) {
							%>

							<tr>
								<td class="td2_2">
									<a href="RenLingDetail.jsp?id=<%=a.getId()%>"><%=new shiwuzlDao().GetModel(a.getShiWuZLId())
							.getTitle()%></a>
								</td>
								<td class="td2_2">
									<%=a.getUserS()%>
								</td>
								<td class="td2_2">
									<%=a.getTimes()%>
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
