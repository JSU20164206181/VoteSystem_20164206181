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
<div class="eeror" style=" ">
	<p class="errorinfo"></p>
</div>
	<div class="container w3layouts agileits">
        <h2 ><a style="color: whitesmoke;" id="tologin" href="#">登 录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a style="color: grey;" id="toregist" href="#">注册</a></h2>
		<div  id="login"   class="login w3layouts agileits">
	<form action="login" method="post">
				<input type="text"id="inp1" type="text" name="id"  onfocus="if($(this).val()=='用户账号不存在') {$(this).val(''); $(this).css('color','white');}" placeholder="用户名" required="">
				<input type="password" id="inp2" type="password" name="pwd"  placeholder="密码" required="required">
				 <input type="text" name="vad" style=" width: 40%;" required="required" placeholder="验证码" />
        <a href="#" onclick="javascript: var dt=new Date();document.getElementById('code').src='validata?dt='+dt; " >
        <img id="code"  style="border:3px solid black;margin-left:15%;margin-top:8px" src="validata"/></a>
			
			<!-- <ul class="tick w3layouts agileits">
				<li>
					<input type="checkbox" id="brand1" value="">
					<label for="brand1"><span></span>记住我</label>
				</li>
			</ul> -->
			<div class="send-button w3layouts agileits">
				
					<input type="submit" value="登 录">
				
			</div>
			</form>
			<!-- <div class="social-icons w3layouts agileits">
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
			</div> -->
			<div class="clear"></div>
		</div>
		<div  id="regist" class="register w3layouts agileits">
			
			<form action="RegistServlet" method="post">
				<input  id="inp21" type="text"  autofocus=""  minlength="6"  maxlength="10" name="id" placeholder="输入6~12位账号" onfocus="if($(this).val()=='用户账号已存在') {$(this).val(''); $(this).css('color','white');}"  required="">
				<input  id="inp22" type="text" name="name"  required=""  maxlength="20" placeholder="输入昵称" >
     			<input  id="inp23" type="password" name="password1"  required="required"  placeholder=" 输入密 码" maxlength="20" />
				<input  id="inp24" type="password" name="password2" required="required" placeholder="输入确认密码" maxlength="20" />
      		  	
		       <p class="information"  >完善个人信息</p>
	          <select class="" id="inp25"   placeholder=" 性别" name="sex"  style="height:40px; width:241px; color:white;"  >
                      <option value="1" selected>男</option>
                        <option value="2">女</option>
              </select>
      
       
		
		 <input  id="inp26" type="text" name="age"  pattern="([1-9])|([1-9][0-9])|(1[01234][0-9])$"  placeholder="年龄" maxlength="3" /><br>
         <input  id="inp27" type="text" name="phone" pattern="^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$" maxlength="11"  placeholder="手机号" maxlength="20" /><br>
			
			<div class="send-button w3layouts agileits" style="margin-top:20px ">
			     
			      
					<input type="submit" value="免费注册" onclick="return check();"/>
				
			</div>
			</form>
			<div class="social-icons w3layouts agileits">
				
				
			</div>
			<div class="clear"></div>
		</div>
          
		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p> <a href="" target="_blank" title="hdq">@hdq</a>在线投票系统<a href="" title="" target="_blank">青软实训</a></p>
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
		                        if(txt=="h_id_r"){	
		                        	
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
	  $('#inp21').val(""); 
        $('#inp21').css("color","white"); 
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
  
   var loginError=<%=(String)request.getParameter("loginError")%>;
	 alert(loginError); 
  
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
	 
	 //自定义警告框样式
	 function alert(e){
		    $("body").append("<div id='msg'><span>"+e+"</span></div>");
		    clearmsg();
		}
		function clearmsg(){
		    var t = setTimeout(function(){
		        $("#msg").remove();
		    },2000)
		};
	</script>

</body>
<!-- //Body -->

</html>