package com.hdq.serlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdq.dao.SubjectDao;
import com.hdq.entity.Subject;

/**
 * Servlet implementation class MySubjectServlet
 */
public class MySubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MySubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();		
		String pagenum=request.getParameter("pagenum1");
		HttpSession session=request.getSession();
		 String uid=(String)session.getAttribute("u_id"); 
		 
		int pagesize=10;
		 
		int pagenumber=1;
		if( pagenum!=null){
		pagenumber=Integer.parseInt(pagenum);}
		//
		 
		
		
		 SubjectDao subjectlist=new SubjectDao();
		 Subject  sub=new Subject();
		 
		  List<Subject> rs=subjectlist.MySubjectList(uid);
		/*  for(int i=0;i<rs.size();i++){
			  sub=rs.get(i);
			  System.out.println(uid+"--sub.getVu_id--"+sub.getVu_id());		
		  }*/
	    
	      int all=rs.size();
		  int pageLast=all/pagesize;
		  if(all%pagesize>0){
			  pageLast++;
		  }		
		  
		
	      request.setAttribute("subjectlist", rs);
	      request.setAttribute("pagenumber1",pagenumber );
	      request.setAttribute("pageLast1",pageLast );
		  request.getRequestDispatcher("mySubject.jsp").forward(request, response);
	    	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
