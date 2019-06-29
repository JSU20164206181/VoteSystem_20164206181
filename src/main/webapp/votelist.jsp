<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票列表</title>
</head>
<body>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>

<div id="" style="width: 250px;height: 60px;background: ;position:absolute; left: 68%;top: 105%;">
     
     <% 
     
     List<Subject>  list1=(List<Subject>)request.getAttribute("userlist");
 	int  pageLast1=request.getAttribute("pageLast1");
 	int  pagenumber1=(int)request.getAttribute("pagenumber1");
  

	if(String.valueOf(pagenumber1)!=null&&String.valueOf(pageLast1)!=null)
	{
		out.println(""+pagenumber1+"/"+pageLast1+"");
		if(pagenumber1>1)
		{out.println("<a  href='ListSpotServlet?pagenum1="+(pagenumber1-1)+"' >&nbsp上一页</a>");
		}
		else
		{
			out.println("<a style='color: #975f2e;'>&nbsp上一页</a>");
		}
	    
		if(pagenumber1<pageLast1)
		{out.println("<a href='ListSpotServlet?pagenum1="+(pagenumber1+1)+"'>&nbsp;&nbsp&nbsp;下一页</a>");
		}
		else
		{
			out.println("<a style='color: #975f2e;'>&nbsp下一页");
		}
  }
 
 %>  </div>
</body>
</html>