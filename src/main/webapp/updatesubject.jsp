<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>
<% List<Option>  list1=(List<Option>)request.getAttribute("optionlist");
   Subject sub=(Subject)request.getAttribute("subject");

%>
<form  action="subjectupdate" method="post">

    投票id：<input type="text" name="suj_id"  value="<%= sub.getVs_id()  %>" /><br> 
        投票标题：<input type="text" name="suj_title"  value="<%= sub.getVs_title()  %>" size="20"/><br>     
        投票类型：
     <%if( sub.getVs_type()==1){ %>  
 	 <input type="radio" name="suj_type" checked="checked" value="1" > 单选
	<input type="radio" name="suj_type" value="2"> 多选 <br>
	<%}else if( sub.getVs_type()==2){ %> 
	<input type="radio" name="suj_type" value="1" > 单选
	<input type="radio" checked="checked" name="suj_type" value="2"> 多选 <br>
	<%} %>
         发起人：<input  type="text" name="suj_user" value="<%=sub.getVu_id() %>"  msize="20"/><br>
         选项1：<input  type="text" class="option" name="opt_option" id="value1" msize="20"/><br>
         选项2：<input  type="text" class="option"  name="opt_option" id="value2" msize="20"/><br>
     <div id="other"></div>   
    
         <input  type="submit" value="提交" name=submit  >
    </form> 
     <button class="add" onclick="addInput()"> 添加选项</button>
    
   <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"> 
	$(document).ready(function(){
		var length=<%=list1.size()%>;
	//	alert(length);
	//获取选项名字
		var list = new Array();
		<%  
		Option option=new Option();
		for(int i=0;i<list1.size();i++){
			option=list1.get(i);
		 %>			
		  list[<%=i %>]="<%=option.getOption_name()%>"; 
		 
		<%}%>	  
		//alert("test"+list[5]);
		for(var i=0;i<list.length;i++){
			 if(i>=2){
				 $chose=$(".option");
					//alert($chose.length);
					var num=$chose.length+1;
					var inp=" <div "+"id='option" +num+"'>选项"+num+":<input  type='text'"+"id='value" +num+"' class='option' name='opt_option' /><br></div> ";                  
					$("#other").append(inp); 
					if(i==2){
						var bt="<button class='delete' onclick='deleteInput()'> 删除选项</button> ";                  
						
						$(".add").after(bt);	
						
					}
			 }//--添加选项
			 //添加值
			 var id="#value"+(i+1);			 
			 $(id).val(list[i]);
			// alert(id + list[i]+"  "+ $(id).val() );
			 
		}
		
	});


	function addInput(){
		$chose=$(".option");
		//alert($chose.length);
		var num=$chose.length+1;
		if(num<11){
		 
		var inp=" <div "+"id='option" +num+"'>选项"+num+":<input  type='text' class='option' name='opt_option'  /><br></div> ";                  
		
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
	
	 function chosevalue(){
         
    	 
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