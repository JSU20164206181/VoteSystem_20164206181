<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all">
<title>投票列表</title>
</head>
<body>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="com.hdq.dao.*" %>
<%@ page import="java.util.List" %>


     
     <% 
      String uid=(String)session.getAttribute("u_id");
     
     List<Subject>  list1=(List<Subject>)request.getAttribute("subjectlist");
    // System.out.println(" @@@@"+list1.size());
     if(list1!=null){
     int  pageLast1=(Integer)request.getAttribute("pageLast1");	
     int  pagenumber1=(Integer)request.getAttribute("pagenumber1"); 
     //System.out.println(" @@@@111"+pagenumber1);
    %>

	
<div class="main">
  <div class="header" >
    <div class="header_resize" >
      <div class="logo">
      	
        <h1><a href="index.html"> 在线 投票系统<small>Cast your vote</small></a></h1>
      </div>
      <div class="search">
        <form method="get" id="search" action="">
          <span>
          <input type="text" value="Search..." name="s" id="s" />
          <input name="searchsubmit" type="image" src="images/search.gif" value="Go" id="searchsubmit" class="btn"  />
          </span>
        </form>
        <!--/searchform -->
      </div>
      <div class="clr"></div>
    </div>
      <div class="clr"></div>
    <div class="menu_header" style="width: 98%;margin-left: 1%;">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html">话题列表</a></li>
          <li><a href="support.html">我的话题</a></li>
          <li><a href="about.html">退出</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </div>
      <div class="clr"></div>
  </div>
 </div>
 
 <div id="" class="maincont" style="background:  #2D3439; width: 100%; height: 800px; opacity:0.8;">
 	
 	<div id=""style="background:  whitesmoke; width: 98%; height: 720px;margin-left: 1%; ">
 		<% 
  	for(int i=0;i<list1.size();i++)
	{
		Subject sbj=(Subject)list1.get(i);
		// System.out.println(" @@@222  "+sbj.getVs_id());
	%>
		<!--userlist  -->
		<p><%= sbj.getVs_id() %>
     
          <a  href="voteResult?sbj_id=<%= sbj.getVs_id() %>"> <%= sbj.getVs_title()%> 
          </a>
        	<%= sbj.getVs_type() %>
        
        <%= sbj.getVu_id() %>
        <%= sbj.getOption_num() %>
        <%= sbj.getItem_num() %>
        
        <%
        ItemDao dao3=new ItemDao();
        String status;
        if(dao3.haveIteam(uid,sbj.getVs_id())>0){%>
        	<a  href="#">已投票 </a>
        	
       <%  }
        else{%>
        	<a  href="OptionListServlet?sbj_id=<%= sbj.getVs_id() %>"> 参与投票 </a>
        <%}%>
  
         
        </p>
 
<%
   }//--forend%>
    <% if(String.valueOf(pagenumber1)!=null&&String.valueOf(pageLast1)!=null)
	{
		out.println(""+pagenumber1+"/"+pageLast1+"");
		if(pagenumber1>1)
		{out.println("<a  href='SubjectListServlet?pagenum1="+(pagenumber1-1)+"' >&nbsp上一页</a>");
		}
		else
		{
			out.println("<a style='color: #975f2e;'>&nbsp上一页</a>");
		}
	    
		if(pagenumber1<pageLast1)
		{out.println("<a href='SubjectListServlet?pagenum1="+(pagenumber1+1)+"'>&nbsp;&nbsp&nbsp;下一页</a>");
		}
		else
		{
			out.println("<a style='color: #975f2e;'>&nbsp下一页");
		}
  }
     }
     
     
 %> 
 <a href="addsubject.jsp">发起投票</a>
<a href="mySubject">我的投票</a>
<a href="SofaExitServlet">安全退出</a>
 	</div>
 </div>
  
</body>
</html>