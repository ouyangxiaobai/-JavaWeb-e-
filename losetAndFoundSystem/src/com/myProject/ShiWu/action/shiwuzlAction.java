﻿package com.myProject.ShiWu.action;
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
	public  class shiwuzlAction extends HttpServlet 
	{
		public void destroy()
		{destroy();}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		shiwuzl  model = new shiwuzl();
		shiwuzlDao  dal  = new shiwuzlDao();
		String action = request.getParameter("action");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new java.util.Date());
		HttpSession session=request.getSession();
		//UserInfo user =(UserInfo)session.getAttribute("user");
		if (action.equals("add")) {
		model.setUserId(Integer.parseInt(request.getParameter("UserId")));
		model.setTitle(request.getParameter("Title"));
		model.setWuPin(request.getParameter("WuPin"));
		model.setTimes(request.getParameter("Times"));
		model.setAddress(request.getParameter("Address"));
		model.setBiaoShi(request.getParameter("BiaoShi"));
		model.setContents(request.getParameter("Contents"));
		model.setLinkName(request.getParameter("LinkName"));
		model.setPhone(request.getParameter("Phone"));
		model.setAddTime(time);
		model.setRemark("");
		if (dal.Add(model) > 0) {
		out.print(CommonMethod.outScript("添加操作成功!", "back"));
		}
		}
		if (action.equals("update")) {
		model = dal.GetModel(Integer.parseInt(request.getParameter("id")));
		model.setUserId(Integer.parseInt(request.getParameter("UserId")));
		model.setTitle(request.getParameter("Title"));
		model.setWuPin(request.getParameter("WuPin"));
		model.setTimes(request.getParameter("Times"));
		model.setAddress(request.getParameter("Address"));
		model.setBiaoShi(request.getParameter("BiaoShi"));
		model.setContents(request.getParameter("Contents"));
		model.setLinkName(request.getParameter("LinkName"));
		model.setPhone(request.getParameter("Phone"));
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
		}
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{this.doGet(request, response);}
		public void init() throws ServletException
		{// Put your code here;
		}
}

