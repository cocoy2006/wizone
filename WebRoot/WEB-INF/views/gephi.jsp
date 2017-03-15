<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@ page import="com.wicloud.main.java.util.*"%>
<%@ page import="com.wicloud.main.java.entity.Monindex"%>
<%@ page import="com.wicloud.main.java.entity.Userinfo"%>
<%@ page import="com.wicloud.main.java.util.Wicloud"%>
<%@ page import="com.wicloud.main.java.util.DB"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setContentType("text/html;charset=UTF-8"); 
	response.setCharacterEncoding("UTF-8");
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String bb3 = Wicloud.Getoldtime(86400);
	String bb2 = Wicloud.Getrealtime();
	String time = bb2.substring(0, 10);
	String timer_ = Wicloud.Getrealtime_();
	String timer = bb3.substring(0, 10);
	String time1 = Wicloud.change(time, 1);
	String time2 = Wicloud.change(time, 2);
	String time3 = Wicloud.change(time, 3);
	String time4 = Wicloud.change(time, 4);
	String time5 = Wicloud.change(time, 5);
	String time6 = Wicloud.change(time, 6);
	String kaishi7 = Wicloud.change(time, 7);
	String kaishi30 = Wicloud.change(time, 30);
	String kaishi90 = Wicloud.change(time, 90);
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>WiBupt - 基于WiFi数据的北邮校园分析</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
      	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
         <link href="<%=basePath%>wibupt/css/timelist.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>wibupt/css/docs.css">
        <link href="<%=basePath%>wibupt/css/tuli.css" type="text/css" rel="stylesheet"></link>
        <link href="<%=basePath%>wibupt/css/styles.css" type="text/css" rel="stylesheet"></link>        
          <link href="<%=basePath%>resources/css/bootstrap.css" rel="stylesheet">
        <link href="<%=basePath%>resources/css/report/css/bootstrap.min.css" rel="stylesheet">
       
        
        <!-- CSS
		================================================== -->
		<!-- Normalize default styles -->
		<link rel="stylesheet" href="<%=basePath%>resources/css/normalize.css" media="screen" />
		
		<link rel="stylesheet" href="<%=basePath%>resources/css/font-awesome.min.css" media="screen" />
		
		<!-- Template Styles-->
		<link rel="stylesheet" href="<%=basePath%>resources/css/style.css" media="screen" />
		<!-- Superfish -->
		<link rel="stylesheet" href="<%=basePath%>resources/css/superfish.css" media="screen" />
		<!-- Flexslider -->
		<link rel="stylesheet" href="<%=basePath%>resources/css/flexslider.css" media="screen" />
		<!-- Magnific popup -->
		<link rel="stylesheet" href="<%=basePath%>resources/css/magnific-popup.css" media="screen" />
		<!-- Styles for Mobile devices -->
		<link rel="stylesheet" href="<%=basePath%>resources/css/responsive.css" media="screen" />
        
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  			<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	
		<!-- Favicons
		================================================== -->
		
        <style type="text/css">
            body {
                font-family: "微软雅黑";
                background:url(<%=basePath%>wibupt/img/blue-background-6.jpg);
            }
            @media (max-width:980px){
                .navbar-text.pull-right{
                    float:none;
                    padding-left: 5px;
                }
            }
            .navbar-inverse .navbar-nav>li>a:hover {background-color:#3e5bb7;border:none;padding-bottom:22px}
        </style>
        <style> 
			.circliful { 
    			position: relative;  
			} 
			.circle-text, .circle-info, .circle-text-half, .circle-info-half { 
   	 			width: 100%; 
    			position: absolute; 
    			text-align: center; 
    			display: inline-block; 
			} 
			.circle-info, .circle-info-half { 
    			color: #999; 
			} 
			.circliful .fa { 
    			margin: -10px 3px 0 3px; 
    			position: relative; 
    			bottom: 4px; 
			} 
		</style> 
        
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-static-top">
      		<div class="container">
        		<div class="navbar-header">
          			<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
            			<span class="sr-only">Toggle navigation</span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
          			</button>
          			<a href="<%=basePath%>index">
            			<img alt="Wibupt" src="<%=basePath%>wibupt/img/logo_wibupt-m.png" style="width:150px;height:60px;">
            		</a>
        		</div>
        		<div class="navbar-collapse collapse" role="navigation">
          			<ul class="nav navbar-nav navbar-right hidden-sm nav-tabs">
   						<li><a href="<%=basePath%>index" style="font-size: 18px"><i class="icon-home"></i>&nbsp实时校园</a></li>
   						<li><a href="<%=basePath%>realtime"  style="font-size: 18px"><i class="icon-repeat"></i>&nbsp实时流量图</a></li>
   						<li><a href="<%=basePath%>activity" style="font-size: 18px"><i class="icon-group"></i>&nbsp活跃度</a></li>
         				<li><a href="<%=basePath%>consumption" style="font-size: 18px"><i class="icon-camera"></i>&nbsp消费能力分析</a></li>
         				<li><a href="<%=basePath%>goandcome" style="font-size: 18px"><i class="icon-resize-full"></i>&nbsp出入校园情况</a></li>
         				<li class="active"><a href="<%=basePath%>gephi" style="font-size: 18px"><i class="icon-magnet"></i>&nbsp关联图</a></li>
   						<li><a href="<%=basePath%>login" style="font-size: 18px"><i class="icon-cog"></i>&nbsp设置</a></li>
          			</ul>
        		</div>
      		</div>
    	</div>
    	<div class="container" style="width:93%;">
        	<div class="row clearfix">
        		<div class="col-md-12 column">
        					<div style="margin: 0 auto;padding: 0;border: 0;width: 100%;">
        						<div class="row clearfix">
        							<div class="col-md-12 column" style="height:914px">
        								<div class="row clearfix" style="margin-right: 5px;margin-left: 5px;">
        									<div class="col-md-4  col-xs-4 column">
        										<div id="bb1" style="color:rgb(146,146,146);width:80%; position:absolute; background:transparent;"></div>
                                    			<h3 style="color: #fff;">关联图
                                       				<a  onmouseover="ddd('bb1', 'show','45px','&nbsp;&nbsp;&nbsp;&nbsp;关联图:&nbsp;&nbsp;表征北邮各主要教学楼的联系紧密情况');" onmouseout="ddd('bb1', 'hide');"> 
                                           				<img src="<%=basePath%>wibupt/img/shuoming.jpg" style="margin-top: -5px; width: 15px; height: 15px;">
													</a>
												</h3>
        									</div>
        									<div style="padding-top:24px;float:right">
        										<div>
        											<h4 style="color: #fff;display:inline">选择查看历史关联图:</h4>
        											<input type="text" id="gephidate" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd',maxDate:'%y-%M-%d'})" class="Wdate" style="width:150px"/>
                       	                			<input type="text" id="gephitime" onfocus="WdatePicker({dateFmt:'HH:mm'})" class="Wdate" style="width:100px"/>
                       	                			<input type="button" value="确定" onclick="changeSvg ()"/>
                       	                			<input type="button" value="返回当前" onclick="originalSvg()"/>
        										</div>
        									</div>
        								</div>
        								<hr style="opacity:0.4;margin-top:10px">
										<nav class="g-tab" id="Calendar" style="padding: 0 0 0 0;width:100%;">
											<a class="prev " id="Prev" onclick="gp9()" style="width:2.5%;"><i class="g-ico g-ico-s g-ico-arrowleft"></i></a>
											<div class="day-tab" style="width: 95%;">
    											<ul id="Ul" style="left:1px;width:100%">
	    											<li><a onclick="gp4()"><span id="selp4">14:30-15:00</span></a></li>
													<li><a onclick="gp3()"><span id="selp3">15:00-15:30</span></a></li>
	    											<li><a onclick="gp2()"><span id="selp2">15:30-16:00</span></a></li>
	    											<li><a onclick="gp1()"><span id="selp1">16:00-16:30</span></a></li>
	    											<li><a class="on"><span id="selset">16:30-17:00</span></a></li>
	    											<li><a onclick="gn1()"><span id="seln1">尚未到达</span></a></li>
	    											<li><a onclick="gn2()"><span id="seln2">尚未到达</span></a></li>
	    											<li><a onclick="gn3()"><span id="seln3">尚未到达</span></a></li>
													<li><a onclick="gn4()"><span id="seln4">尚未到达</span></a></li>
    											</ul>
											</div>
											<a class="next " id="Next" onclick="gn9()" style="width:2.5%;"><i class="g-ico g-ico-s g-ico-arrowright"></i></a>
										</nav>
        								<div class="col-md-12 col-xs-12 column" style="background-color:rgba(255,255,255,0.5)">
        									<div id="myCarousel" class="carousel slide">
   												<div class="carousel-inner">
      												<div class="item active">
        												<h4 style="color:#fff;padding:10px;">当前关联时间段：<span id="time0">16:30-17:00</span></h4>
														<center><img id="svg0" style="height:600px;width:80%" src="<%=basePath%>/wibupt/img/initgephi.svg"></center>
      													<br>
      												</div>
   												</div>
   												<a class="carousel-control left" href="#myCarousel" data-slide="prev" onclick="gp1()" style="top:200px;width:10%;height:50px"><span class="badge" style="background-color:#3e5bb7;">Previous</span></a>
   												<a class="carousel-control right" href="#myCarousel" data-slide="next" onclick="gn1()" style="top:200px;width:10%;height:50px"><span class="badge" style="background-color:#3e5bb7;">Next</span></a>
											</div>
        								</div>
        								<div class="row clearfix">
        									<div class="col-md-12 col-xs-12 column">
        										<br>
        										<p style="width: 100%;color:#fff;font-size:1.1em;line-height:25px">&nbsp&nbsp&nbsp&nbsp图中有若干个由密集的点组成的簇，簇与簇之间有用连线连接起来的<span style="font-weight: bold;color: rgb(221, 131, 16);">“共享点”</span>。其中，每个簇代表一个场所（有名称标识）；
        										组成簇的点代表该场所此15钟内的手机用户；簇之间的
        										<span style="font-weight: bold;color: rgb(221, 131, 16);">“共享点”</span>
        										代表此15分钟内在这几个场所都出现过的手机用户；由此，
        										<span style="font-weight: bold;color: rgb(221, 131, 16);">“共享点”</span>反应了场所之间的关联程度，
        										几个场所的<span style="font-weight: bold;color: rgb(221, 131, 16);">“共享点”</span>越多代表其关联程度越大。
        										</p>
        									</div>
        								</div>
        							</div>
        						</div>
        					</div>
        		</div>
        	</div>
        </div>
        <!-- Copyright -->
		<div class="copyright" style="filter: alpha(opacity=90);opacity: 0.9;">
			<center>
				<div style="height:20px;"> 
					<p><a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy; 2013~2014 </p>
				</div>								
			</center>
		</div>
		<!-- /Copyright -->
    </body>
    <script src="<%=basePath%>wibupt/js/jquery.js"></script>
    <script src="<%=basePath%>wibupt/js/highstock.js"></script>
	<script src="<%=basePath%>wibupt/js/exporting1.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=basePath%>wibupt/js/bootstrap-tab.js"></script>
	<script src="<%=basePath%>wibupt/js/bootstrap-carousel.js"></script>
	<script src="<%=basePath%>wibupt/js/jquery.easypiechart.min.js"></script>
    <script type="text/javascript" src="wibupt/js/jquery.animateNumbers.js"></script>
    <script src="<%=basePath%>wibupt/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>wibupt/js/Function.js"></script>
	
	<script>
   		window.onload = function() {
			originalSvg();
		}
   		
   </script>
	
	<script type="text/javascript">
   		function ddd(obj, sType, top, content) 
   		{
			var oDiv = document.getElementById(obj);
			document.getElementById(obj).innerHTML = content;
			if (sType == 'show') {
				oDiv.style.display = 'block';
				oDiv.style.top = top;
			}
			if (sType == 'hide') {
				oDiv.style.display = 'none';
			}
		}
   		
   	</script>
   
   <script>						
		var  svgchange=new Array();
		var  svgoriginal=new Array();
        var selget;
        var ifready=1;
		function timechange(date)
   		{
			var Y= date.getFullYear(); 
			var M= date.getMonth()+1; 
			var D= date.getDate(); 
			var h= date.getHours(); 
			var m= date.getMinutes(); 
			var CurrentDate = ""; 
	           CurrentDate+=Y+""; 
			if (M>=10){CurrentDate+=M+"";} 
			else  {CurrentDate+="0"+M+"";} 
			if (D>=10){CurrentDate+=D+"";} 
			else  {CurrentDate+="0"+D+"";} 
			if (h>=10){CurrentDate+=h+"";} 
			else  {CurrentDate+="0"+h+"";} 
			if (m>=10){CurrentDate+=m+"";} 
			else  {CurrentDate+="0"+m+"";} 
			return CurrentDate;
   		}

     	function abc(str,i)
        {
    	 		var str0=str.substr(0,4)+"/"+str.substr(4,2)+"/"+str.substr(6,2)+" "+str.substr(8,2)+":"+str.substr(10,2);
         		str0=new Date(str0);
         		var str1=new Date(str0);
         		str0.setTime(str0-1000*60*30*i);
         		if (str0<svgoriginal[0]){ifready=1;str0=timechange(str0); }
         		else   {ifready=0;str0=timechange(svgoriginal[0]);}
         		return str0; 
    	 	     
        }    
        
     function def(str)
        {if (ifready==0){var c="尚未到达"; return c;}
        else{
        var str0=str.substr(0,4)+"/"+str.substr(4,2)+"/"+str.substr(6,2)+" "+str.substr(8,2)+":"+str.substr(10,2);
         var str1=new Date(str0);
         str1.setTime(str1-1000*60*30);
         str1=timechange(str1);
         var str2=str1.substr(8,2)+":"+str1.substr(10,2)+"-"+str.substr(8,2)+":"+str.substr(10,2);
         return str2;}
        }
      function ghi()
        {document.getElementById('selset').value=abc(selget,0);
         document.getElementById('selp1').value=abc(selget,1);
         document.getElementById('selp2').value=abc(selget,2);
         document.getElementById('selp3').value=abc(selget,3);
         document.getElementById('selp4').value=abc(selget,4);
         
         document.getElementById('seln1').value=abc(selget,-1);
         document.getElementById('seln2').value=abc(selget,-2);
         document.getElementById('seln3').value=abc(selget,-3);
         document.getElementById('seln4').value=abc(selget,-4);
         
         document.getElementById('Next').value=abc(selget,-9);
         document.getElementById('Prev').value=abc(selget,9);
         document.getElementById('selset').innerHTML=def(abc(selget,0));
         document.getElementById('selp1').innerHTML=def(abc(selget,1));
         document.getElementById('selp2').innerHTML=def(abc(selget,2));
         document.getElementById('selp3').innerHTML=def(abc(selget,3));
         document.getElementById('selp4').innerHTML=def(abc(selget,4));
         
         document.getElementById('seln1').innerHTML=def(abc(selget,-1));
         document.getElementById('seln2').innerHTML=def(abc(selget,-2));
         document.getElementById('seln3').innerHTML=def(abc(selget,-3));
         document.getElementById('seln4').innerHTML=def(abc(selget,-4));
          
         document.getElementById('svg0').src = '<%=basePath%>wibupt/img/'+ selget +'.svg'; 
         document.getElementById('time0').innerHTML=def(abc(selget,0));			               
        } 
        function gp1() {selget=document.getElementById('selp1').value; ghi();}
        function gp2() {selget=document.getElementById('selp2').value; ghi();}
        function gp3() {selget=document.getElementById('selp3').value; ghi();}
        function gp4() {selget=document.getElementById('selp4').value; ghi();}
        
        function gset(){selget=document.getElementById('selset').value;ghi();}
        function gn1() {selget=document.getElementById('seln1').value; ghi();}
        function gn2() {selget=document.getElementById('seln2').value; ghi();}
        function gn3() {selget=document.getElementById('seln3').value; ghi();}
        function gn4() {selget=document.getElementById('seln4').value; ghi();}
        
        function gp9() {selget=document.getElementById('Prev').value; ghi();}
        function gn9() {selget=document.getElementById('Next').value; ghi();}
          
        
                 
        
		function changeSvg () {
          var svgchange0 = $dp.$('gephidate').value +" "+ $dp.$('gephitime').value;            
          for(var i=0;i<5;i++){
          	svgchange[i] = new Date(svgchange0);
          	var MM = svgchange[i].getMinutes();
          	svgchange[i].setMinutes(MM+30-MM%30);
          	svgchange[i].setTime(svgchange[i]-1000*60*30*i);
          	
          }
            selget=timechange(svgchange[0]);
            ghi();
            }
		
		/********页面初加载操作***********/
		function originalSvg(){
    		var currenttime = new Date();
          	var MM =currenttime.getMinutes();
          	
        if(MM>=30 && MM<40) {
        	currenttime.setMinutes(0);
        }        
        else if(MM>=0 && MM<10) {
        	currenttime.setHours(currenttime.getHours()-1);
        	currenttime.setMinutes(30);
        } else 
        	
        currenttime.setMinutes(MM-MM%30);        
        
          for(var i=0;i<6;i++){
          svgoriginal[i] = new Date(currenttime);
          svgoriginal[i].setTime(svgoriginal[i]-1000*60*30*i);
          
          }  
                           
            selget=timechange(svgoriginal[0]);
            ghi();           	    		    		  
		}	
</script>
   