package com.hdq.serlet;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class VoteResultServlet
 */
public class VoteResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public VoteResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
   String id=request.getParameter("sbj_id");
		
		int sid=0;
		if( id!=null){
			 sid= Integer.parseInt(id);
		}
	
		OptionDao dao = new OptionDao();
		List<Option> list=new ArrayList<Option>();
		list=dao.listOpt(sid);
       
        
        Subject  sub=new Subject();
        SubjectDao dao2=new SubjectDao();
        sub=dao2.FindSubject(sid);
        
        
        
        request.setAttribute("optlist",list );
        request.setAttribute("subject",sub );
   
		
		  request.getRequestDispatcher("voteResult.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
