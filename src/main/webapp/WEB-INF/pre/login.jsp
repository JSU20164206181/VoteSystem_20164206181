<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
    <title>login</title>
    
  </head>
  
  <body>
  <%String logvalue=(String)request.getAttribute("log");
  %>
  <form  action="login" method="post">
         账    号：<input  id="inp1" type="text" name="id" size="20" placeholder="输入9~12位账号"
        onfocus="if($(this).val()=='用户账号不存在') {$(this).val(''); $(this).css('color','black');}" /><br/><br/>
        
         密     码：<input id="inp2" type="password" name="pwd" value="" size="20"/><br/><br/>
         
         验证码:<input type="text" name="vad" size="12"/>
        <a href="#" onclick="javascript: var dt=new Date();document.getElementById('code').src='validata?dt='+dt; " >
        <img id="code" src="validata"/></a><br/>
        <label><input id="log" name="log" type="checkbox"  value="1"  >记住密码</label><br>
       <input type="submit" value="登录"/>

</form>

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  window.onload=function(){	
   inp1.onblur=function(){
        var xhr=new XMLHttpRequest();
            
          xhr.onreadystatechange=function(){            
              if(xhr.readyState==4&&xhr.status==200){
          
                        var txt=xhr.responseText;  
                       /*  alert(txt+"11   n_id 111 "+(txt=="n_id")); */
                        if(txt=="n_id"){	
	  	                 $('#inp1').val("用户账号不存在"); 
	  	                 $('#inp1').css("color","red");  
                        } 
                       
              }
          
          }
          var uid=document.getElementById("inp1").value;
          xhr.open("get", "login?uid="+uid, true);   
          xhr.send(null);
          
    };
   
    
  } ;

	  
    
  


</script>
  </body>
</html>
