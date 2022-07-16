package com.myProject.ShiWu.util;

import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.List;
import java.io.*;

public class Encry {
	public static List<Object> getEncry(String soureText) throws Exception {
		String msg = soureText;
		// System.out.println("ԭ����:" + msg);
		byte[] msgBytes = msg.getBytes();
		// �γ�RSA��Կ��
		KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
		keyGen.initialize(1024);
		// ��ɹ�Կ��˽Կ��
		KeyPair key = keyGen.generateKeyPair();
		// ʵ��Signature�����ڲ�������ǩ��ָ����RSA��SHA�㷨
		Signature sig = Signature.getInstance("SHA1WithRSA");
		// �õ�˽Կ
		PrivateKey privateKey = key.getPrivate();
		// ��˽Կ����ʼ������ǩ�����
		sig.initSign(privateKey);
		// ��msgBytesʵʩǩ��
		sig.update(msgBytes);
		// ���ǩ���������ֽ�����signatureBytes
		byte[] signatureBytes = sig.sign();
		String signature = new String(signatureBytes);
		// System.out.println("ǩ����:" + signature);
		// Validate(soureText, key, sig, signatureBytes);
		List<Object> list = new ArrayList<Object>();
		list.add(signature);
		list.add(soureText);
		list.add(key);
		list.add(sig);
		list.add(signatureBytes);
		return list;
	}

	public static boolean Validate(List<Object> list)
			throws InvalidKeyException, SignatureException {
		byte[] msgBytes = ((String) list.get(1)).getBytes();

		// ʹ�ù��_��֤
		PublicKey publicKey = ((KeyPair) list.get(2)).getPublic();
		((Signature) list.get(3)).initVerify(publicKey);
		// ��msgBytes����ʵʩǩ��
		((Signature) list.get(3)).update(msgBytes);
		try {
			if (((Signature) list.get(3)).verify((byte[]) list.get(4))) {
				System.out.println("ǩ����֤�ɹ�");
				return true;
			} else {
				System.out.println("ǩ����֤ʧ��");
				return false;
			}
		} catch (SignatureException e) {
			System.out.println("ǩ���쳣");
			return false;
		}
	}

	public static void main(String[] args) {
		try {
			List<Object> list =getEncry("1");
			String s = (String) list.get(0);
			System.out.println(s);
			Validate(list);
			System.out.println(System.getProperty("user.dir"));
			// if(new
			// BaseDao().getResultSet("select * from userinfo where id=1 ",
			// null).getRows()[0].get("likeType").equals(s)){
			// System.out.println("true");
			// }else{
			// System.out.println("false");
			// }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void createNewFile(String fileDirectoryAndName,
			String fileContent) {
		try {
			String fileName = fileDirectoryAndName;
			// ����File���󣬲���ΪString���ͣ���ʾĿ¼��
			File myFile = new File(fileName);
			// �ж��ļ��Ƿ���ڣ������������createNewFile()����������Ŀ¼�����������쳣�������
			if (!myFile.exists())
				myFile.createNewFile();
			else
				// ���������ӳ��쳣
				throw new Exception("The new file already exists!");
			// ��������д�봴�����ļ��������½��ļ���Ϊ����FileWriter����
			FileWriter resultFile = new FileWriter(myFile);
			// �Ѹö����װ��PrinterWriter����
			PrintWriter myNewFile = new PrintWriter(resultFile);
			// ��ͨ��PrinterWriter�����println()�������ַ����д���½��ļ�
			myNewFile.println(fileContent);
			resultFile.close(); // �ر��ļ�д����
		} catch (Exception ex) {
			System.out.println("�޷��������ļ���");
			ex.printStackTrace();
		}
	}

}
