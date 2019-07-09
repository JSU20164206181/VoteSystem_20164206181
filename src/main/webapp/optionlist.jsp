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
		
		<title>选项列表</title>
		<style>
		.myform input[type="submit"] , button {
    width: 40%;
    margin-top:40px;
    margin-bottom:40px;
    margin-left: 30%;
    padding: 10px 0;
    font-size: 20px;
    font-weight: 100;
    background-color: transparent;
    color: #CCC;
    border: 1px solid rgba(238, 238, 238, 0.41);
    border-width: thin;
    cursor: pointer;
    outline: none;
    transition:0.5s all;
    -webkit-transition:0.5s all;
    -moz-transition:0.5s all;
    -o-transition:0.5s all;
    -ms-transition:0.5s all;
    text-decoration: none;
}

/*--w3layouts--*/
/*--agileits--*/
.myform input[type="submit"]:hover , button:hover {
    background-color: #000;
    border: 1px solid #FFF;
    color: #FFF;
    transition:0.5s all;
    -webkit-transition:0.5s all;
    -moz-transition:0.5s all;
    -o-transition:0.5s all;
    -ms-transition:0.5s all;
    text-decoration: none;
}
.optshow a{
            text-decoration: none;}
        /*默认状态*/
.optshow a:link{
          color: blue;
           text-decoration:none;      
        }
        /*访问后得状态*/
.optshow a:visited{
             color:  blue;
             text-decoration:none;  }
        /*鼠标悬浮状态*/
.optshow  a:hover{
              color: #5489ce;
               text-decoration:none; }
        /*点击状态*/
.optshow a:active{              
        }
a{  
 
            text-decoration: none;
        }
        /*默认状态*/
         a:link{
          color: #000000;
           text-decoration:none;
          
        }
        /*访问后得状态*/
         a:visited{
             color: #000000;
             text-decoration:none;
            
        }
        /*鼠标悬浮状态*/
         a:hover{
              color: #5489ce;
              text-decoration:none;
        }
        /*点击状态*/
         a:active{
                    
        }

        
		.listopption {
		width:80%;
		height:50px;
		margin-left:10%;
		margin-top:10px;
		padding-left:5px;
		 border: 1px solid rgba(238, 238, 238, 0.41);
        border-width: thin;
        	}
		.listopption:hover{
		 background-color: #000;
    border: 1px solid #FFF;
    color: #FFF;
    transition:0.5s all;
    -webkit-transition:0.5s all;
    -moz-transition:0.5s all;
    -o-transition:0.5s all;
    -ms-transition:0.5s all;
    text-decoration: none;
		}
		.text-center p{
		font-size:16px;}
		.optform p{
		font-size:16px;
		margin-top:12px;}
		</style>
		
		
	</head>
	<body>
	<%@ page import="com.hdq.dao.*" %>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>
<%
List<Option>  list1=(List<Option>)request.getAttribute("optlist");
Subject sub=(Subject)request.getAttribute("subject");%>

		<div class="optshow">					
		 <a class="fa fa-reply" style="margin-left:20px;font-size:30px; float:left;" aria-hidden="true" href="SubjectListServlet"></a>
		<div class="container myform " style="width:600px; " >
		<div class="section_title text-center " style=" ">
					
				<h1> 投票主题：<%= sub.getVs_title() %></h1>
				<p> 已有<span style="color:#e1d5a1;"><%=sub.getItem_num()%></span>个参与投票</p>
				<%if(sub.getVs_type()==1) {%>

              <p> 此投票为单选，请选择一个选项</p>
                <%}else{ %>
            <p> 此投票为多选，请选择1~<%= sub.getChose_num() %>个选项</p>
            
              <%} %>
					
						
					</div>
					
					<form  class="optform" action="takeOption" method="post">
                    <input name="subject"  type="hidden" value="<%= sub.getVs_id() %>" > </br>
<% 	for(int i=0;i<list1.size();i++)
{      
		Option opt=(Option)list1.get(i);	
%>            
<div class="listopption" id="listopt<%=i %>" onclick="optOn(<%=opt.getOption_id() %>,<%=i %>)">  
<p>
<%=(char)('A'+i)%>.&nbsp;<%= opt.getOption_name()%></p> 
	</div>						
				
						  <%} //--forend %>	
						   <input  type="submit" value="确认投票" style=""  >
						    </form>
					
				</div>
		
		
		
		</div>
</body>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"> 
	
	$(document).ready(function(){
		

});
	
	
	var ch=new Array(); 
	var divList=new Array();
	var chosenum=<%=sub.getChose_num()+1%>;
	function optOn(ID,i){
		var divID="#listopt"+i;
		var optID="#opt"+i;
		var inp="<input type='hidden' name='option' id='opt"+i+"' value='"+ID+ "' >"        
		          
		//有就删除，无就添加
	//	alert(ch.includes(optID)+"sssd"+ch.indexOf(optID));
	    if(ch.includes(optID)){
	     ch.splice(ch.indexOf(optID),1);
	     divList.splice(ch.indexOf(divID),1);  
	     $(optID).remove();
	     $(divID).css("background-color","#333333");
	    }else{
	    	$(divID).append(inp); 
	    	
	    	$(divID).css("background-color","#000");
	    	ch.push(optID);//尾部加
	    	divList.push(divID);    	
	    }
		if(ch.length==chosenum){
			var de=ch.shift();//头部减
	      $(de).remove(); 
	      var dde=divList.shift();
	      $(dde).css("background-color","#333333");
	     
		}	
		
		
	}
 //fruits.shift()删除第一个push()尾部插入   

	 
	
	</script>   

</html>