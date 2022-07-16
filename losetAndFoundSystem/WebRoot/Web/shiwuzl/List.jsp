<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>shiwuzl</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery.js">
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
		<form name="form1" action="shiwuzl.do" method="post">
			<div class="place">
				<span>当前位置:</span>
				<ul class="placeul">
					<li>
						<a href="#">失物招领</a>
					</li>
				</ul>
			</div>
			<div class="rightinfo">
				<!--操作按钮开始===========================-->
				<!--操作按钮结束===========================-->
				<!--查询开始===========================-->

				<!--查询结束===========================-->
				<!--列表 开始===========================-->
				<table class="tablelist">

					<thead>
						<tr>
							<th>
								发布人
							</th>
							<th>
								标题
							</th>
							<th>
								物品
							</th>
							<th>
								时间
							</th>
							<th>
								地点
							</th>

							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							shiwuzlDao dal = new shiwuzlDao();
							int pageSize = 10;
							int currentPage = 1;
							request.setCharacterEncoding("UTF-8");
							String cp = request.getParameter("page");
							if (cp != null && (!cp.equals(""))) {
								currentPage = Integer.parseInt(cp);
							}
							String sw = " 1=1 ";
							userinfo user = (userinfo) session.getAttribute("user");
							if(!user.getRole().equals("管理员")){
								sw+=" and UserId="+user.getId();
							}
							List<shiwuzl> list = dal.GetListByPage2(pageSize, currentPage, sw);
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									shiwuzl model = list.get(i);
						%>
						<tr>
							<td><%=new userinfoDao().GetModel(model.getUserId())
							.getName()%></td>
							<td><%=model.getTitle()%></td>
							<td><%=model.getWuPin()%></td>
							<td><%=model.getTimes()%></td>
							<td><%=model.getAddress()%></td>

							<td>
								<a href="Modify.jsp?id=<%=model.getId()%>" class="tablelink">修改</a>&nbsp;
								<a href="javascript:void(0);"
									onclick="isDelete(<%=model.getId()%>);" class="tablelink">删除</a>
							</td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
					<script type="text/javascript">
function isDelete(objId) {
	if (confirm("您确定要删除吗？")) {
		window.location.href = "../../shiwuzl.do?action=delete&id=" + objId;
	}
}
</script>

				</table>
				<!--列表 结束===========================-->
				<!--p s===========================-->
				<div class="pagin">
					<%=dal.GetPager(pageSize, currentPage, sw)%>
				</div>
				<!--p e===========================-->
			</div>

			<script type="text/javascript">
$('.tablelist tbody tr:odd').addClass('odd');
</script>
		</form>
	</body>
</html>
