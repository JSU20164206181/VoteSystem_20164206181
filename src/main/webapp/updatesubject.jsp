<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>更新投票信息</title>

	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->
 <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
   
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <link rel="stylesheet" href="css/style.css" type="text/css" media="all">



</head>
<!-- //Head -->

<!-- Body -->
<body>
<head>

	<title>更改投票信息</title>

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
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>
<% String uid=(String)session.getAttribute("u_id"); %>
<% List<Option>  list1=(List<Option>)request.getAttribute("optionlist");
   Subject sub=(Subject)request.getAttribute("subject");

%>
	

	<div class="container w3layouts agileits" style=" color :white; padding-top:20px; margin-top:80px;" >
	 <a class="fa fa-reply" style="font-size:30px; float:left;" aria-hidden="true" href="MySubjectServlet"></a>
	<div class="myform">
	
       <h1 style="margin:10px;"> 投票信息</h1>
       <div class="row updatesub" >
      
 	<form  action="subjectupdate" method="post">
 	<input  type="hidden" name="suj_user" value="<%= uid%>"  /><br>
 	<input type="hidden" name="suj_id"  value="<%= sub.getVs_id()  %>" size="20"/>
		<div class="  col-md-4 col-lg-4" > <p >投票标题:</p>  </div>
		<div class=" col-md-8 col-lg-8" > 
		<input type="text" name="suj_title"  value="<%= sub.getVs_title()  %>" size="20"/></div>
		
		<div class=" col-md-4 col-lg-4" >  <p >投票类型:</p></div>	
		<div class="  col-md-8 col-lg-8 selectdiv" style="height:61px; width:60%"> 
		 <%if( sub.getVs_type()==1){ %>  
	
			
	     <select class="" id="sbj_type" name="suj_type"  >
                      <option value="1" selected>单选</option>
                        <option value="2">多选</option>
                   
              </select>
 	 
	<%}else if( sub.getVs_type()==2){ %> 
   <select class="" id="sbj_type" name="suj_type"  >
                         <option value="1" >单选</option>
                        <option value="2" selected>多选</option>
              </select>
	
	<%} %>
		</div>
		
		
 <input   type="hidden" name="suj_user" value="<%=sub.getVu_id() %>"  msize="20"/>
 		
          <div class="col-md-12 col-lg-12" style="font-size:30px;margin-top:20px;"   > <p>选项列表<span style="font-size:20px;" >(最多六个选项)</span></p></div>
           
           
        <div class="  col-md-4 col-lg-4" > <p >  选&nbsp;项&nbsp;1：</p>  </div>
		<div class=" col-md-8 col-lg-8" >            
       <input  type="text" required="required" class="option" name="opt_option" id="value1" msize="20"/>  </div>
 	    <div class="  col-md-4 col-lg-4" > <p > 选&nbsp;项&nbsp;2：</p>  </div>
		<div class=" col-md-8 col-lg-8" > 
        <input  type="text" class="option" required="required"  name="opt_option" id="value2" msize="20"/></div>
       
     	<div id="other"> </div>               
     		<div class="canchose">
     	<div class=" col-md-4 col-lg-4" >  <p >可选数：</p></div>	 
     	<div class="  col-md-8 col-lg-8 selectdiv" style="height:61px; width:60%"> 	
     	<select class="choseNum" id="choseNum" name="suj_choseNum"  style=" background-color: rgba(10, 10, 10, 0.7);color:white; }">       
					<option value="2" >2</option>
              </select>     </div>  </div> 
 <div class=" col-md-12 col-lg-12" > 
         <button class="add rentbutton" type="button"  onclick="addInput()"> 添加选项</button>
         </div>    
     	 <input  type="submit" style="margin-top:40px;"  value="提交" name=submit  >
     	
         
    </form>
   
    </div>
      
    </div>
			<div class="clear"></div>
			
		</div>
          
		<div class="clear"></div>


		


     
    
   <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"> 
	$(document).ready(function(){
		
		var  val=$("#sbj_type").val();
		if(val==1){
			$(".canchose").hide();
			
		}else if(val==2){
			$(".canchose").show();
		}
		
		$("#sbj_type").change(function(){
			var  val=$("#sbj_type").val();
			if(val==1){
				$(".canchose").hide();
				
			}else if(val==2){
				$(".canchose").show();
			} 
		});



});
	$(document).ready(function(){
		var length=<%=list1.size()%>;
		var chosenum= <%= sub.getChose_num()%>;
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
			if(num==6){	
				  			
			}
			 if(i>=2&&i<=5){
				 $chose=$(".option");
					//alert($chose.length);
					var num=$chose.length+1;//要添加的次序
					/*   选项1：
						<div class=" col-md-8 col-lg-8" >      */
					var inp=" <div id='option" +num+"'><div class='col-md-4 col-lg-4' > <p>选&nbsp;项&nbsp;"+num+":&nbsp;&nbsp;</p> </div><div class='col-md-8 col-lg-8' > <input  type='text' required='required' id='value" +num+"' class='option' name='opt_option' ></div></div> ";                  
					$("#other").append(inp); 
					
					if(chosenum==num){
						var chose="<option id='option" +num+"' value='" +num+"' selected >"+num+"</option>";
					}
					else{
					var chose="<option id='option" +num+"' value='" +num+"' >"+num+"</option>";}
					$("#choseNum").append(chose); 
					
					if(i==2){
						var bt="<button class='delete' type='button' onclick='deleteInput()'> 删除选项</button> ";                  
						
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
		if(num==6){	
			$(".add").hide(); 			
		}
		if(num<7){
		 
			var inp=" <div id='option" +num+"'><div class='col-md-4 col-lg-4' > <p> 选&nbsp;项&nbsp;"+num+":&nbsp;&nbsp;</p> </div><div class='col-md-8 col-lg-8' > <input  type='text' required='required' id='value" +num+"' class='option' name='opt_option' ></div></div> ";                  
		
		$("#other").append(inp);
		var chose="<option id='option" +num+"' value='" +num+"' >"+num+"</option>";
		$("#choseNum").append(chose); 
		}
		else{
		}
		if(num==3){
			var bt="<button type='button' class='delete' onclick='deleteInput()'> 删除选项</button> ";                  
			
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
			$("option").remove(id);
		}
		if(num==3){
			 
			$("button").remove(".delete");                 
		
		 }
		if(num<=6){
			 
			$(".add").show();                
		
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