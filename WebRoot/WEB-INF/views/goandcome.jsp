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
   						<li><a href="<%=basePath%>realtime"  style="font-size: 18px"><i class="icon-repeat"></i>&nbsp实时流量分析</a></li>
   						<li><a href="<%=basePath%>activity" style="font-size: 18px"><i class="icon-group"></i>&nbsp活跃分析</a></li>
         				<li><a href="<%=basePath%>consumption" style="font-size: 18px"><i class="icon-camera"></i>&nbsp消费能力分析</a></li>
         				<li class="active"><a href="<%=basePath%>goandcome" style="font-size: 18px"><i class="icon-resize-full"></i>&nbsp出入校园分析</a></li>
         				<li><a href="<%=basePath%>gephi" style="font-size: 18px"><i class="icon-magnet"></i>&nbsp关联分析</a></li>
   						<li><a href="<%=basePath%>login" style="font-size: 18px"><i class="icon-cog"></i>&nbsp设置</a></li>
          			</ul>
        		</div>
      		</div>
    	</div>
    	<div class="container" style="width:93%;height:950px">
        	<div class="row clearfix">
        		<div class="col-md-12 column">
        							<h3 style="color: white">&nbsp&nbsp出入校园情况</h3>
        							<hr style="opacity:0.4">
        							<div class="row clearfix">
        								<div class="col-md-7 col-xs-7 column">
        									<div class="module" style="background-color:rgba(51,46,46,0.6)">
        										<div id="container7" style="height: 300px;"></div>
        									</div>
        								</div>
        								<div class="col-md-5 col-xs-5 column">
        									<div class="module" style="height:340px;padding-top:10px;background-color:rgba(51,46,46,0.6)">
        										<div class="row clearfix">
        											<div class="col-md-12 column">
        												<center><h3 style="color:#fff;">当前出入人数</h3></center>
        												<hr>
        												<div class="row clearfix">
        													<div class="col-md-6 col-xs-6 column">
        														<center><p style="color:#fff">东门</p></center>
        														<div style="border-bottom: 3px solid #df514c;font-size:35px;font-family:microsoft yahei;color:#fff">
        															<center><p id="realeast">27<span style="font-size:15px;font-family:microsoft yahei;color:#fff">人</span></p></center>
        														</div>
        													</div>
        													<div class="col-md-6 col-xs-6 column">
        														<center><p style="color:#fff">西门</p></center>
        														<div style="border-bottom: 3px solid #46a546;font-size:35px;font-family:microsoft yahei;color:#fff">
        															<center><p id="realwest">37<span style="font-size:15px;font-family:microsoft yahei;color:#fff">人</span></p></center>
        														</div>
        													</div>
        												</div>
        											</div>
        										</div>
        										<div class="row clearfix">
        											<div class="col-md-12 column" style="margin-top:25px">
        												<div class="row clearfix">
        													<div class="col-md-6 col-xs-6 column" style="margin-top:30px">
        														<center><p style="color:#fff">南门</p></center>
        														<div style="border-bottom: 3px solid #0e90d2;font-size:35px;font-family:microsoft yahei;color:#fff">
        															<center><p id="realmiddle">40<span style="font-size:15px;font-family:microsoft yahei;color:#fff">人</span></p></center>
        														</div>
        													</div>
        													<div class="col-md-6 col-xs-6 column" style="margin-top:30px">
        														<center><p style="color:#fff">北门</p></center>
        														<div style="border-bottom: 3px solid #DFB04C;font-size:35px;font-family:microsoft yahei;color:#fff">
        															<center><p id="realnorth">23<span style="font-size:15px;font-family:microsoft yahei;color:#fff">人</span></p></center>
        														</div>
        													</div>
        												</div>
        											</div>
        										</div>
        									</div>
        								</div>
        							</div>
        							<div class="row clearfix">
        								<div class="col-md-12 column" style="margin-top:10px">
        									<div class="module" style="padding-left: 0px;padding-right:0px;padding-top:10px;background-color:rgba(51,46,46,0.6)">
        										<div class="row clearfix">
        											<div class="col-md-6 col-xs-6 column">
        												<button id="btt1" style="margin-top:17px;margin-left:3%;width:18%" class="btn btn-info" onclick="showtotal('all');">
                                    											总体
                           								</button>
                     	   								<button id="btt2" style="margin-top:17px;width:18%"" class="btn btn-info" onclick="showtotal('west');">
                                    											西门
                            							</button>
                            							<button id="btt3" style="margin-top:17px;width:18%"" class="btn btn-info" onclick="showtotal('east');">
                                    											东门
                            							</button>
                            							<button id="btt4" style="margin-top:17px;width:18%"" class="btn btn-info" onclick="showtotal('middle');">
                                    											中门
                            							</button>
                            							<button id="btt5" style="margin-top:17px;width:18%"" class="btn btn-info" onclick="showtotal('north');">
                                    											北门
                            							</button>
                            							<br>
                            							<br>
                            							<div id="container3"  style="height: 310px;padding-left:7%" ></div>
        											</div>
        											<div class="col-md-6 col-xs-6 column">
        												<div id="container10" style="height:310px;margin-top:35px"></div>
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
					<p><a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy; 2014~2015 </p>
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
   			
   			showtotal('all');
   			showWeekGate();
			showrealgate();
			setInterval(showrealgate,300000);
		};
   		
   </script>
	
   
		
		
		<script type="text/javascript">
   		function showWeekGate(){
   			$.ajax({
				url: "<%=basePath%>goandcome/getweekgate/",
				data: "time=<%=time1%>",
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
					Highcharts.setOptions({
						colors: [ "#C9C8C7", "#46a546","#0e90d2","#aaeeee"],
						backgroundColor: {  
				             linearGradient: [0, 0, 500, 500],  
				             stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				             ]  
				          },  
				          borderWidth: 2,  
				          plotBackgroundColor: 'rgba(255, 255, 255, .9)',  
				          plotShadow: true,  
				          plotBorderWidth: 1  
			       	});
					$('#container7').highcharts({
        				chart: {
            				plotBorderWidth: null,
            				plotShadow: false,
            				backgroundColor:null,
							plotBackgroundColor:null
        				},
        				title: {
            				text: '近7天各校门出入情况对比',
            				style:{
        						color:'#fff'
            				}
        				},
        				tooltip: {
    	    				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
    	    				style:{
        						color:'#000'
            				}
        				},
        				plotOptions: {
            				pie: {
                				allowPointSelect: true,
                				cursor: 'pointer',
                				dataLabels: {
                    				enabled: true,
                    				color: '#fff',
                    				connectorColor: '#fff',
                    				format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                				},
                				showInLegend:true
            				}
        				},
         				credits: {                                                         
            				enabled: false                                                 
        				},
        				series: [{
            				type: 'pie',
            				name: '出入人数占比',
            				data: [
            					{
            						name:'东门',
            						y:jsonObj.data[1],
            						sliced:true,
            						selected:true
            					},
            					['西门',jsonObj.data[0]],
            					['南门',jsonObj.data[2]],
            					['北门',jsonObj.data[3]]
            					
            					]
        				}]
    				});
					Highcharts.setOptions({
						colors: [ "#C9C8C7", "#aaeeee"],
						backgroundColor: {  
				             linearGradient: [0, 0, 500, 500],  
				             stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				             ]  
				          },  
				          borderWidth: 2,  
				          plotBackgroundColor: 'rgba(255, 255, 255, .9)',  
				          plotShadow: true,  
				          plotBorderWidth: 1  
			       	});
					$('#container10').highcharts({
        				chart: {
           	 				plotBorderWidth: null,
            				plotShadow: false,
            				backgroundColor:null,
							plotBackgroundColor:null
        				},
        				title: {
            				text: '近7天平时周末出入情况对比',
            				style:{
        						color:'#fff'
            				}
        				},
        				tooltip: {
    	    				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
    	    				style:{
        						color:'#000'
            				}
        				},
        				plotOptions: {
            				pie: {
                				allowPointSelect: true,
                				cursor: 'pointer',
                				dataLabels: {
                   	 				enabled: true,
                    				color: '#fff',
                    				connectorColor: '#fff',
                    				format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                				},
                				showInLegend:true
            				}
        				},
        				credits: {                                                         
            				enabled: false                                                 
        				},
        				series: [{
            				type: 'pie',
           					name: '出入人数占比',
            				data: [
                				['平时',   jsonObj.wdata[1]],
                				{
                    				name: '周末',
                    				y: jsonObj.wdata[0],
                    				sliced: true,
                    				selected: true
               	 				}
            				]
        				}]
    				});
				}
			});
   			
   		}
   
   			
   </script>
   
   <script type="text/javascript">
		function showtotal(str) {
			if(str=='all'){
				$("#btt1").removeClass("btn-info").addClass("btn-primary");
				$("#btt2").removeClass("btn-primary").addClass("btn-info");
				$("#btt3").removeClass("btn-primary").addClass("btn-info");
				$("#btt4").removeClass("btn-primary").addClass("btn-info");
				$("#btt5").removeClass("btn-primary").addClass("btn-info");
			}else if(str=='west'){
				$("#btt1").removeClass("btn-primary").addClass("btn-info");
				$("#btt3").removeClass("btn-primary").addClass("btn-info");
				$("#btt4").removeClass("btn-primary").addClass("btn-info");
				$("#btt5").removeClass("btn-primary").addClass("btn-info");
				$("#btt2").removeClass("btn-info").addClass("btn-primary");
			}else if(str=='east'){
				$("#btt1").removeClass("btn-primary").addClass("btn-info");
				$("#btt2").removeClass("btn-primary").addClass("btn-info");
				$("#btt4").removeClass("btn-primary").addClass("btn-info");
				$("#btt5").removeClass("btn-primary").addClass("btn-info");
				$("#btt3").removeClass("btn-info").addClass("btn-primary");
			}else if(str=='middle'){
				$("#btt1").removeClass("btn-primary").addClass("btn-info");
				$("#btt2").removeClass("btn-primary").addClass("btn-info");
				$("#btt3").removeClass("btn-primary").addClass("btn-info");
				$("#btt5").removeClass("btn-primary").addClass("btn-info");
				$("#btt4").removeClass("btn-info").addClass("btn-primary");
			}else if(str=='north'){
				$("#btt1").removeClass("btn-primary").addClass("btn-info");
				$("#btt2").removeClass("btn-primary").addClass("btn-info");
				$("#btt3").removeClass("btn-primary").addClass("btn-info");
				$("#btt4").removeClass("btn-primary").addClass("btn-info");
				$("#btt5").removeClass("btn-info").addClass("btn-primary");
			}
			
			$.ajax({
				url: "<%=basePath%>goandcome/getAll/",
				data: "gateId="+str+"&time=<%=time1%>",
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
					Highcharts.setOptions({
						colors: [ "#87CEFA","#4EEE94", "#55BF3B","#7798BF"],
						backgroundColor: {  
				             linearGradient: [0, 0, 500, 500],  
				             stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				             ]  
				          },  
				          borderWidth: 2,  
				          plotBackgroundColor: 'rgba(255, 255, 255, .9)',  
				          plotShadow: true,  
				          plotBorderWidth: 1  
				    });
					$('#container3').highcharts({
						chart:{
						    width:550,
							backgroundColor:null,
							plotBackgroundColor:null
						},
						title: {
							text: '近7天出入校园情况分析',
							style: {
								color: '#fff',
								font: 'bold 15px "微软雅黑"'
							}
						},
						xAxis: {
							categories: ['<%=kaishi7%>', '<%=time6%>', '<%=time5%>', '<%=time4%>', '<%=time3%>', '<%=time2%>', '<%=time1%>'],
							labels: {
								rotation: -15,
								align: 'right',
								style: {
									fontSize: '6px',
									fontFamily: 'Verdana, sans-serif',
									color:'#fff'
								}
							},
							style:{
            					lineColor:'#fff',
            					tickColor:'#fff'
            				}
						},
						yAxis: {
							min: 0,
							title: {
								text: '',
								style: {
									color: '#fff',
									font: 'bold 15px "微软雅黑"'
								}
							},
							style:{
            					lineColor:'#fff',
            					tickColor:'#fff'
            				},
            				labels:{
            					style:{
            						color:'#fff'
            					}
            				}
						},
						labels: {
							items: [{
								html: '',
								style: {
									left: '50px',
									top: '18px',
									color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
								}
							}]
						},
						credits: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							type: 'column',
							name: '离开校园人数',
							data: jsonObj.godata,
							dataLabels: {
								enabled: false,
								rotation: -90,
								color: '#fff',
								align: 'right',
								x: 4,
								y: -30,
								style: {
									fontSize: '12px',
									fontFamily: 'Verdana, sans-serif',
									textShadow: '0 0 1px #fff'
								}
							}
						},
						{
							type: 'column',
							name: '进入校园人数',
							data: jsonObj.comedata,
							dataLabels: {
								enabled: false,
								rotation: -90,
								color: '#fff',
								align: 'right',
								x: 4,
								y: -30,
								style: {
									fontSize: '12px',
									fontFamily: 'Verdana, sans-serif',
									textShadow: '0 0 1px #fff'
								}
							}
						},
						{
							type: 'spline',
							name: '日流量',
							data: jsonObj.totaldata,
							marker: {
								lineWidth: 3,
								lineColor: Highcharts.getOptions().colors[3],
								dataLabels: {
									enabled: true,
									color: '#fff',
								}
							}
						},
						{
							type: 'pie',
							name: '近7天平均占比(%)',
							data: [{
								name: '离开校园人数',
								y: jsonObj.go_avg,
								color: Highcharts.getOptions().colors[0] // Jane's color
							},
							{
								name: '进入校园人数',
								y: jsonObj.come_avg,
								color: Highcharts.getOptions().colors[1] // John's color
							}],
							center: [400, -30],
							size: 70,
							showInLegend: false,
							dataLabels: {
								enabled: false
							}
						}]
					});
				}
			});
		}
		
		</script>

<script>
	function showrealgate(str) {
			$.ajax({
				url: "<%=basePath%>realgate/realgate/",
				dataType: "json",
				type: "GET",
				success: function(jsonObj) {
					document.getElementById("realeast").innerHTML=jsonObj.east;
					document.getElementById("realwest").innerHTML=jsonObj.west;
					document.getElementById("realmiddle").innerHTML=jsonObj.middle;
					document.getElementById("realnorth").innerHTML=jsonObj.north;
				}
			});
		}
		
</script>
   
   
   