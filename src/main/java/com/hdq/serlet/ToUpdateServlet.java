package com.hdq.serlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdq.dao.OptionDao;
import com.hdq.dao.SubjectDao;
import com.hdq.entity.Option;
import com.hdq.entity.Subject;
/**
 * Servlet implementation class ToUpdateServlet
 */
public class ToUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 public ToUpdateServlet() {
        super();
    }
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		  String sbj_id=(String)request.getParameter("sbj_id");
		  String s_id_ajax=request.getParameter("s_id_ajax");
		 
		 SubjectDao dao1=new SubjectDao();
		 Subject  sub=new Subject();
		 
		PrintWriter out = response.getWriter();
		int id = 0;
		/* int s_id_ajax1=0;
		 if(s_id_ajax!=null){
		 s_id_ajax1=Integer.parseInt(s_id_ajax);
		 
		 if(dao1.getItemNum(s_id_ajax1)!=0){
				System.out.println("有用户投票");
				out.print("h");
				
			}
		 }*/
		
		if(sbj_id!=null){		
		id=Integer.parseInt(sbj_id);
	    sub=dao1.FindSubject(id);
		 System.out.println(" test"+sub.getVs_title());
		 //获取选项
		 OptionDao dao2=new OptionDao();
		 List<Option> oplist=dao2.listOpt(id);
		 
		 
		//System.out.println("num"+oplist.size());		 
	      request.setAttribute("subject",sub );
	      request.setAttribute("optionlist",oplist );
		  request.getRequestDispatcher("updatesubject.jsp").forward(request, response);
		
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
