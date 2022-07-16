package com.myProject.ShiWu.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateExample {

	public DateExample() {
	}

	public static long fromDateStringToLong(String inVal) { // �˷�������ʱ�����
		Date date = null; // ����ʱ������
		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			date = inputFormat.parse(inVal); // ���ַ���ת����������
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date.getTime(); // ���غ�����
	}

	private static String dqsj() { // �˷������ڻ�õ�ǰϵͳʱ�䣨��ʽ����2007-11-6 15:10:58��
		Date date = new Date(); // ʵ����������
		String today = date.toLocaleString(); // ��ȡ��ǰʱ��
		System.out.println("��õ�ǰϵͳʱ�� " + today); // ��ʾ
		return today; // ���ص�ǰʱ��
	}

	public static void main(String[] args) {
		String dqsj = dqsj(); // ���String dqsj = dqsj(); //��õ�ǰϵͳʱ��
		DateExample df = new DateExample(); // ʵ���

		long startT = df.fromDateStringToLong("2005-03-03 14:51:23"); // �����ϻ�ʱ��
		long endT = df.fromDateStringToLong("2004-03-03 13:50:23"); // �����»�ʱ��

		long ss = (startT - endT) / (1000); // ��������
		int MM = (int) ss / 60; // ���Ʒ�����
		int hh = (int) ss / 3600; // ����Сʱ��
		int dd = (int) hh / 24; // ��������

		System.out.println("��" + dd + "�� ׼ȷʱ���ǣ�" + hh + " Сʱ " + MM + " ����"
				+ ss + " �� ���ƣ�" + ss * 1000 + " ����");

	}

}
