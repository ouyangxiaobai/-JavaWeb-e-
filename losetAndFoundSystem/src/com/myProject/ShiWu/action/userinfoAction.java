package com.myProject.ShiWu.action;

import java.io.IOException;

import com.myProject.ShiWu.util.*;
import java.io.PrintWriter;
import java.util.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.myProject.ShiWu.util.*;
import com.myProject.ShiWu.entity.*;
import com.myProject.ShiWu.dao.*;

public class userinfoAction extends HttpServlet {
	public void destroy() {
		destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		userinfo model = new userinfo();
		userinfoDao dal = new userinfoDao();
		String action = request.getParameter("action");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new java.util.Date());
		HttpSession session = request.getSession();
		// UserInfo user =(UserInfo)session.getAttribute("user");
		if (action.equals("add")) {
			//model.setId(Integer.parseInt(request.getParameter("Id")));
			model.setName(request.getParameter("Name"));
			model.setLoginName(request.getParameter("LoginName"));
			model.setPwd(request.getParameter("Pwd"));
			model.setPhone(request.getParameter("Phone"));
			model.setEmail(request.getParameter("Email"));
			model.setAddress(request.getParameter("Address"));
			model.setRole(request.getParameter("Role"));
			model.setAddTime(time);
			model.setRemark("");
			if (dal.Add(model) > 0) {
				out.print(CommonMethod.outScript("操作成功!", "back"));
			}
		}
		if (action.equals("update")) {
			model = dal.GetModel(Integer.parseInt(request.getParameter("id")));
			model.setId(Integer.parseInt(request.getParameter("Id")));
			model.setName(request.getParameter("Name"));
			model.setLoginName(request.getParameter("LoginName"));
			model.setPwd(request.getParameter("Pwd"));
			model.setPhone(request.getParameter("Phone"));
			model.setEmail(request.getParameter("Email"));
			model.setAddress(request.getParameter("Address"));
			model.setRole(request.getParameter("Role"));
			model.setAddTime(time);
			model.setRemark("");
			if (dal.Update(model) > 0) {
				out.print(CommonMethod.outScript("修改操作成功!", "back"));
			}
		}
		if (action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			if (dal.Delete(id) > 0) {
				out.print(CommonMethod.outScript("删除操作成功!", "back"));
			}
		}
		if (action.equals("login")) {
			String name = request.getParameter("txtName");
			String pwd = request.getParameter("txtPwd");

			String sw = " LoginName='" + name + "' and Pwd='" + pwd + "' ";
			List<userinfo> la = new userinfoDao().GetList(sw);
			 if ( la != null && la.size() > 0) {
				session.setAttribute("user", la.get(0));
				response.sendRedirect("Web/index.htm");
			}  else {

				out.print(CommonMethod.outScript("帐号或密码错误!", "back"));
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	public void init() throws ServletException {// Put your code here;
	}
}
