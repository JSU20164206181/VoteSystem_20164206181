package com.hdq.serlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdq.dao.SubjectDao;
import com.hdq.entity.Subject;

/**
 * Servlet implementation class SubjectListServlet
 */
@WebServlet("/SubjectListServlet")
public class SubjectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
    	
		String pagenum=request.getParameter("pagenum1");
		
		int pagesize=10;
		 
		int pagenumber=1;
		if( pagenum!=null){
		pagenumber=Integer.parseInt(pagenum);}
		//
		 
		 int star=(pagenumber-1)*pagesize;
		
		 SubjectDao subjectlist=new SubjectDao();
	    
	    int all=subjectlist.getSbjNum();
		  int pageLast=all/pagesize;
		  if(all%pagesize>0){
			  pageLast++;
		  }
		 
		  List<Subject> rs=subjectlist.SubjectList(star,pagesize );
		 
		 /*System.out.println(star+"---aaaaaaaaaa-----test2---"+rs.size());
		  System.out.println( pagenumber);
		  System.out.println( pageLast);*/
			
		  
	      request.setAttribute("subjectlist", rs);
	      request.setAttribute("pagenumber1",pagenumber );
	      request.setAttribute("pageLast1",pageLast );
		  request.getRequestDispatcher("votelist.jsp").forward(request, response);
	    	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
