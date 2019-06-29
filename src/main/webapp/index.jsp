<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

	<title>登录表单</title>

	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->

	<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all">



</head>
<!-- //Head -->

<!-- Body -->
<body>

	<h1>在线投票系统</h1>

	<div class="container w3layouts agileits">
        <h2 ><a style="color: whitesmoke;" id="tologin" href="#">登 录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a style="color: grey;" id="toregist" href="#">注册</a></h2>
		<div  id="login"   class="login w3layouts agileits">
	<form action="login" method="post">
				<input type="text"id="inp1" type="text" name="id"  onfocus="if($(this).val()=='用户账号不存在') {$(this).val(''); $(this).css('color','white');}" placeholder="用户名" required="">
				<input type="password" id="inp2" type="password" name="pwd"  placeholder="密码" required="">
				 <input type="text" name="vad" style=" width: 40%;" required="required" placeholder="验证码" />
        <a href="#" onclick="javascript: var dt=new Date();document.getElementById('code').src='validata?dt='+dt; " >
        <img id="code"  style="border:3px solid black;margin-left:15%;margin-top:8px" src="validata"/></a><br/>
			
			<ul class="tick w3layouts agileits">
				<li>
					<input type="checkbox" id="brand1" value="">
					<label for="brand1"><span></span>记住我</label>
				</li>
			</ul>
			<div class="send-button w3layouts agileits">
				
					<input type="submit" value="登 录">
				
			</div>
			</form>
			<div class="social-icons w3layouts agileits">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="#">
					<span class="icons w3layouts agileits"></span>
					<span class="text w3layouts agileits">QQ</span></a></li>
					<li class="weixin w3ls"><a href="#">
					<span class="icons w3layouts"></span>
					<span class="text w3layouts agileits">微信</span></a></li>
					<li class="weibo aits"><a href="#">
					<span class="icons agileits"></span>
					<span class="text w3layouts agileits">微博</span></a></li>
					<div class="clear"> </div>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div  id="regist" class="register w3layouts agileits">
			
			<form action="#" method="post">
				<input  id="inp21" type="text"  autofocus="autofocus"   maxlength="10" name="id" placeholder="输入9~12位账号" onfocus="if($(this).val()=='用户账号已存在') {$(this).val(''); $(this).css('color','white');}"  required="">
				<input  id="inp22" type="text" name="name"   maxlength="20" placeholder="输入昵称" ><br>
     			<input  id="inp23" type="text" name="password1"   placeholder=" 输入密 码" maxlength="20" /><br>
				<input  id="inp24" type="text" name="password2"   placeholder="输入确认密码" maxlength="20" size="20"/><br>
      		  
			
			<div class="send-button w3layouts agileits" style="margin-top:20px">
			
					<input type="submit" value="免费注册" onclick="return check();"/>
				
			</div>
			</form>
			<div class="clear"></div>
		</div>
          
		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p>Copyright &copy; More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	</div>
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

	
	
	$(document).ready(function(){
			
			$("#regist").hide();
			
  $("#toregist").click(function(){
  	$("#toregist").css("color","whitesmoke");
  	$("#tologin").css("color","grey");
   
    $("#login").hide();
    $("#regist").show();
      
  });
   $("#tologin").click(function(){
   		$("#toregist").css("color","grey");
  	$("#tologin").css("color","whitesmoke");
    $("#regist").hide();
    $("#login").show();
  });
  
  
  
});
	 function check(){
         
    	 
    	 var error=" ";
    	 
   	  if($('#inp21').val()==null||$('#inp21').val()==""||$('#inp21').val()=='用户账号已存在'){    
   		  
   	      error=error+"账号不能为空\n ";
            }
   	if($('#inp22').val()==null||$('#inp22').val()==""){
 	      error=error+"昵称不能为空\n ";
          }
   	if($('#inp23').val()==null||$('#inp23').val()==""){
	      error=error+"密码不能为空\n ";
        }
   	if($('#inp24').val()==null||$('#inp24').val()==""){
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
<!-- //Body -->

</html>