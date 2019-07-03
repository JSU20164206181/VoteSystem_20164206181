package com.hdq.serlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdq.dao.ItemDao;
import com.hdq.dao.OptionDao;
import com.hdq.entity.Item;

/**
 * Servlet implementation class TakeOptionServlet
 */
public class TakeOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeOptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sub_id=request.getParameter("subject");
		String[] listoption=request.getParameterValues("option");
		HttpSession session=request.getSession();
	    String uid=(String)session.getAttribute("u_id");	
	    
		int sid = 0;
		if( sub_id!=null){
			sid= Integer.parseInt(sub_id);
		}		
		ItemDao  dao=new ItemDao();		
		Item item =new Item();
		System.out.println(" length:"+listoption.length+"Uid:"+ uid+"SID:"+ sid);
		dao.addIteam(listoption, uid, sid);
	
		 request.getRequestDispatcher("SubjectListServlet").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
