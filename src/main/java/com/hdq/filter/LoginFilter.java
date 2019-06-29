package com.hdq.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		     HttpServletRequest request=(HttpServletRequest)arg0;
		     HttpServletResponse response=(HttpServletResponse)arg1;
		     HttpSession session=request.getSession();
		     
		     
		    String uid=(String)session.getAttribute("u_id");
		    String upwd=(String)session.getAttribute("u_pwd");
		    
		       if(uid!=null&&upwd!=null&&uid.equals("")&&upwd.equals("")){
		    	
		    	   arg2.doFilter(arg0, arg1);
		    	  
		       }else{
		    	   
		    	   response.sendRedirect("index.jsp");
		       }
		     
		    	  
		     
		      
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
