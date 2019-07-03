package com.hdq.serlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdq.dao.OptionDao;
import com.hdq.dao.SubjectDao;
import com.hdq.entity.Subject;

/**
 * Servlet implementation class SubjectUpdataServlet
 */
public class SubjectUpdataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectUpdataServlet() {
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
		String suj_id=request.getParameter("suj_id");
		String title=request.getParameter("suj_title");
		String type=request.getParameter("suj_type");
		String user=request.getParameter("suj_user");
		String[] listoption=request.getParameterValues("opt_option");
		
		
		int type1 = 0;
		int id =0;
		if( type!=null){
			 type1= Integer.parseInt(type);
		} 
		if( suj_id!=null){
			 id= Integer.parseInt(suj_id);
		}
		SubjectDao  dao=new SubjectDao();
		Subject  suj =new Subject();
		suj.setVs_id(id);
		suj.setVs_title(title);
		suj.setVs_type(type1);
		suj.setVu_id(user);
		dao.updataSbj(suj);
		System.out.println(" id "+id);
		System.out.println(" suj "+title);
		
		//
		OptionDao dao2=new OptionDao();
		dao2.updateOpt(listoption,id);
		
		
		
		/*for(int i=0;i<listoption.length;i++){
			System.out.println(" opt: "+listoption[i]);
			}*/
		
		
		
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
