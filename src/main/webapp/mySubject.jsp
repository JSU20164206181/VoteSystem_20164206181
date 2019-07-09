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
<title>我的话题</title>
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
          <li class="active"><a href="mySubject">话题管理</a></li>
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
 	 
 	<div id="" class="maincont_top_1" > 
 	
 	<p> <a class="fa fa-reply" aria-hidden="true" href="SubjectListServlet"></a>
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
 	<a href="addsubject.jsp"  class="fa fa-plus" aria-hidden="true"></a></p>
 		</div>
 		
 	<div class="maincont_middle" >
 	 <div class="listcontant"  >

 
     
 <!--  列表    -->
     <% 
    
     String error=(String)session.getAttribute("error");
     List<Subject>  list1=(List<Subject>)request.getAttribute("subjectlist");
     
   if(list1!=null){
    int  pageLast1=(Integer)request.getAttribute("pageLast1");	
    int  pagenumber1=(Integer)request.getAttribute("pagenumber1"); 
    //System.out.println(" @@@@111"+pagenumber1);
  	for(int i=0;i<list1.size();i++)
	{
		Subject sbj=(Subject)list1.get(i);
	
		// System.out.println(" @@@222  "+sbj.getVs_id());
	%>
		<!--userlist  -->     
       
 <div class="list">
 	 			<%if(i==list1.size()-1){ %>
               <div class="row" style=" border: solid 3px #7b7a7a ;" >
              <%}else{ %>              
 	 		 <div class="row" >
 	 		<%} %>
		<!--userlist  -->
		<div class="col-md-6 col-lg-8" >
      	<h3><%= (pagenumber1-1)*10+i+1 %>  &nbsp;&nbsp;&nbsp; 
      	<a  href="voteResult?sbj_id=<%= sbj.getVs_id() %>"> <%= sbj.getVs_title()%>   </a>&nbsp;&nbsp;&nbsp;
      	 </h3>  
     	<p style="margin-left: 50px;">
      	此投票共 
      	<span style="color:blue;font-size: 14px;">&nbsp;<%= sbj.getOption_num() %> </span>
                    个选项 ，  已获得
      	<span style="color:blue;font-size: 14px;">&nbsp;<%= sbj.getItem_num() %> </span>
     	  张票
     	  	<span style="font-size: 12px; margin-left:80px;">	
     	  	<%
       
        if(sbj.getVs_type()==1){%>
       &nbsp;类型: <span style="color:blue;font-size: 14px;"> &nbsp;单选</span></span>
        		      	
       <%  }
        else{%>
        &nbsp;类型:<span style="color:blue;font-size: 14px;"> &nbsp;多选</span></span>
        	
        <%}%>	
      	
     	  </p>
              
      </div>
      <div class="col-md-6 col-lg-4" style="padding-top:10px;"> 
 <%if(sbj.getItem_num()==0) {%>
        <a class="fa fa-paint-brush" aria-hidden="true" href="ToUpdateServlet?sbj_id=<%= sbj.getVs_id() %>">
          <span   class="delete" id="delete" style="font-size: 12px;">修改</span></a> 
        <%} else{%>
        <a  data-toggle="modal" data-target="#myModal2" class="fa fa-paint-brush black-herf" aria-hidden="true" href="#" >
          <span   class="delete" id="delete" style="font-size: 12px;">修改</span></a> 
        <%} %>
          <a data-toggle="modal" data-target="#myModal" class="fa fa-trash black-herf" aria-hidden="true"  herf="#"  onclick="Delete(<%= sbj.getVs_id()%>)"  >
          <span  class="update" style="font-size: 12px;" > 删除</span></a>  
  	</div>
  </div>
  </div>
  
  
<%}//--forend  %> 	

   <div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="padding-left:8%">
		<div class="modal-content" style="width: 400px ;height: 300px; top: 200px;background: url(images/main_bg.jpg);opacity: 0.8;">
			<div class="modal-body " style="height: 120px;  font-size: 20px; color: #000000; text-align: center;padding-top: 50px;color: white;" >
				是否确认删除话题？<br><br>删除后不可恢复!
			</div>
			<div class="modal-footer" style="border: hidden;">
				<form action="deleteSubject" method="post">
				<button type="submit"  class="send-button"  name="sbj_id" id="deleteUp"  style="  
				color:red;width: 100px;height: 40px;margin-right: 40px; margin-top: 50px;">
					<strong>确 &nbsp;认</strong>
				</button>
				<button type="button"  class="send-button" data-dismiss="modal"  style="  
		width: 100px;height: 40px;margin-right: 40px; margin-top: 50px;">
					取&nbsp;消
				</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>    




   <div class="modal fade"  id="myModal2"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="padding-left:8%">
		<div class="modal-content" style="width: 400px ;height: 300px; top: 200px;background: url(images/main_bg.jpg);opacity: 0.8;">
			<div class="modal-body " style="height: 120px;  font-size: 20px; color: #000000; text-align: center;padding-top: 50px;color: white;" >
				该话题已有投票<br>不能继续修改!
			</div>
			<div class="modal-footer" style="border: hidden;  align-content:center; text-align: center;">
			
				<button type="button"  class="send-button" data-dismiss="modal"  style="  
		width: 100px;height: 40px; margin-top: 50px; margin-right: 40px;">
					知&nbsp;道&nbsp;了
				</button>
			
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>  
  
<div class="maincont_bottom">
    <% if(String.valueOf(pagenumber1)!=null&&String.valueOf(pageLast1)!=null)
	{
		out.println(""+pagenumber1+"/"+pageLast1+"");
		if(pagenumber1>1)
		{out.println("<a  href='MySubjectServlet?pagenum1="+(pagenumber1-1)+"' >&nbsp上一页</a>");
		}
		else
		{
			out.println("<a style='color:gray;'>&nbsp上一页</a>");
		}
	    
		if(pagenumber1<pageLast1)
		{out.println("<a href='MySubjectServlet?pagenum1="+(pagenumber1+1)+"'>&nbsp;&nbsp&nbsp;下一页</a>");
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