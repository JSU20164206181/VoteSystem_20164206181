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
		<link rel="stylesheet" href="css/show.css">
		<title>选项列表</title>
	</head>
	<body>
	<%@ page import="com.hdq.dao.*" %>
<%@ page import="com.hdq.entity.*" %>
<%@ page import="java.util.List" %>
<%
List<Option>  list1=(List<Option>)request.getAttribute("optlist");
Subject sub=(Subject)request.getAttribute("subject");

%>


		<section>
		 <a class="fa fa-reply" style="margin-left:120px;font-size:30px; float:left;" aria-hidden="true" href="SubjectListServlet"></a>
		<div class="container">
		
			<div class="row">
				<div class="col-md-12">
					<div class="section_title text-center">
					
				<h1> 投票主题：<%= sub.getVs_title() %></h1>
				<p> 共<%= sub.getOption_num()%>个选项，已有<%=sub.getItem_num()%>个参与投票</p>
				<%if(sub.getVs_type()==1) {%>

				<p> 此投票为单选</p>
				<%}else{ %>
			<p> 此投票为多选</p>
			<%} %>
					
						
					</div>
				</div>
			</div>
			</div>
		<div class="service_area">
			<div class="row">
				<% 	for(int i=0;i<list1.size();i++)
{      
		Option opt=(Option)list1.get(i); 	
		ItemDao item=new ItemDao();
		/* System.out.println("sid"+sub.getVs_id()+" -- oid"+opt.getObject_id()); */
		int num=item.optItemNum(sub.getVs_id(),opt.getOption_id());
		
%>                  
				<div class="skills_bar_design">
				
					<div class="progress-bar-linear">
					<div class="container">
					<div class="row" >
				
						<div class="textcontant col-md-4  " ><p class="progeress-bar-text"> <%= opt.getOption_name()%>
							
						</p></div>
						
						<div class="progress-bar col-md-6 " style="padding:0px;">
						<%if(sub.getItem_num()==0) {%>
						<span  data-percent="0" ></span>
						<%}else{ %>
						<span  data-percent="<%=((float)num/(float)sub.getItem_num())*100 %>" ></span>
						<%} %>
							
							
						</div>
						<div class="textcontant1 col-md-1  " >
						<p class="">  <%=num %>票,占<%=(int)(((float)num/(float)sub.getItem_num())*100) %>%</p>
						</div>
						</div><!-- row -->
						</div>
					</div>
						
						
					</div>
			
					</div>
				
      
      <%} //--forend %>	
					
				</div>
		<a  href="SubjectListServlet"> 返回 </a>	
		
		</section>
   
   	<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script>
			$('.progress-bar > span').each(function() {
				var $this = $(this);
				console.log($this.parent().prev().children("span"));
				$this.css({
					'transition': 'width 2s'
				});
				var width = 0;
				var timer = setInterval(function() {
					
					$this.css('width', function() {
						//更新进度条的值
						$this.parent().prev().children("span").html(width + '%');
						// console.log(width,$this.data('percent'));
						if(width >= parseInt($this.data('percent'))) {
							clearInterval(timer);
						}
						
						return width + '%';
					});
					width++;
					
				}, 10);
			});
			
		</script>
   
   
</body>
</html>