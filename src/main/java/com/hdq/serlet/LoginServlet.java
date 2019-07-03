package com.hdq.serlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdq.dao.UserDao;
import com.hdq.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//账号，密码，验证码
		 String u_id=request.getParameter("id");
	     String u_pwd=request.getParameter("pwd");
	     String u_vad=request.getParameter("vad");
	     String log=request.getParameter("log");
	     HttpSession session=request.getSession();
	     
	     session.setAttribute("log", log);
  	  
	    String vad=(String)session.getAttribute("rand");
	     
		
		UserDao dao=new UserDao();
		//账号验证
		 String uid=request.getParameter("uid");
		PrintWriter out = response.getWriter();
		if(uid!=null&&dao.isExistName(uid)){
			System.out.println("账号存在");
			out.print("h_id");
			
		}
		else if(uid!=null&&(!dao.isExistName(uid))){
			System.out.println("账号不存在");
			out.print("n_id");
			
		}
		if(u_id!=null&&u_id!=""){
		session.setAttribute("u_id", u_id);
		}
		//验证码验证
		if(u_vad!=null &&u_vad!=""&&vad!=null&&vad!=""){	
		if(vad.equalsIgnoreCase(u_vad)){
			System.out.println("验证码正确");
		}
		else{
			System.out.println("验证码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}	}
		
		//密码验证
		if(u_pwd!=null&&u_pwd!=""&&u_id!=null&&u_id!=""){
		if(dao.findPassWord(u_id).equals(u_pwd)){
			System.out.println("密码正确");
	  	   session.setAttribute("u_pwd", u_pwd);
	  	 session.setAttribute("u_type",dao.findType(u_id));
		      if(dao.findType(u_id).equals("9")){
		    	  request.getRequestDispatcher("backstage.jsp").forward(request, response);		
		      }
		      else{
		    	  request.getRequestDispatcher("SubjectListServlet").forward(request, response);		 
		      }
		}
		else{
			System.out.println("密码错误" +dao.findPassWord(u_id) +" --" +u_pwd);
			request.getRequestDispatcher("index.jsp").forward(request, response);			
		}
		}
		
		
		
	}

}
