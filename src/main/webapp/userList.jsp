<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
   
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all">
<title>用户管理</title>
</head>
<body>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="com.hdq.dao.*" %>
<%@ page import="java.util.List" %>

<% String uid=(String)session.getAttribute("u_id"); 
String u_type=(String)session.getAttribute("u_type"); 
%>
     
    

	
<div class="main">
  <div class="header" >
    <div class="header_resize">
      <div class="logo">
      	
        <h1><a href="index.jsp">在线投票系统<small></br>Cast your vote</small></a></h1>
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
        
          <li ><a href="SubjectListServlet">投票列表</a></li>
            <li ><a href="addsubject.jsp">发布话题</a></li>
          <li ><a href="mySubject">话题管理</a></li>
            <li class="active"><a href="UserListServlet">用户管理</a></li>
          <li><a href="SofaExitServlet">安全退出</a></li>
          <li><a href="index.jsp">登录</a></li>
          
        </ul>
      </div>
    </div>
      <div class="clr"></div>
  </div>
 </div>
  
 <div  class="maincont">
 	<div id="" class="maincont_top" >	</div>
 	 
 	<div id="" class="maincont_top_1" style="padding-top:20px;" > 
 
 	<%if(u_type!=null){
 	if(u_type.equals("1")){ %>
 	<span style="font-size:20px ;margin-left:50px; color:black; md">   欢迎用户 &nbsp;<%=uid %> </span>
 	<%} else if(u_type.equals("2")){ %>
 	<span style="font-size:20px ;margin-left:50px;color:black;">   欢迎VIP用户  &nbsp;<%=uid %> </span>
 <%} else if(u_type.equals("9")){ %>
 	<span style="font-size:20px ;margin-left:50px;color:black;">   欢迎管理员 &nbsp;<%=uid %> </span>
 <%}} else{ %>
 	<span style="font-size:20px ;margin-left:50px;color:black;">   欢迎游客 </span>
 	<%} %>	
 		</div>
 		
 	<div class="maincont_middle" >
 	 <div class="listcontant"  >

 	<div class="row " style=" border: solid 3px #7b7a7a ;" >	  
       	<div class="col-md-8 col-lg-8 " style="padding-top:30px;" >
       	 <div class="col-md-2 col-lg-2 " >
    		 编号
		      </div>
		      <div class="col-md-3 col-lg-3 " style="" >
		     
     		   账号
  		    </div>
   		     <div class="col-md-3 col-lg-3 " >
     		     &nbsp; &nbsp;权限
  		    </div> 
  		    <div class="col-md-2 col-lg-2 " >
           	  状态
 		     </div> 
		      <div class="col-md-2 col-lg-2 " >
   
		      </div>       
      </div>
      <div class="col-md-4 col-lg-4" >
      		
     	 	<div class="col-md-3 col-lg-3" >
       		  
    		  </div>
    		  
     	 	<div class="col-md-7 col-lg-7" >
       		  管理
    		  </div>
     	 	<div class="col-md-2 col-lg-2" >
       		 
    		  </div>
      
      </div>
    </div>
     
 <!--  列表    -->
     <% 
    
    
     List<User>  list1=(List<User>)request.getAttribute("userList");
    
     if(list1!=null){
    int  pageLast1=(Integer)request.getAttribute("pageLast1");	
    int  pagenumber1=(Integer)request.getAttribute("pagenumber1"); 
    //System.out.println(" @@@@111"+pagenumber1);
  	for(int i=0;i<list1.size();i++)
	{
  		User user=(User)list1.get(i);
	%>
     <!--userlist  -->   
    <div class="list">
 	 			<%if(i==list1.size()-1){ %>
               <div class="row" style=" border: solid 3px #7b7a7a ;" >
              <%}else{ %>              
 	 		 <div class="row" >
 	 		<%} %>
 	 		
		
		<div class="col-md-8 col-lg-8"  style="padding-top:30px;">
		 <div class="col-md-2 col-lg-2 " >
    <%=i+1%>
      </div>
		<div class="col-md-3 col-lg-3 " >
          <%=user.getUser_id() %>
      </div>
        <div class="col-md-3 col-lg-3" >
        
         <%if(user.getUser_type()==1){ %>
    	     普通用户
          <%}else if(user.getUser_type()==2){ %>
          VIP用户
            <%}else if(user.getUser_type()==9){ %>
       	     &nbsp;管理员
              <%} %>
      </div> 
      <div class="col-md-2 col-lg-2 " >
      <%if(user.getUser_status()==1){ %>
    	 <span style=" color:green;font-size:20;" >正常</span>  
          <%}else if(user.getUser_status()==0){ %>
           <span style="color:red;font-size:20;" >  禁用</span>                         
            <%}%>
      </div> 
      <div class="col-md-2 col-lg-2 " >
   
      </div>       
      </div>
      <div class="col-md-4 col-lg-4" > 
      
     	 	<div class="col-md-6 col-lg-6" style="padding-top:0px; height:auto;" >
       		修改权限
    		  </div>
    		   
    		  <div class="col-md-6 col-lg-6" style="padding-top:0px;height:auto;"  >
       		<%if(user.getUser_status()==1) {%>
       		 <span style="color:red;font-size:20;" >  禁用</span>       
       		<%}else{ %>
       	 <span style=" color:green;font-size:20;" >	启用</span>  
       		<%} %>
    		  </div>
      
      
  	</div>
  </div>
  </div>
<%}//--forend  %> 	
<div class="maincont_bottom">
    <% if(String.valueOf(pagenumber1)!=null&&String.valueOf(pageLast1)!=null)
	{
		out.println(""+pagenumber1+"/"+pageLast1+"");
		if(pagenumber1>1)
		{out.println("<a  href='UserListServlet?pagenum1="+(pagenumber1-1)+"' >&nbsp上一页</a>");
		}
		else
		{
			out.println("<a style='color:gray;'>&nbsp上一页</a>");
		}
	    
		if(pagenumber1<pageLast1)
		{out.println("<a href='UserListServlet?pagenum1="+(pagenumber1+1)+"'>&nbsp;&nbsp&nbsp;下一页</a>");
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
 <div  class=""> <h3  style="margin-top:50px; text-align: center; "> 青软实训 &nbsp;&nbsp;&nbsp; 在线投票系统&nbsp;&nbsp;&nbsp; 韩东亲</h3>   </div>
 </div>
 </div>
  
      <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">	

	function Delete(ID){
		$("#deleteUp").val(ID);		
	}
	$(document).ready(function(){
		
			
			$(".delete").hide();
			$(".update").hide();		
  $(".fa-paint-brush").mouseenter(function(){
	  $(".delete").show();
	 
  });
  
  $(".fa-trash").mouseenter(function(){
	  $(".update").show();
      
  });
 
  $(".fa-paint-brush").mouseleave(function(){
	  $(" .delete").hide();
      
  });
  
  $(".fa-trash").mouseleave(function(){
	  $(" .update").hide();
      
  });
  
  
});
	 
	</script>
</body>
</html>