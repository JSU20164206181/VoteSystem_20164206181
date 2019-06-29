package com.hdq.serlet;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateServlet
 */
public class ValidataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            
		int width = 100, height = 30;
		  BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
		  Graphics g = image.getGraphics();
		  Random random = new Random();
		   // 设定背景色
		    g.setColor(new Color(200+random.nextInt(55),100+random.nextInt(155),155+random.nextInt(100)));
		   g.fillRect(0, 0, width, height);
		   String sRand = "";
		    for (int i = 0; i < 4; i++) {
		    String rand = null;
		   //随机生成数字或者字母
		  if (random.nextInt(10) > 5) {
		      rand = String.valueOf((char)(random.nextInt(10) + 48));}
		   else {
		       rand = String.valueOf((char)(random.nextInt(26) + 65));
	   }
		    sRand += rand;
	}              
		    g.setColor(new Color(random.nextInt(200),random.nextInt(100),random.nextInt(155)));
		    g.setFont(new Font("",Font.BOLD+Font.ITALIC,25));
		    g.drawString(sRand, 15, 25);
		    //线条
		    for (int i = 0; i < 20; i++) {
		    	g.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
		    	  int x = random.nextInt(width);
		    	   int y = random.nextInt(height);
		    	  int xl = random.nextInt(12);
		    	  int yl = random.nextInt(12);
		      g.drawLine(x, y, x + xl, y + yl);
		    }
		    
		    HttpSession session=request.getSession();
		    session.setAttribute("rand", sRand);
		    
		    // 图象生效
		   g.dispose();
		  
		      // 输出图象到页面
		   response.setContentType("image/jpeg");
	       OutputStream out=response.getOutputStream();
	       ImageIO.write(image,"jpeg", out);
	       
	       out.close();
		    }	    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
