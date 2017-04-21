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
         				<li class="active"><a href="<%=basePath%>consumption" style="font-size: 18px"><i class="icon-camera"></i>&nbsp消费能力分析</a></li>
         				<li><a href="<%=basePath%>goandcome" style="font-size: 18px"><i class="icon-resize-full"></i>&nbsp出入校园分析</a></li>
         				<li><a href="<%=basePath%>gephi" style="font-size: 18px"><i class="icon-magnet"></i>&nbsp关联分析</a></li>
   						<li><a href="<%=basePath%>login" style="font-size: 18px"><i class="icon-cog"></i>&nbsp设置</a></li>
          			</ul>
        		</div>
      		</div>
    	</div>
    	<div class="container" style="width:93%;height:950px;">
        	<div class="row clearfix">
        		<div class="col-md-12 column">
        							<h3 style="color: white">消费能力分析</h3>
        							<hr style="opacity:0.4">
        							<div class="row clearfix">
        								<div class="col-md-6 col-xs-6 column">
        									<div class="module" style="padding-top: 13px;padding-bottom:20px;background-color:rgba(51,46,46,0.6)">
        										<center><h4 style="color:#fff">近7天在校师生所持手机品牌</h4></center>
                            					<div id="container4"  style="margin-bottom:12px"></div>
                            				</div>
        								</div>
        								<div class="col-md-6 col-xs-6 column" style="padding-left:0px">
        									<div class="module" style="padding-top:10px;padding-bottom: 5px;background-color:rgba(51,46,46,0.6)">
        										<p style="color: white;font-size:1.3em;line-height:25px;">
													根据手机品牌数据计算出<span style="font-weight: bold">北邮师生</span>消费能力等级为：
													<span id="in_rank" style="color: #E2A21A; font-size: 35px"></span>
												</p>
												<p style="margin-left: 10%; text-align: left;color:rgb(165,155,140);font-size:1.1em;line-height:15px">
													温馨提示：消费能力等级分类为 A+，A，B，C，D
												</p>
												<div id="container8"></div>
											</div>
        								</div>
        							</div>
        							<div class="module" style="margin-top:10px;padding-top:10px;height:260px;background-color:rgba(51,46,46,0.6)">
        								<h3 style="color:#fff">手机品牌排行Top5</h3>
        								<div class="row clearfix">
        									<div class="col-md-1 col-xs-1 column"></div>
        									<div class="col-md-2 col-xs-2 column">
        										<h4 id="label1" style="position:relative;left:20%;color:#fff">Visits</h4>
        										<div class="easypiechart1 inline" style="position:absolute;top:-10px;height: 140px;">
                      								<div class="percentage" data-percent="1" data-size="120" data-line-cap="round" data-line-width="10" data-scale-color="false" data-bar-color="#46a546" data-track-color="rgba(0,0,0,.2)">
                      									<h3 style="position:relative;top:80px;left:20%;color:#fff"><span></span>%</h3>
                      								</div>
                    							</div>
        									</div>
        									<div class="col-md-2 col-xs-2 column">
        										<h4 id="label2" style="position:relative;left:20%;color:#fff">Visits</h4>
        										<div class="easypiechart2 inline" style="position:absolute;top:-10px;height: 140px;">
                      								<div class="percentage" data-percent="1" data-size="120" data-line-cap="round" data-line-width="10" data-scale-color="false" data-bar-color="#0e90d2" data-track-color="rgba(0,0,0,.2)">
                      									<h3 style="position:relative;top:80px;left:20%;color:#fff"><span></span>%</h3>
                      								</div>
                    							</div>
        									</div>
        									<div class="col-md-2 col-xs-2 column">
        										<h4 id="label3" style="position:relative;left:20%;color:#fff">Visits</h4>
        										<div class="easypiechart3 inline" style="position:absolute;top:-10px;height: 140px;">
                      								<div class="percentage" data-percent="1" data-size="120" data-line-cap="round" data-line-width="10" data-scale-color="false" data-bar-color="#DFB04C" data-track-color="rgba(0,0,0,.2)">
                      									<h3 style="position:relative;top:80px;left:25%;color:#fff"><span></span>%</h3>
                      								</div>
                    							</div>
        									</div>
        									<div class="col-md-2 col-xs-2 column">
        										<h4 id="label4" style="position:relative;left:20%;color:#fff">Visits</h4>
        										<div class="easypiechart4 inline" style="position:absolute;top:-10px;height: 140px;">
                      								<div class="percentage" data-percent="1" data-size="120" data-line-cap="round" data-line-width="10" data-scale-color="false" data-bar-color="#df514c" data-track-color="rgba(0,0,0,.2)">
                      									<h3 style="position:relative;top:80px;left:25%;color:#fff"><span></span>%</h3>
                      								</div>
                    							</div>
        									</div>
        									<div class="col-md-2 col-xs-2 column">
        										<h4 id="label5" style="position:relative;left:20%;color:#fff">Visits</h4>
        										<div class="easypiechart5 inline" style="position:absolute;top:-10px;height: 140px;">
                      								<div class="percentage" data-percent="1" data-size="120" data-line-cap="round" data-line-width="10" data-scale-color="false" data-bar-color="#A40778" data-track-color="rgba(0,0,0,.2)">
                      									<h3 style="position:relative;top:80px;left:25%;color:#fff"><span></span>%</h3>
                      								</div>
                    							</div>
        									</div>
        									<div class="col-md-1 col-xs-1 column"></div>
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
   			showpie('week');
		}
   		
   </script>
	
	<script type="text/javascript">
    	function toDecimal2(x) {
            var f = parseFloat(x);
            if (isNaN(f)) {
                return 0;
            }
            var f = Math.round(x * 10) / 10;
            var s = f.toString();
            var rs = s.indexOf('.');
            if (rs < 0) {
                rs = s.length;
                s += '.';
            }
            while (s.length <= rs + 1) {
                s += '0';
            }
            return s;
        }
		function showpie(str) {
		    var range = "<%=kaishi7%>";
		    $.ajax({
				url: "<%=basePath%>branddis/avg/",
				data: "kaishi=" + range + "&jieshu=<%=time1%>",
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
					var b = parseFloat(toDecimal2(100 * jsonObj.brand[0].value / jsonObj.total));
		            var c = parseFloat(toDecimal2(100 * jsonObj.brand[1].value / jsonObj.total));
		            var d = parseFloat(toDecimal2(100 * jsonObj.brand[2].value / jsonObj.total));
		            var e = parseFloat(toDecimal2(100 * jsonObj.brand[3].value / jsonObj.total));
		            var f = parseFloat(toDecimal2(100 * jsonObj.brand[4].value / jsonObj.total));
		            var g = parseFloat(toDecimal2(100 * jsonObj.brand[5].value / jsonObj.total));
		            var h = parseFloat(toDecimal2(100 * jsonObj.brand[6].value / jsonObj.total));
				
      		 		
					    Highcharts.setOptions({
						colors: [ "#C9C8C7","#19BAEC","#E2A21A", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
						"#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
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
			       	 $('#container4').highcharts({
		                chart: {
		                    height: 300,
			       		 	type: 'pie',
		                    options3d: {
		                        enabled: false,
		                        alpha: 45,
		                        beta: 0
		                    },
		                    backgroundColor: 'rgba(0,0,0,0)',
		                },
		                title: {
		                    text: null,
		                    style: {
		                        color: '#fff',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                
		                plotOptions: {
		                    pie: {
		                        allowPointSelect: true,
		                        cursor: 'pointer',
		                        depth: 35,
		                        dataLabels: {
		                            enabled: true,
		                            format: '{point.name}',
		                            color: '#fff',
		                            
		                        },
		                    }
		                },
		                credits: {
		                    text: '',
		                    href: ''
		                },
		                exporting: {
		                    enabled: false
		                },
		                series: [{
		                    type: 'pie',
		                    name: '品牌比例',
		                    data: [{
		                        name: jsonObj.brand[0].brand,
		                        y: b,
		                        sliced: true,
		                        selected: true
		                    },
		                    {
		                        name: jsonObj.brand[1].brand,
		                        y: c,
		                        sliced: true,
		                        selected: true
		                    },
		                    {
		                        name: jsonObj.brand[2].brand,
		                        y: d,
		                        sliced: true,
		                        selected: true
		                    },
		                    [jsonObj.brand[3].brand, e], 
		                    [jsonObj.brand[4].brand, f], 
		                    [jsonObj.brand[5].brand, g],  
		                    [jsonObj.brand[6].brand, h]]
		                }],
		                tooltip: {
		                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		                },
					legend: {
    					layout:'vertical',         //竖直显示，默认是水平显示的
    					align: 'right',            //图例说明在区域的右边，默认在中间
    					verticalAlign: 'middle'    //竖直方向居中，默认在底部
					}
		            });
			       	 Highcharts.setOptions({
						colors: ["#7798BF"],
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
			       	 
			       	 $('#container8').highcharts({                                           
        				chart: {                                                           
            				type: 'bar',
           					backgroundColor:null,
            				plotBackgroundColor: null,
            				plotBorderWidth: null,
            				plotShadow: false,
            				height:300
        				},                                                                 
        				title: {                                                           
            				text: '手机价格区间人数占比',
            				style:{
        						color:'#fff'
            				}
        				},                                                                 
        				xAxis: {                                                           
            				categories: ['>5K', '3~5K', '2~3K', '1~2K', '<1K'],
            				title: {                                                       
                				text: null                                                 
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
        				yAxis: {                                                           
            				min: 0,                                                        
            				title: {                                                       
                				text: '%',                             
                				align: 'high',
                				style:{
        							color:'#fff'
                				}
            				}, 
            				style:{
            					lineColor:'#fff',
            					tickColor:'#fff',
            				},
            				labels: {                                                      
                				overflow: 'justify',
                				style:{
            						color:'#fff'
            					}
            				} ,
        				},                                                                 
        				plotOptions: {                                                     
            				bar: {                                                         
                				dataLabels: {
                					enabled: true,
                					rotation: 0,
                					color: '#fff',
                					align: 'left',
                					x: 0,
                					y: 0,
               
            					}                                                             
            				}
            
        				}, 
        				tooltip: {
            				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            				pointFormat: '<tr><td style="color:#000;padding:0">{series.name}: </td>' +
                					'<td style="padding:0"><b>{point.y:.2f} %</b></td></tr>',
            				footerFormat: '</table>',
            				shared: true,
            				useHTML: true
        				},
        				credits: {                                                         
            				enabled: false                                                 
        				},
        				legend:{
        					enabled:false,
        					title:{
        						text:null
        					}
        				},
        				series: [{ 
        					name:'所持人数占比',
           					data:jsonObj.p,
            				lineColor: '#fff',
        				}]                                                                 
    				});
			       	 document.getElementById("in_rank").innerHTML=jsonObj.rank;
					document.getElementById("label1").innerHTML=jsonObj.brand[0].brand;
					document.getElementById("label2").innerHTML=jsonObj.brand[1].brand;
					document.getElementById("label3").innerHTML=jsonObj.brand[2].brand;
					document.getElementById("label4").innerHTML=jsonObj.brand[3].brand;
					document.getElementById("label5").innerHTML=jsonObj.brand[4].brand;
					
					 // Generate easy-pie charts
      				var charts1 = $('.easypiechart1 .percentage');
      				charts1.easyPieChart({
        				animate: 2000,
        				onStart: function(value) {
          					$(this.el).find('span').animateNumbers(b);
        				}
      				});
      		 		// refresh easy pie chart
        			charts1.each(function() {
          				$(this).data('easyPieChart').update(b);
        			});
      		 		
      		 		var charts2 = $('.easypiechart2 .percentage');
      				charts2.easyPieChart({
        				animate: 2000,
        				onStart: function(value) {
          					$(this.el).find('span').animateNumbers(c);
        				}
      				});
      		 		// refresh easy pie chart
        			charts2.each(function() {
          				$(this).data('easyPieChart').update(c);
        			});
					
      		 		
      		 		var charts3 = $('.easypiechart3 .percentage');
      				charts3.easyPieChart({
        				animate: 2000,
        				onStart: function(value) {
          					$(this.el).find('span').animateNumbers(d);
        				}
      				});
      		 		// refresh easy pie chart
        			charts3.each(function() {
          				$(this).data('easyPieChart').update(d);
        			});
				
      		 		var charts4 = $('.easypiechart4 .percentage');
      				charts4.easyPieChart({
        				animate: 2000,
        				onStart: function(value) {
          					$(this.el).find('span').animateNumbers(e);
        				}
      				});
      		 		// refresh easy pie chart
        			charts4.each(function() {
          				$(this).data('easyPieChart').update(e);
        			});
      		 		
      		 		var charts5 = $('.easypiechart5 .percentage');
      				charts5.easyPieChart({
        				animate: 2000,
        				onStart: function(value) {
          					$(this.el).find('span').animateNumbers(f);
        				}
      				});
      		 		// refresh easy pie chart
        			charts5.each(function() {
          				$(this).data('easyPieChart').update(f);
        			});
				}
			});
	    }
		</script>
		
		
		
		


   
   
  
   