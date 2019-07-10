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
		//账号，密码
		 String u_id=request.getParameter("id");
		 String u_name=request.getParameter("name");
	     String u_pwd1=request.getParameter("password1");
	     String u_age=request.getParameter("age");
	     String u_phone=request.getParameter("phone");
	     String u_sex=request.getParameter("sex");
         UserDao dao=new UserDao();
        
		 String uid=request.getParameter("uid2");
		 System.out.println("aaaabbbb"+u_id);
		 if(u_id==null){
		PrintWriter out = response.getWriter();
		
			if(dao.isExistName(uid)){
			System.out.println("账号存在");
			out.print("h_id_r");
			}		
			else {
			System.out.println("账号不存在");
			out.print("n_id_r");}	
		 }
		//添加用户
		User user=new User();
		user.setUser_id(u_id);
		user.setUser_name(u_name);
		user.setUser_password(u_pwd1);
		user.setUser_age(u_age);
		user.setUser_sex(u_sex);
		user.setUser_phone(u_phone);
		if( u_id!=null&&u_name!=null&&u_pwd1!=null){
		
		dao.addUser(user);
		if(user.getUser_sex()!=null){
			dao.update(user, 1);
		}			
		if(user.getUser_age()!=null){
			dao.update(user, 2);
		}if(user.getUser_phone()!=null){
			dao.update(user, 3);
		}if(user.getUser_sex()!=null&&user.getUser_sex()!=" "
				&&user.getUser_phone()!=null&&user.getUser_phone()!=" "
				&&user.getUser_age()!=null&&user.getUser_age()!=""){
			dao.update(user, 4);
		} 
		/*request.getRequestDispatcher("index.jsp").forward(request, response);	*/
		response.sendRedirect("index.jsp");
		}
		//System.out.println(user);
		
	}

}
