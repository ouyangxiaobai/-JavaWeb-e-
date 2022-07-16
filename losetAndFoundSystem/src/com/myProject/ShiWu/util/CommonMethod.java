package com.myProject.ShiWu.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

/**
 * ���õ�һЩ����
 * 
 * @author ����ľ
 * 
 */
public class CommonMethod {
	/**
	 * ���Ȩ��
	 * 
	 * @param rightId
	 */
	public static boolean checkRights(String rightId, String userRights) {
		boolean result = false;
		for (int i = 0; i < userRights.split(",").length; i++) {

			if (userRights.split(",")[i].equals( rightId)) {

				result = true;
				break;
			}
		}
		return result;

	}

	/**
	 * �������ű�
	 * 
	 * @param warnStr
	 * @param linkAddress
	 * @return
	 */
	public static String outScript(String warnStr, String linkAddress) {
		String strScript = "";
		strScript = "<script>";
		if (warnStr != null) {
			strScript += "alert('" + warnStr + "');";
		}
		if (linkAddress != null) {
			if (linkAddress.equals("back")) {
				strScript += "history.go(-1);";
			} else {
				strScript += "window.location.href='/ShiWu/"
						+ linkAddress + "';";
			}

		}
		strScript += "</script>";
		return strScript;
	}

	/**
	 * �жϴ�����ַ��Ƿ�Ϊ�ղ�Ϊ���򷵻ظ��ַ�ȥ����β�ո��ģ�
	 * 
	 * @param str
	 * @return
	 */
	public static String isNull(String str) {
		String result = null;
		if (str != null && str != "") {
			str = str.trim();
			if (str.length() > 0) {
				result = str;
			}
		}
		return result;
	}

	/**
	 * ���ַ�ת��Ϊ���֣�����ת��������֣�ת��ʧ�ܣ�����0��
	 * 
	 * @param str
	 * @return
	 */
	public static int intToString(String str) {
		int result = 0;
		try {
			result = Integer.parseInt(str);
		} catch (Exception ex) {
			result = 0;
		}
		return result;
	}

	/**
	 * ���ָ�����ڵĺ���
	 * 
	 * @param specifiedDay
	 * @param afterDays
	 * @return
	 */
	public static String getSpecifiedDayAfter(String specifiedDay, int afterDays) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (Exception e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + afterDays);

		String dayAfter = new SimpleDateFormat("yyyy-MM-dd")
				.format(c.getTime());
		return dayAfter;
	}

	/**
	 * �Ƚ�����ʱ����Ⱥ�
	 * 
	 * @param firstTime
	 *            ��ǰʱ��
	 * @param secondTime
	 *            ����ʱ��
	 * @param startTime
	 *            ����ʱ��
	 * @return ��һ��ʱ���ڵڶ���ʱ��֮ǰ���ڵ�һ��ʱ��֮�󣬷���0�����򷵻�1
	 */
	public static boolean compareTime(String firstTime, String secondTime,
			String startTime) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = new Date();
		Date date2 = new Date();
		Date date3 = new Date();
		try {
			date1 = (Date) format.parseObject(firstTime);
			date2 = (Date) format.parseObject(secondTime);
			date3 = (Date) format.parseObject(startTime);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			return false;
		}
		if (date3.after(date1) && date3.before(date2)) {
			// System.out.println("date1:::" + date1);
			return true;
		} else {
			// System.out.println("date2:::" + date2);
			return false;
		}

	}
}
