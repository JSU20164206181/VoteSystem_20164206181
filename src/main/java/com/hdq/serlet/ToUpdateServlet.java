package com.hdq.serlet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		int id = 0;
		if(sbj_id!=null){
		id=Integer.parseInt(sbj_id);}
		//获取主题
		 SubjectDao dao1=new SubjectDao();
		 Subject  sub=new Subject();
		 sub=dao1.FindSubject(id);
		 System.out.println(" test"+sub.getVs_title());
		 //获取选项
		 OptionDao dao2=new OptionDao();
		 List<Option> oplist=dao2.listOpt(id);
		System.out.println("num"+oplist.size());	
		 
		  
		
	     
	      request.setAttribute("subject",sub );
	      request.setAttribute("optionlist",oplist );
		  request.getRequestDispatcher("updatesubject.jsp").forward(request, response);
	    	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
