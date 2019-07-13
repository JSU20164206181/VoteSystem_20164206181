package com.hdq.serlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdq.dao.UserDao;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//账号，密码，验证码
    	
		 String user=request.getParameter("user"); 
	     JSONObject jo = JSONObject.fromObject(user);
	    
	    String uid=(String)jo.get("count");
	    String upas=(String)jo.get("password"); 
	    String urand=(String)jo.get("rand");
	    System.out.print("upas="+upas+"uid="+uid);
	  	     
	     HttpSession session=request.getSession();
	     UserDao dao=new UserDao();
	     PrintWriter out = response.getWriter();
	    String vad=(String)session.getAttribute("rand");
	  
	   
		//账号验证	
		if(uid!=null&&dao.isExistName(uid)){
			System.out.println("账号存在");
			session.setAttribute("u_id", uid);
			//密码
			if(dao.findPassWord(uid).equals(upas)){
				System.out.println("密码正确");
		  	   session.setAttribute("u_pwd", upas);
		  	   session.setAttribute("u_type",dao.findType(uid));
		  	   //yzm
		  	 if(vad.equalsIgnoreCase(urand)){
					System.out.println("验证码正确"+dao.findStatus(uid));
					if(dao.findStatus(uid).equals("0")){
						System.out.println("已禁用");
						out.print("bin");
					}
					else{
					out.print("success");}
		  		   // response.sendRedirect("SubjectListServlet");
		  		 
				}
				else{
					System.out.println("验证码错误");
					out.print("randerror");
				}	
				
		
				
			    		 
			}
			else{
				System.out.println("密码错误" );
				out.print("pwderror");
							
			}
			
		}
		else if(uid!=null&&(!dao.isExistName(uid))){
			System.out.println("账号不存在");
			out.print("nologincode");		
		}
		
		
		
		
	
		
		
	}

}
