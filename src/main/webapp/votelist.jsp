<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <div class="header_resize">
      <div class="logo">
      	
        <h1><a href="index.jsp">在线投票系统<small>Cast your vote</small></a></h1>
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
        <li><a href="#">首页</a> </li>
          <li class="active"><a href="SubjectListServlet">投票列表</a></li>
          <li><a href="mySubject">我的话题</a></li>
          <li><a href="SofaExitServlet">安全退出</a></li>
          
        </ul>
      </div>
    </div>
      <div class="clr"></div>
  </div>
 </div>
 
 <div  class="maincont">
 	<div id="" class="maincont_top" >	</div>
 	<div id="" class="maincont_top_1" >	</div>
 	<div class="maincont_middle" >
 	 <div class="listcontant"  >
 	 	
 		<% 
  	for(int i=0;i<list1.size();i++)
	{
		Subject sbj=(Subject)list1.get(i);
		// System.out.println(" @@@222  "+sbj.getVs_id());
		
	%>
		<div id="" class="list">
              <%if(i==list1.size()-1){ %>
               <div class="row" style=" border: solid 3px #7b7a7a ;" >
              <%}else{ %>
              
 	 			   <div class="row" >
 	 			   <%} %>
		<!--userlist  -->
		<div class="col-md-6 col-lg-8" >
      	<h3><%= (pagenumber1-1)*10+i+1 %>  &nbsp;&nbsp;&nbsp; 
      	<a  href="voteResult?sbj_id=<%= sbj.getVs_id() %>"> <%= sbj.getVs_title()%> </a>
 	 </h3>  
      	<p style="margin-left: 50px;">
      	此投票共 
      	<span style="color:blue;font-size: 14px;">&nbsp;<%= sbj.getOption_num() %> </span>
                    个选项 ，  已获得
      	<span style="color:blue;font-size: 14px;">&nbsp;<%= sbj.getItem_num() %> </span>
     	  张票
     	  	<span style="font-size: 12px; margin-left:80px;">发起人: 	
      	<span style="color:blue;font-size: 14px;">&nbsp;<%= sbj.getVu_id() %></span></span>
     	  </p>
      	
              
      </div>
      <div class="col-md-6 col-lg-4" >       
        <%
        ItemDao dao3=new ItemDao();
        String status;
        if(dao3.haveIteam(uid,sbj.getVs_id())>0){%>
        	<a style="font-size: 16px; "> &nbsp;已投票 </a>         	
       <%  }
        else{%>
        	<a  href="OptionListServlet?sbj_id=<%= sbj.getVs_id() %>" style="font-size: 16px; "> 参与投票 </a>
        <%}%>
  	</div>
  </div>
  </div>
  
		
 
<%
   }//--forend%>
   <div class="maincont_bottom">
    <% if(String.valueOf(pagenumber1)!=null&&String.valueOf(pageLast1)!=null)
	{
		out.println(""+pagenumber1+"/"+pageLast1+"");
		if(pagenumber1>1)
		{out.println("<a  href='SubjectListServlet?pagenum1="+(pagenumber1-1)+"' >&nbsp上一页</a>");
		}
		else
		{
			out.println("<a style='color: gray;'>&nbsp上一页</a>");
		}
	    
		if(pagenumber1<pageLast1)
		{out.println("<a href='SubjectListServlet?pagenum1="+(pagenumber1+1)+"'>&nbsp;&nbsp&nbsp;下一页</a>");
		}
		else
		{
			out.println("<a style='color: gray;'>&nbsp下一页");
		}
  }
     }
     
     
 %> 
</div>
	 
 	 </div>
 	</div>
 	
 	<div  class=""> <h3  style=" text-align: center;"> 青软实训 &nbsp;&nbsp;&nbsp; 在线投票系统&nbsp;&nbsp;&nbsp; 韩东亲</h3>   </div>
 </div>
</div>
  
</body>
</html>