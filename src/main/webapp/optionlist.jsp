<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
		 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/show1.css">
		<title>选项列表</title>
	</head>
	<body>
	<%@ page import="com.hdq.dao.*" %>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>
<%
List<Option>  list1=(List<Option>)request.getAttribute("optlist");
Subject sub=(Subject)request.getAttribute("subject");%>


		<section style="width:800;height:700px;">
		 <a class="fa fa-reply" style="margin-left:120px;font-size:30px; float:left;" aria-hidden="true" href="SubjectListServlet"></a>
		<div class="container">
		
			
				
					<div class="section_title text-center">
					
				<h1> 投票主题：<%= sub.getVs_title() %></h1>
				<p> 共<%= sub.getOption_num()%>个选项，已有<%=sub.getItem_num()%>个参与投票</p>
				<%if(sub.getVs_type()==1) {%>

              <p> 此投票为单选，请选择一个选项</p>
                <%}else{ %>
            <p> 此投票为多选，请选择一个或多个选项</p>
              <%} %>
					
						
					</div>
					
					<form  action="takeOption" method="post">
<input name="subject" value="<%= sub.getVs_id() %>" > </br>
<% 	for(int i=0;i<list1.size();i++)
{      
		Option opt=(Option)list1.get(i);	
%>              
					<%if(sub.getVs_type()==1) {%>

<p><input type="radio" name="option" value="<%=opt.getOption_id() %>" >
<%System.out.println("opt.getOption_id()"+opt.getOption_id());
}else{ %>
<p><input type="checkbox" name="option" value="<%=opt.getOption_id() %>" />
<%System.out.println("opt.getOption_id():"+opt.getOption_id());
} %>
<%= opt.getOption_name()%></p> 
							
				
						  <%} //--forend %>	
						   <input  type="submit" value="确定" name=submit  >
						    </form>
					
				</div>
		
		<a  href="SubjectListServlet"> 返回 </a>	
		
		</section>
   
 




    
   
 <a  href="SubjectListServlet"> 返回 </a>
</body>
</html>