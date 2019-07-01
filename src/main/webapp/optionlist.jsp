<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选项列表</title>
</head>
<body>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>
<%
List<Option>  list1=(List<Option>)request.getAttribute("optlist");

	for(int i=0;i<list1.size();i++)
{
		Option opt=(Option)list1.get(i);
	
%>
<p>

<%= opt.getOption_name()%>
</p>
 
<%
   } //--forend %>

	
	
</body>
</html>