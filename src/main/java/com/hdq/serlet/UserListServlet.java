package com.hdq.serlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdq.dao.UserDao;
import com.hdq.entity.Subject;
import com.hdq.entity.User;

/**
 * Servlet implementation class UserListServlet
 */
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String pagenum=request.getParameter("pagenum1");
		  HttpSession session=request.getSession();
		  String uid=(String)session.getAttribute("u_id"); 
		  String u_type=(String)session.getAttribute("u_type"); 
		  
		  if(u_type.equals("9"))
		  {
		  int pagesize=10;
		 
		  int pagenumber=1;
	      if( pagenum!=null){
		  pagenumber=Integer.parseInt(pagenum);}
	      int star=(pagenumber-1)*pagesize;
			
		  UserDao userlist=new UserDao();
		    
		  int all=userlist.getNum();
		  int pageLast=all/pagesize;
		  if(all%pagesize>0){
				  pageLast++;
		  }
		
		
		  List<User> rs=userlist.SubjectList(star,pagesize);
          request.setAttribute("userList", rs);
	      request.setAttribute("pagenumber1",pagenumber );
	      request.setAttribute("pageLast1",pageLast );
		  request.getRequestDispatcher("userList.jsp").forward(request, response);
		  }
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
