package com.myProject.ShiWu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

/**
 * ��ݷ��ʹ�����
 * 
 * @author ����ľ
 * 
 */
public class BaseDao {

	// ����MSSQL 2005
//	public final static String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	public final static String URL = "jdbc:sqlserver://localhost:12238;DataBaseName=BuddhismManager";
//	public final static String DBNAME = "sa";
//	public final static String DBPASS = "sa";

	
	 // ����mysql5.0 
	  public final static String DRIVER = "org.gjt.mm.mysql.Driver";
	  public final static String URL = "jdbc:mysql://localhost/ShiWu?user=root&password=123456&useUnicode=true&characterEncoding=utf8";
	 
	// ����acces2003
	// public final static String DRIVER = "sun.jdbc.odbc.JdbcOdbcDriver";
	// public final static String URL =
	// "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=D:\\Myeclipse\\Workspace\\accessDB\\passengerTicketingSystem.mdb";
	// ���ñ���
	private Connection executeConn = null;
	private PreparedStatement executePstmt = null;
	private ResultSet executeRes = null;
	private int result = 0;

	/**
	 * ��ȡ����
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return con;
	}

	/**
	 * �ر�
	 * 
	 * @param rs
	 * @param ps
	 * @param con
	 */
	public static void closeAll(ResultSet rs, PreparedStatement ps,
			Connection con) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ִ��sql��䣬������Ӱ�������������²����������
	 * 
	 * @param sql
	 * @param paramList
	 * @return int
	 */
	public int getAffectRow(String sql, List<Object> paramsList) {
		try {
			executeConn = getConnection();// �������
			executePstmt = executeConn.prepareStatement(sql);
			useParam(paramsList);// ʹ�ò���
			if (sql.indexOf(";") != -1) {// ��Ҫ�������²����������
				executeRes = executePstmt.executeQuery();
				if (executeRes.next()) {
					result = executeRes.getInt(1);// �������²����������
				}
			} else {
				result = executePstmt.executeUpdate();// ������Ӱ�������
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(executeRes, executePstmt, executeConn);
		}
		return result;
	}

	/**
	 * ���ص���ֵ
	 * 
	 * @param sql
	 * @param paramList
	 * @return Object
	 */
	public Object getSingle(String sql, List<Object> paramsList) {
		Object obj = null;
		try {
			executeConn = this.getConnection();// �������
			executePstmt = executeConn.prepareStatement(sql);
			useParam(paramsList);// ʹ�ò���
			executeRes = executePstmt.executeQuery();
			if (executeRes.next()) {
				obj = executeRes.getObject(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(executeRes, executePstmt, executeConn);
		}
		return obj;
	}

	/**
	 * ִ��SQL��䣬���ؽ��
	 * 
	 * @param sql
	 * @param paramList
	 * @return Result
	 */
	public Result getResultSet(String sql, List<Object> paramsList) {
		Result res = null;
		try {
			executeConn = getConnection();// �������
			executePstmt = executeConn.prepareStatement(sql);
			useParam(paramsList);// ʹ�ò���
			executeRes = executePstmt.executeQuery();// ��ý��
			res = ResultSupport.toResult(executeRes);// �����ת����ΪResult���Ա��ⲻ�ܹرո�������
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(executeRes, executePstmt, executeConn);
		}
		return res;
	}

	/**
	 * ʹ�ò���
	 * 
	 * @param paramList
	 *            �����
	 */
	private void useParam(List<Object> paramsList) throws SQLException {
		if (paramsList != null && paramsList.size() > 0) {
			for (int i = 0; i < paramsList.size(); i++) {
				executePstmt.setObject(i + 1, paramsList.get(i));
			}
		}
	}
	
	public static void main(String[] args){
		int a=10;
		int b=8;
		int c=20/8;
		SimpleDateFormat f = new SimpleDateFormat("yyyyMM");
		String t = f.format(new java.util.Date());
		System.out.print(new java.util.Date().getYear());
	}
}
