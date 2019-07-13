package com.hdq.serlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdq.dao.UserDao;
import com.hdq.entity.User;

/**
 * Servlet implementation class UserUpdateServlet
 */
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		String status=request.getParameter("status");
		String type=request.getParameter("type");
		
		int s=1;
		int t=1;
		if(status!=null){
		s=Integer.parseInt(status);
		
		}
		if(type!=null){
			t=Integer.parseInt(type);
			
			}
		User user=new User();
		UserDao dao=new UserDao();
		user.setUser_id(id);
		user.setUser_status(s);
		user.setUser_type(t);
		System.out.println("status:"+user.getUser_status()+" id:"+user.getUser_id()+" type:"+user.getUser_type());
		dao.updataSbj(user);
		request.getRequestDispatcher("UserListServlet").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
