package com.myProject.ShiWu.util;
//package com.myProject.DianCan.util;
//
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFCell;
//
//import com.myProject.BuddhismManager.dao.UserInfoDao;
//import com.myProject.BuddhismManager.entity.UserInfo;
//
//import java.sql.*;
//import java.io.*;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.Connection;
//import java.text.SimpleDateFormat;
//
//public class ExcelHepler {
//
//	private List<UserInfo> list = new ArrayList<UserInfo>();
//	UserInfoDao dal = new UserInfoDao();
//
//	// 连接数据库
//	public ExcelHepler() throws Exception {
//
//	}
//
//	// 从excel中读取数据存入ArrayList中
//	public List<UserInfo> readExcel(String sFileName) {
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String time = format.format(new java.util.Date());
//		try {
//			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(
//					sFileName));// 读取excel文件
//			HSSFSheet sheet = workbook.getSheetAt(0);// 读取第一个sheet
//			for (int i = 0; i <= sheet.getLastRowNum(); i++)// 循环取得所有行
//			{
//				if (sheet.getRow(i) != null) {
//					HSSFRow aRow = sheet.getRow(i);// 行数
//					HSSFCell name = aRow.getCell((short) 0);// 第一列
//					HSSFCell loginName = aRow.getCell((short) 1);// 第二列
//
//					HSSFCell Phone = aRow.getCell((short) 2);
//					HSSFCell ChuanZhen = aRow.getCell((short) 3);
//					HSSFCell Products = aRow.getCell((short) 4);
//					HSSFCell DiZhi = aRow.getCell((short) 5);
//					// String xh = remark2.getStringCellValue();
//					// String nm = name.getStringCellValue();
//					// String other = "性别:" + sex.getStringCellValue() + ";班级："
//					// + cla.getStringCellValue() + ";专业："
//					// + zhuanye.getStringCellValue() + ";院系:"
//					// + yuanxi.getStringCellValue();
//					// 把数据存入list里备用
//					UserInfo model = new UserInfo();
//					model.setName(name.getStringCellValue());
//					model.setLoginName(loginName.getStringCellValue());
//					model.setPwd("123456");
//					//System.out.print(Phone.getStringCellValue());
//					// 判断储存格的格式
////					switch (Phone.getCellType()) {
////					case HSSFCell.CELL_TYPE_NUMERIC:
////						System.out.print(Double.toString(Phone.getNumericCellValue()));
////						// getNumericCellValue()会回传double值，若不希望出现小数点，请自行转型为int
////						break;
////					case HSSFCell.CELL_TYPE_STRING:
////						System.out.print(Phone.getStringCellValue());
////						break;
////					case HSSFCell.CELL_TYPE_FORMULA:
////						System.out.print(Phone.getNumericCellValue());
////						// 读出公式储存格计算後的值
////						// 若要读出公式内容，可用cell.getCellFormula()
////						break;
////					default:
////						System.out.print("不明的格式");
////						break;
////					}
//					 model.setPhone(Phone.getStringCellValue());
//					 model.setChuanZhen(ChuanZhen.getStringCellValue());
//					 model.setEmail("");
//					 model.setWebURL("");
//					 model.setDiZhi(DiZhi.getStringCellValue());
//					 model.setProducts(Products.getStringCellValue());
//					 model.setDescs("暂无简介");
//					 model.setLogo("");
//					 model.setAddTime(time);
//					 model.setRemark("");
//					list.add(model);
//					// listFirstColum.add((int) cellFirstColum
//					// .getNumericCellValue());// 假定第一列为数字型
//					// listSecondColum.add(cellSecondColum.getStringCellValue());//
//					// 假定第二列为字符串型
//				}
//			}
//			System.out.println("Excel读取成功！");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
//
//	// 从ArrayList中把数据写入数据库
//	public void insertData(String sFileName) {
//		// 读取
//		readExcel(sFileName);
//		try {
//			for (int i = 1; i < list.size(); i++) {
//				dal.Add(list.get(i));
//				System.out.println("正在导入第 " + (i + 1) + " 条记录");
//			}
//			System.out.println("导入完毕！");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void main(String[] args) {
//		try {
//			new ExcelHepler().insertData("E://moban.xls");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//}
