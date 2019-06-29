<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
	
  </head>
  
  <body>
  <form  action="regist" method="post">
        账 号：<input  id="inp21" type="text"  autofocus="autofocus" name="id" placeholder="输入9~12位账号" onfocus="if($(this).val()=='用户账号已存在') {$(this).val(''); $(this).css('color','black');}"size="20"/><br>
        昵 称：<input  id="inp22" type="text" name="name"  size="20"/><br>
        密 码：<input  id="inp23" type="text" name="password1"  maxlength="20" size="20"/><br>
        确认密码：<input  id="inp24" type="text" name="password2"  maxlength="20" size="20"/><br>
         <input   class="a2" type="submit" value="提交" name=submit onclick="return check();" >
    </form>    
        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

          window.onload=function(){	
   inp21.onblur=function(){
        var xhr=new XMLHttpRequest();
            
          xhr.onreadystatechange=function(){            
              if(xhr.readyState==4&&xhr.status==200){
          
                        var txt=xhr.responseText;  
                       /*  alert(txt+"11   n_id 111 "+(txt=="n_id")); */
                        if(txt=="h_id"){	
	  	                 $('#inp21').val("用户账号已存在"); 
	  	                 $('#inp21').css("color","red"); 
	  	                 
                        } 
                       
              }
          
          }
          var uid=document.getElementById("inp21").value;
          xhr.open("get", "regist?uid2="+uid, true);   
          xhr.send(null);
          
    };
    
    }
         function check(){
             
        	 
        	 var error=" ";
        	 
       	  if($('#inp21').val()==null||$('#inp21').val()=="&nbsp;"||$('#inp21').val()=='用户账号已存在'){    		      		  
       	      error=error+"账号不能为空\n ";
                }
       	if($('#inp22').val()==null||$('#inp22').val()=="&nbsp;"){
     	      error=error+"昵称不能为空\n ";
              }
       	if($('#inp23').val()==null||$('#inp23').val()=="&nbsp;"){
   	      error=error+"密码不能为空\n ";
            }
       	if($('#inp24').val()==null||$('#inp24').val()=="&nbsp"){
   	      error=error+"确认密码不能为空\n ";
            }
       	if($('#inp23').val()!=$('#inp24').val()){
       		error=error+"密码不一致\n ";
       	}
       	    	 
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