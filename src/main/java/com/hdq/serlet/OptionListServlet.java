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
 * Servlet implementation class OptionListServlet
 */
public class OptionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptionListServlet() {
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
		
		String id=request.getParameter("sbj_id");
		int id1=0;
		if( id!=null){
			 id1= Integer.parseInt(id);
		}
	
		OptionDao dao = new OptionDao();
		List<Option> list=new ArrayList<Option>();
		list=dao.listOpt(id1);
		
		   request.setAttribute("optlist",list );
		
		
		  request.getRequestDispatcher("optionlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
