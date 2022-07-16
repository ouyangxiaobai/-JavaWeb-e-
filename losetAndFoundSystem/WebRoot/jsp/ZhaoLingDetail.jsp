<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<title>失物招领详细</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">

			<script type="text/javascript" src="js/jquery1.42.min.js">
</script>

			<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js">
</script>
	</head>
	<body>
		<form id="form1">
			<jsp:include page="Top.jsp" />
			<div class="main">
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
							<a href='ZhaoLingDetail.jsp?id=<%=c.getId()%>'><%=c.getTitle()%></a>
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
							失物招领详细
						</div>
						<div class="s_right_title_right">
							当前位置：
							<a href="Index.jsp">首页</a>&nbsp;>>&nbsp;
							<a href="#">失物招领详细</a>
							<%
								shiwuzl model = new shiwuzlDao().GetModel(Integer.parseInt(request
										.getParameter("id")));
							%>
						</div>
						<div class="clear">
						</div>
					</div>
					<div class="right_main">
						<table cellpadding="0" cellspacing="0" class="table2">
							<tr>
								<td width="110" class="td1_2">
									<h2><%=model.getTitle()%>
									</h2>

									<br />

								</td>
								<td class="td2_2" style="text-align: left;">
									物品：<%=model.getWuPin()%><br />
									标识特征：<%=model.getBiaoShi()%><br />
									拾到时间：<%=model.getTimes()%><br />
									地点:<%=model.getAddress()%><br />
									联系人：<%=model.getLinkName()%><br />
									联系电话：<%=model.getPhone()%><br />
									其他描述：<%=model.getContents()%><br />

								</td>

							</tr>

						</table>
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
