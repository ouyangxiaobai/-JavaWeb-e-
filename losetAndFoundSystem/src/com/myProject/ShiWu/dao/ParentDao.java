package com.myProject.ShiWu.dao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.myProject.ShiWu.util.BaseDao;



import sun.misc.BASE64Encoder;


/**
 * ����dao
 * @author ����ľ
 *
 */
public class ParentDao {
	//����һЩ���ñ���
	public int result=0;//�洢ִ��SQL��䷵�صĽ��
	public List<Object> paramsList = null;//�����б�
	public String sql = "";//Ҫִ�е�SQL���
	public BaseDao bd = new BaseDao();
	
	 /**����MD5���м���
     * @param str  ����ܵ��ַ�
     * @return  ���ܺ���ַ�
     * @throws NoSuchAlgorithmException  û�����ֲ�����ϢժҪ���㷨
     * @throws UnsupportedEncodingException  
     */
     public String EncoderByMd5(String str){
    	 try{
    		  //ȷ�����㷽��
    	        MessageDigest md5=MessageDigest.getInstance("MD5");
    	        BASE64Encoder base64en = new BASE64Encoder();
    	        //���ܺ���ַ�
    	        String newstr=base64en.encode(md5.digest(str.getBytes("gbk")));
    	        return newstr;
    		 
    	 }catch(Exception ex){
    		 return"";
    		 
    	 }
      
    }
     
     
     public static void main(String[] args) {
 		// TODO Auto-generated method stub
    	 
    	 System.out.println(new ParentDao().EncoderByMd5("admin"));
    	 System.out.println(new ParentDao().EncoderByMd5("test"));
 	}

}
