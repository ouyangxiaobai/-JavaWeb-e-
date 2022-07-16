<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.myProject.ShiWu.entity.*"%>
<%@ page
	import="com.myProject.ShiWu.dao.*,com.myProject.ShiWu.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1" runat="server">
		<title>表扬信</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">

			<script type="text/javascript" src="js/jquery1.42.min.js">
</script>

			<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js">
</script>
	</head>
	<body>
		<form id="form1">
			1<jsp:include page="Top.jsp" />
			<div class="main">
				<div class="s_left">
					<div class="s_left_title">
						寻物启事
					</div>
					<ul class="s_left_content">
						<%
							List<shiwudj> list = new shiwudjDao().GetList("");
							if (list != null && list.size() > 0) {
								for (shiwudj c : list) {
						%>
						<li>
							<a href='XunWuDetail.jsp?id=<%=c.getId()%>'><%=c.getTitle()%></a>
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
							表扬信
							<%
							request.setCharacterEncoding("UTF-8");
							
							String sw = " 1=1 ";
							
						%>
						</div>
						<div class="s_right_title_right">
							当前位置：
							<a href="Index.jsp">首页</a>&nbsp;>>&nbsp;
							<a href="#">表扬信</a>
						</div>
						<div class="clear">
						</div>
					</div>
					<div class="right_main">
						<table cellpadding="0" cellspacing="0" class="table">
							<%
								List<biaoyang> la = new biaoyangDao().GetList(sw);
								if (la != null && la.size() > 0) {
									for (biaoyang a : la) {
							%>
							<tr>
								<td class="td2_1" style="text-align: left;">
									<a href='BiaoYangDetail.jsp?id=<%=a.getId()%>'> <%=a.getTitle()%>
									</a>(
									<%=a.getAddTime()%>)
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
