<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的话题</title>
</head>
<body>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>


<a href="SubjectListServlet">返回</a>
     
     <% 
     
     List<Subject>  list1=(List<Subject>)request.getAttribute("subjectlist");
    // System.out.println(" @@@@"+list1.size());
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
		<p><%= sbj.getVs_id() %>
     
          <a  href="OptionListServlet?sbj_id=<%= sbj.getVs_id() %>"> 
          <%= sbj.getVs_title()%> 
          </a>
        	<%= sbj.getVs_type() %>
        
        
        <%= sbj.getOption_num() %>
        <%= sbj.getItem_num() %>
        <a href="ToUpdateServlet?sbj_id=<%= sbj.getVs_id() %>"> 修改</a>
        <a href="deleteSubject?sbj_id=<%= sbj.getVs_id() %>"> 删除</a>
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


  
</body>
</html>