<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.servlet.http.HttpSession" %>

<% String uid=(String)session.getAttribute("u_id"); %>

<form  action="subjectadd" method="post">
        投票标题：<input type="text" name="suj_title" size="20"/><br>     
        投票类型：
  <input type="radio" name="suj_type" value="1" checked> 单选
<input type="radio" name="suj_type" value="2"> 多选 <br>

         发起人：<input  type="text" name="suj_user" value="<%= uid%>"  msize="20"/><br>
         选项1：<input  type="text" class="option" name="opt_option" id="option1" msize="20"/><br>
         选项2：<input  type="text" class="option"  name="opt_option" id="option2" msize="20"/><br>
     <div id="other"></div>   
    
         <input  type="submit" value="提交" name=submit  >
    </form> 
     <button class="add" onclick="addInput()"> 添加选项</button>
    
   <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"> 
   
	function addInput(){
		$chose=$(".option");
		//alert($chose.length);
		var num=$chose.length+1;
		if(num<11){
		 
		var inp=" <div "+"id='option" +num+"'>选项"+num+":<input  type='text' class='option' name='opt_option'  msize='20'/><br></div> ";                  
		
		$("#other").append(inp);  }
		else{
		alert("最多只能十个选项");}
		if(num==3){
			var bt="<button class='delete' onclick='deleteInput()'> 删除选项</button> ";                  
			
			$(".add").after(bt);	
			
		}
	
	}
	function deleteInput(){
		$chose=$(".option");
		
		var num=$chose.length;
	
		
		
		if(num>2){
			var id="#option"+num;
			//alert(id);
			$("div").remove(id);     
		}
		if(num==3){
			 
			$("button").remove(".delete");                 
		
		 }
	
	}
	
	 function check(){
         
    	 
    	 var error=" ";
    	 
   	 
   		  
   	   
   	    	 
    	if( error==" ") {
    		
    		return true;
    	}
    	else{
    		alert(error);
    		return false;
    	}
    }	  
	</script>   
</body>
</html>