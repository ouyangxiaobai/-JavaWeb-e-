package com.myProject.ShiWu.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * ������֤��
 * @author ����ľ
 *
 */
public class ProVerify extends HttpServlet{
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   // TODO Auto-generated method stub
   doPost(request, response);
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   //ȥ������
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setDateHeader("Expires", 0);
    
    int width=60, height=20;
      BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

      // ��ȡͼ��������
      Graphics g = image.getGraphics();

      //��������
      Random random = new Random();

      // �趨����ɫ
      g.setColor(getRandColor(200,250));
      g.fillRect(0, 0, width, height);

      //�趨����
      g.setFont(new Font("Times New Roman",Font.PLAIN,18));

      //���߿�
      //g.setColor(new Color());
      //g.drawRect(0,0,width-1,height-1);
      // ������150�������ߣ�ʹͼ���е���֤�벻�ױ��������̽�⵽
      g.setColor(getRandColor(160,200));
      for (int i=0;i<150;i++)
      {
       int x = random.nextInt(width);
       int y = random.nextInt(height);
              int xl = random.nextInt(12);
              int yl = random.nextInt(12);
       g.drawLine(x,y,x+xl,y+yl);
      }

      // ȡ���������֤��(4λ����)
      String sRand="";
      for (int i=0;i<4;i++){
          String rand=String.valueOf(random.nextInt(10));
          sRand+=rand;
          // ����֤����ʾ��ͼ����
          g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));//���ú����������ɫ��ͬ����������Ϊ����̫�ӽ�����ֻ��ֱ�����
          g.drawString(rand,13*i+6,16);
      }
      Cookie cookie = new Cookie("CheckCode",sRand);
      response.addCookie(cookie);
      // ����֤�����SESSION
      //request.getSession().setAttribute("rand",sRand);
      // ��ͼ
      g.dispose();
      // ���ͼ��
      ImageIO.write(image, "JPEG", response.getOutputStream());
}
/*
* ��ȡ�����ɫ
*/
Color getRandColor(int fc,int bc){
     //��Χ��������ɫ
              Random random = new Random();
              if(fc>255) fc=255;
              if(bc>255) bc=255;
              int r=fc+random.nextInt(bc-fc);
              int g=fc+random.nextInt(bc-fc);
              int b=fc+random.nextInt(bc-fc);
              return new Color(r,g,b);
              }

}

 

