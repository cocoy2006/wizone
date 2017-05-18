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
        <title>Wizone - 基于WiFi数据的展厅分析</title>
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
            			<img alt="Wibupt" src="<%=basePath%>wibupt/img/logo.png" style="width:150px;height:60px;">
            		</a>
        		</div>
        		<div class="navbar-collapse collapse" role="navigation">
          			<ul class="nav navbar-nav navbar-left hidden-sm nav-tabs">
   						<li><a href="<%=basePath%>index" style="font-size: 18px"><i class="icon-home"></i>&nbsp展厅热点</a></li>
   						<li><a href="<%=basePath%>realtime"  style="font-size: 18px"><i class="icon-repeat"></i>&nbsp实时流量分析</a></li>
   						<li class="active"><a href="<%=basePath%>activity" style="font-size: 18px"><i class="icon-group"></i>&nbsp活跃分析</a></li>
         				<li><a href="<%=basePath%>consumption" style="font-size: 18px"><i class="icon-camera"></i>&nbsp手机品牌分析</a></li>
         				<li><a href="<%=basePath%>gephi" style="font-size: 18px"><i class="icon-magnet"></i>&nbsp关联分析</a></li>
   						<li><a href="<%=basePath%>login" style="font-size: 18px"><i class="icon-cog"></i>&nbsp设置</a></li>
          			</ul>
        		</div>
      		</div>
    	</div>
    	<div class="container" style="width:93%;height:1050px;">
        	<div class="row clearfix">
        		<div class="col-md-12 column">
        			<div id="bb" style="color:rgb(146,146,146);width:80%; position:absolute; background:transparent;"></div>
                    <h3 style="color: white;">活跃度
                         <a  onmouseover="ddd('bb', 'show','45px','&nbsp;&nbsp;&nbsp;&nbsp;活跃度:&nbsp;&nbsp;表征展厅整体活跃情况，eg.活跃度=3.0表示平均一个人一天去过3个不同位置');" onmouseout="ddd('bb', 'hide');"> 
                                <img src="<%=basePath%>wibupt/img/shuoming.jpg" style="margin-top: -5px; width: 15px; height: 15px;">
						</a>
					</h3>
        			<hr style="opacity:0.4">
        			<div class="module" style="padding-right:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
        				<div class="o-container">
        					<div class="row clearfix">
        						<div class="col-md-6 col-xs-6 column">
        							<center><h4 id="activityheader" style="color:#fff">近7天展厅活跃度分析</h4></center>
        							<div class="row clearfix">
        								<div class="col-md-6 col-xs-6column"></div>
        								<div class="col-md-6col-xs-6 column">
        									<button id="bt1" style="margin: 8px 0 5px 0;" class="btn btn-primary btn-lg" onclick="showactivity('week');">
                                                                                          	 近7天
                            				</button>
                            				<button id="bt2" style="margin: 8px 0 5px 0;" class="btn btn-info btn-lg" onclick="showactivity('month');">
                                    														近30天
                            				</button>
        								</div>
        							</div>
        							<div id="container5" style="margin:5px;height: 328px;"></div>
        						</div>
        						<div class="col-md-6 col-xs-6 column">
        							<center><h4 id="weekactivityheader" style="color:#fff">周内活跃度情况</h4></center>
        							<div id="container9" style="margin-top:35px;height:386px;"></div>
        						</div>
        					</div>
        				</div>
        			</div>
        			
        			<div class="module" style="padding-right:10px;margin-top:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
        				<button id="bt11" style="margin-top: 8px;margin-bottom:5px;margin-left:80%" class="btn btn-primary btn-lg" onclick="showactivityinday('day');">
                                                                                          	昨天
                        </button>
                        <button id="bt12" style="margin: 8px 0 5px 0;" class="btn btn-info btn-lg" onclick="showactivityinday('month');">
                                    														近30天
                        </button>
        				<div id="container12" style="margin:5px;height: 328px;"></div>
        			</div>
        		</div>
        	</div>
        </div>
        <!-- Copyright -->
		<div class="copyright" style="filter: alpha(opacity=90);opacity: 0.9;">
			<center>
				<div style="height:20px;">
				<!-- 
					<p><a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy; 2014~2015 </p>
				-->
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
   			showactivity('week');
   			showWeekActivity();
   			showactivityinday('day');
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
		function showactivity(str){
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
			
			var day,datainfo,info;
			var kaishi,jieshu,init,bool,xxxx;
			var xxxx=today;
			if(str=='week'){
				day=7;
				kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        init=1;
		        bool=true;
				document.getElementById("activityheader").innerHTML='近7天展厅活跃度分析';
				$("#bt1").removeClass("btn-info").addClass("btn-primary");
		        $("#bt2").removeClass("btn-primary").addClass("btn-info");
			}
			else if(str=='month'){
				day=30;
				kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        init=2;
		        bool=true;
				document.getElementById("activityheader").innerHTML='近30天展厅活跃度分析';
				$("#bt2").removeClass("btn-info").addClass("btn-primary");
		        $("#bt1").removeClass("btn-primary").addClass("btn-info");
			}
			
		    $.ajax({
				url: "<%=basePath%>activity/getAll/",
				data: "kaishi=" + kaishi + "&jieshu="+jieshu,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
				  	Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: 'rgba(0,0,0,0)',  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container5').highcharts('StockChart', {
		            	chart:{
		            		backgroundColor:"",
		            		reflow:true,
		            	},
		              rangeSelector: {
		                    buttons: [
		                    {
		                        count: 7,
		                        type: 'day',
		                        text: '周'
		                    },
		                    {
		                        count: 30,
		                        type: 'day',
		                        text: '月'
		                    }],
		                    inputEnabled: bool,
		                    selected: init,
		                    inputBoxBorderColor: 'white',
		                    inputStyle: {
                				color: 'white',
                				fontWeight: 'bold'
            					},
            				 labelStyle: {
                				color: 'white',
                				fontWeight: 'bold'
            				},
            					
		                },


		                xAxis: {
		                    gridLineWidth: 1,
		                    lineColor: '#fff',
		                    tickColor: '#fff',
		                    labels: {
		                        style: {
		                            color: '#fff',
		                            font: '11px Trebuchet MS, Verdana, sans-serif'
		                        }
		                    },
		                    type: 'category',
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		                    },
		                },
		                yAxis: {
		                    min: 0,
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#fff'
		                        },
		                        itemHiddenStyle: {
		                            color: '#fff'
		                        }
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#fff'
		                    	}
		                    }
		                },
		
		                exporting: {
		                    enabled: true
		                },
		                legend: {
		                    layout: 'vertical',
		                    align: 'right',
		                    verticalAlign: 'top',
		                    y: 30,
		                    navigation: {
		                        activeColor: '#fff',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#fff',
		                        style: {
		                            fontWeight: 'bold',
		                            color: '#333',
		                            fontSize: '12px'
		
		                        }
		                    }
		                },
		                exporting: {
		                    enabled: false
		                },
		                credits: {
		                    text: '',
		                    href: ''
		                },
						navigator: {
    						xAxis: {
    							labels: {
        							style: {
            						color: '#fff'
        							}
   								 }
							}
						}
		,
		                series: [{
		                    name: '活跃度',
		                    data: jsonObj.data
		                }]
		            });
				}
			});
		}
		
	</script>
	
	<script type="text/javascript">
   		function showWeekActivity(){
   			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
   			 $.ajax({
				url: "<%=basePath%>activity/weekActivity/",
				data: "jieshu="+today,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
					Highcharts.setOptions({
						colors: ["rgb(135, 206, 250)"],
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
			       	$('#container9').highcharts({
        				chart: {
        					type: 'column',
        					backgroundColor:null,
                			plotBackgroundColor: null,
                			plotBorderWidth: null,
                			plotShadow: false,
            			},
        				xAxis: {
            				categories: [
                				'周日',
                				'周一',
                				'周二',
                				'周三',
                				'周四',
                				'周五',
                				'周六',
            				],
            				style:{
            					lineColor:'#fff',
            					tickColor:'#fff',
            				},
            				labels:{
            					style:{
            						color:'#fff'
            					}
            				},
            				title: {
                				enabled: true,
                				text: '周内活跃度情况',
                				style: {
                    				fontWeight: 'normal',
                    				color:'#fff'
                    			
                				}
            				}
        				},
        				yAxis: {
            				min: 0,
            				title: {
               				 	text: '活跃度 (监测点/人/天)',
                				style:{
        							color:'#fff'
                				}
            				},
            				style:{
            					lineColor:'#fff',
            					tickColor:'#fff',
            				},
            				labels:{
            					style:{
            						color:'#fff'
            					}
            				}
        				},
        				title:{
        					text:null
        				},
        			tooltip: {
            			headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            			pointFormat: '<tr><td style="color:rgb(4, 79, 215);padding:0">{series.name}: </td>' +
                		'<td style="padding:0"><b>{point.y:.2f} </b></td></tr>',
            			footerFormat: '</table>',
            			shared: true,
            			useHTML: true
        			},
        			plotOptions: {
            			column: {
                			pointPadding: 0.2,
                			borderWidth: 0
            			}
        			},
        			legend: {
            			enabled: false
        			},
        			credits: {
            			enabled: false
        			},
        			series: [{
            			name: '活跃度',
            			data: jsonObj.data
        			}]
    			});
			}
		});
   	}
   </script>
	
	
	<script>
		function showactivityinday(str){
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
			var text;
			var kaishi,jieshu;
			if(str=='day'){
				kaishi=today-24*60*60;
				$("#bt11").removeClass("btn-info").addClass("btn-primary");
		    	$("#bt12").removeClass("btn-primary").addClass("btn-info");
		    	text="日内流量信息";
			}else if(str='month'){
				kaishi=today-30*24*60*60;
				$("#bt12").removeClass("btn-info").addClass("btn-primary");
				$("#bt11").removeClass("btn-primary").addClass("btn-info");
				text="近30天日内流量信息";
			}
			
		    $.ajax({
				url: "<%=basePath%>activityinday/getAll/",
				data: "jieshu=" + today+"&kaishi="+kaishi,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
				  	Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#aaeeee"],
						backgroundColor: 'rgba(0,0,0,0)',  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		       $('#container12').highcharts(
				{
					chart:{
		            		backgroundColor:"",
		            	},
					title : {
						text : text,
						style : {
							font : 'bold 15px "微软雅黑"',
							color:'#fff'
						},
						x : -20
					},
					xAxis : {
						title : {
							text : ''
						},
					endOnTicks : false,
					tickInterval : 3,
					labels:{
							style: {
								color: '#fff',
								fontWeight: 'bold'
							}
					},
					categories : [ '0:00', '1:00', '2:00', '3:00', '4:00', '5:00',
							'6:00', '7:00', '8:00', '9:00', '10:00', '11:00',
							'12:00', '13:00', '14:00', '15:00', '16:00',
							'17:00', '18:00', '19:00', '20:00', '21:00',
							'22:00', '23:00' ]
				},
				yAxis : {
					title : {
						text : '人流量',
						style:{
							color:'#fff'
						},
					},
					labels: {
                		style: {
                    		color: '#fff'
                		}
            		},
					gridLineColor: '#fff',
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				},
				credits: {  
					enabled: false  
				},
				tooltip : {
					valueSuffix : '',
					style:{
						color:'#000'
					}
				},
				legend : {
					enabled:false
				},
				series : [
						{
							name : '人流量',
							data : jsonObj.data,
							color : Highcharts.getOptions().colors[0]
						} ]
				});
				}
			});
		}
		
	
	</script>
		
		



   
   
  
   