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
 * Servlet implementation class SubjectAddServlet
 */
public class SubjectAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String title=request.getParameter("suj_title");
		String type=request.getParameter("suj_type");
		String ch=request.getParameter("suj_choseNum");
		String user=request.getParameter("suj_user");
		String[] listoption=request.getParameterValues("opt_option");
		
		
		
		int type1 = 0;
		if( type!=null){
			 type1= Integer.parseInt(type);
		}
		int chose_num = 0;
		if( ch!=null){
			 chose_num= Integer.parseInt(ch);
		}
		SubjectDao  dao=new SubjectDao();
		Subject  suj =new Subject();
		suj.setVs_title(title);
		suj.setVs_type(type1);
		suj.setVu_id(user);
		suj.setChose_num(chose_num);
		dao.addSbj(suj);
		//
		OptionDao dao2=new OptionDao();
		dao2.addOpt(listoption, dao.getSbjId(title));

		 request.getRequestDispatcher("MySubjectServlet").forward(request, response);
	    	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
