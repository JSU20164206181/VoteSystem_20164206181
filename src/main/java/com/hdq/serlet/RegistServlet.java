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
 * Servlet implementation class RegistServlet
 */
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//账号，密码，验证码
		 String u_id=request.getParameter("id");
		 String u_name=request.getParameter("name");
	     String u_pwd1=request.getParameter("password1");
         UserDao dao=new UserDao();
		//账号验证
		 String uid=request.getParameter("uid2");
		PrintWriter out = response.getWriter();
		if(uid!=null){
			if(dao.isExistName(uid)){
			System.out.println("账号存在");
			out.print("h_id");
			}		
			else {
			System.out.println("账号不存在");
			out.print("n_id");}	
		}
		//添加用户
		User user=new User();
		user.setUser_id(u_id);
		user.setUser_name(u_name);
		user.setUser_password(u_pwd1);
		if( u_id!=null||u_name!=null||u_pwd1!=null){
		
		dao.addUser(user);
		}
		//System.out.println(user);
		
	}

}
