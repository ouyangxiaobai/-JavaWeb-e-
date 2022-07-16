package com.myProject.ShiWu.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.jsp.jstl.sql.Result;
import com.myProject.ShiWu.entity.*;

public class userinfoDao extends ParentDao {
	/*** 获得最大ID** @return */
	public int GetMaxId() {
		sql = "select max(id) from userinfo";
		result = Integer.parseInt(bd.getSingle(sql, null).toString());
		return result;
	}

	/*** 添加** @return */
	public int Add(userinfo model) {
		sql = "insert into userinfo( Name,LoginName,Pwd,Phone,Email,Address,Role,AddTime,Remark) values (?,?,?,?,?,?,?,?,?)";
		paramsList = new ArrayList<Object>();
		
		paramsList.add(model.getName());
		paramsList.add(model.getLoginName());
		paramsList.add(model.getPwd());
		paramsList.add(model.getPhone());
		paramsList.add(model.getEmail());
		paramsList.add(model.getAddress());
		paramsList.add(model.getRole());
		paramsList.add(model.getAddTime());
		paramsList.add(model.getRemark());

		result = bd.getAffectRow(sql, paramsList);
		return result;
	}

	/*** 修改** @return */
	public int Update(userinfo model) {
		sql = " update  userinfo set  Name=?,LoginName=?,Pwd=?,Phone=?,Email=?,Address=?,Role=?,AddTime=?,Remark=? where Id=?";
		paramsList = new ArrayList<Object>();
		paramsList.add(model.getName());
		paramsList.add(model.getLoginName());
		paramsList.add(model.getPwd());
		paramsList.add(model.getPhone());
		paramsList.add(model.getEmail());
		paramsList.add(model.getAddress());
		paramsList.add(model.getRole());
		paramsList.add(model.getAddTime());
		paramsList.add(model.getRemark());
		paramsList.add(model.getId());

		result = bd.getAffectRow(sql, paramsList);
		return result;
	}

	/*** 删除** @return */
	public int Delete(int id) {
		sql = "delete from userinfo where id=" + id;
		result = bd.getAffectRow(sql, paramsList);
		return result;
	}

	/*** 得到实体** @return */
	public userinfo GetModel(int id) {
		sql = "select * from userinfo where id=" + id;
		userinfo model = null;
		Result res = bd.getResultSet(sql, paramsList);
		if (res != null && res.getRowCount() == 1) {// 存在数据
			// Result的每一行数据以key—value的形式保存（即Map）
			model = new userinfo();
			Map row = res.getRows()[0];
			model.setId((Integer) row.get("Id"));
			model.setName((String) row.get("Name"));
			model.setLoginName((String) row.get("LoginName"));
			model.setPwd((String) row.get("Pwd"));
			model.setPhone((String) row.get("Phone"));
			model.setEmail((String) row.get("Email"));
			model.setAddress((String) row.get("Address"));
			model.setRole((String) row.get("Role"));
			model.setAddTime((String) row.get("AddTime"));
			model.setRemark((String) row.get("Remark"));
		}
		return model;
	}

	/*** 得到列表** @return */
	public List<userinfo> GetList(String strWhere) {
		List<userinfo> list = null;
		sql = "select * from userinfo ";
		if (!strWhere.equals("")) {
			sql += " where " + strWhere;
		}
		sql += " order by id Desc ";
		Result res = bd.getResultSet(sql, paramsList);
		if (res != null && res.getRowCount() > 0) {// 存在数据
			list = new ArrayList<userinfo>();// 开始循环
			for (int i = 0; i < res.getRowCount(); i++) {
				// Result的每一行数据以key—value的形式保存（即Map）
				Map row = res.getRows()[i];
				userinfo model = new userinfo();
				model.setId((Integer) row.get("Id"));
				model.setName((String) row.get("Name"));
				model.setLoginName((String) row.get("LoginName"));
				model.setPwd((String) row.get("Pwd"));
				model.setPhone((String) row.get("Phone"));
				model.setEmail((String) row.get("Email"));
				model.setAddress((String) row.get("Address"));
				model.setRole((String) row.get("Role"));
				model.setAddTime((String) row.get("AddTime"));
				model.setRemark((String) row.get("Remark"));
				list.add(model);
			}
		}
		return list;
	}

	/*** 得到分页列表** 第一页是1，SQLServer版本 @return */
	public List<userinfo> GetListByPage(int pageSize, int currentPage,
			String strWhere) {
		if (strWhere.equals("")) {
			strWhere = " 1=1 ";
		}
		List<userinfo> list = null;
		sql = "select top " + pageSize + " * from userinfo ";
		String sw = " where " + strWhere + " order by id Desc ";
		sql += " where " + strWhere;
		if (currentPage > 1) {
			sql += " and id not in(select top "
					+ (pageSize * (currentPage - 1)) + " id from userinfo "
					+ sw + " ) ";
		}
		sql += " order by id Desc ";
		Result res = bd.getResultSet(sql, paramsList);
		if (res != null && res.getRowCount() > 0) {// 存在数据
			list = new ArrayList<userinfo>();// 开始循环
			for (int i = 0; i < res.getRowCount(); i++) {
				// Result的每一行数据以key—value的形式保存（即Map）
				Map row = res.getRows()[i];
				userinfo model = new userinfo();
				model.setId((Integer) row.get("Id"));
				model.setName((String) row.get("Name"));
				model.setLoginName((String) row.get("LoginName"));
				model.setPwd((String) row.get("Pwd"));
				model.setPhone((String) row.get("Phone"));
				model.setEmail((String) row.get("Email"));
				model.setAddress((String) row.get("Address"));
				model.setRole((String) row.get("Role"));
				model.setAddTime((String) row.get("AddTime"));
				model.setRemark((String) row.get("Remark"));
				list.add(model);
			}
		}
		return list;
	}

	/*** 得到分页列表** 第一页是1，MySQL版本 @return */
	public List<userinfo> GetListByPage2(int pageSize, int currentPage,
			String strWhere) {
		if (strWhere.equals("")) {
			strWhere = " 1=1 ";
		}
		List<userinfo> list = null;
		int startIndex = 0;// mysql行索引从0开始
		int endIndex = pageSize;
		sql = "select  * from userinfo ";
		String sw = " where " + strWhere + " order by id Desc ";
		// sql +=" where " + strWhere ;
		if (currentPage > 1) {
			startIndex = pageSize * (currentPage - 1);
			// endIndex = pageSize * currentPage;
		}
		sql += sw + " limit " + startIndex + "," + endIndex;
		Result res = bd.getResultSet(sql, paramsList);
		if (res != null && res.getRowCount() > 0) {// 存在数据
			list = new ArrayList<userinfo>();// 开始循环
			for (int i = 0; i < res.getRowCount(); i++) {
				// Result的每一行数据以key—value的形式保存（即Map）
				Map row = res.getRows()[i];
				userinfo model = new userinfo();
				model.setId((Integer) row.get("Id"));
				model.setName((String) row.get("Name"));
				model.setLoginName((String) row.get("LoginName"));
				model.setPwd((String) row.get("Pwd"));
				model.setPhone((String) row.get("Phone"));
				model.setEmail((String) row.get("Email"));
				model.setAddress((String) row.get("Address"));
				model.setRole((String) row.get("Role"));
				model.setAddTime((String) row.get("AddTime"));
				model.setRemark((String) row.get("Remark"));
				list.add(model);
			}
		}
		return list;
	}

	/** 得到分页信息 */
	public String GetPager(int pageSize, int currentPage, String strWhere) {
		List<userinfo> list = this.GetList(strWhere);
		int totalCount = 0;
		if (list != null && list.size() > 0) {
			totalCount = list.size();
		} else {
			return "";
		}
		int pageCount = 0;
		if (totalCount % pageSize == 0) {
			pageCount = totalCount / pageSize;
		} else {
			pageCount = (totalCount / pageSize) + 1;
		}
		String strPage = "";
		strPage += ("<div class=\"message\">共有<i class=\"blue\">" + totalCount + "</i>条记录&nbsp");
		strPage += ("总页数:" + pageCount);
		strPage += ("&nbsp每页显示条数:" + pageSize);
		strPage += ("&nbsp当前是第<i class=\"blue\">" + (currentPage) + "</i>页&nbsp");
		strPage += (" <ul class=\"paginList\">");
		strPage += (" <li class=\"paginItem\"><a href=\"List.jsp?page=1\"><span class=\"pagepre\"></span></a></li>");
		strPage += ("<li class=\"paginItem\"><a href=\"List.jsp?page="
				+ (currentPage > 1 ? currentPage - 1 : 1) + "\">UP</a></li>");
		strPage += ("<li class=\"paginItem\"><a href=\"List.jsp?page="
				+ (currentPage < pageCount ? currentPage + 1 : currentPage) + "\">Next</a></li>");
		strPage += (" <li class=\"paginItem\"><a href=\"List.jsp?page="
				+ pageCount + "\"><span class=\"pagenxt\"></span></a></li>");
		strPage += (" </ul>");
		strPage += (" </ul>");
		return strPage;
	}

}
