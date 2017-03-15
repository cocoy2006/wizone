<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wicloud.main.java.util.*"%>
<%@ page import="com.wicloud.main.java.entity.Monindex"%>
<%@ page import="com.wicloud.main.java.entity.Userinfo"%>
<%@ page import="com.wicloud.main.java.util.Wicloud"%>
<%@ page import="com.wicloud.main.java.util.DB"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<link href="<%=basePath%>wibupt/css/timelist.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wibupt/css/docs.css">
<link href="<%=basePath%>wibupt/css/tuli.css" type="text/css"
	rel="stylesheet"></link>
<link href="<%=basePath%>wibupt/css/styles.css" type="text/css"
	rel="stylesheet"></link>
<link href="<%=basePath%>resources/css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>resources/css/report/css/bootstrap.min.css"
	rel="stylesheet">
<!-- CSS
		================================================== -->
<!-- Normalize default styles -->
<link rel="stylesheet" href="<%=basePath%>resources/css/normalize.css"
	media="screen" />

<link rel="stylesheet"
	href="<%=basePath%>resources/css/font-awesome.min.css" media="screen" />

<!-- Template Styles-->
<link rel="stylesheet" href="<%=basePath%>resources/css/style.css"
	media="screen" />
<!-- Superfish -->
<link rel="stylesheet" href="<%=basePath%>resources/css/superfish.css"
	media="screen" />
<!-- Flexslider -->
<link rel="stylesheet" href="<%=basePath%>resources/css/flexslider.css"
	media="screen" />
<!-- Magnific popup -->
<link rel="stylesheet"
	href="<%=basePath%>resources/css/magnific-popup.css" media="screen" />
<!-- Styles for Mobile devices -->
<link rel="stylesheet" href="<%=basePath%>resources/css/responsive.css"
	media="screen" />

<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  			<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

<!-- Favicons
		================================================== -->
<link rel="stylesheet" href="<%=basePath%>resources/css/index.css"
	media="screen" />
</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="<%=basePath%>index"> <img alt="Wibupt"
					src="<%=basePath%>wibupt/img/logo_wibupt-m.png"
					style="width:150px;height:60px;">
				</a>
			</div>
			<div class="navbar-collapse collapse" role="navigation">
				<ul class="nav navbar-nav navbar-right hidden-sm nav-tabs">
					<li class="active"><a href="<%=basePath%>index"
						style="font-size: 18px"><i class="icon-home"></i>&nbsp实时校园</a></li>
					<li><a href="<%=basePath%>realtime" style="font-size: 18px"><i
							class="icon-repeat"></i>&nbsp实时流量分析</a></li>
					<li><a href="<%=basePath%>activity" style="font-size: 18px"><i
							class="icon-group"></i>&nbsp活跃分析</a></li>
					<li><a href="<%=basePath%>consumption" style="font-size: 18px"><i
							class="icon-camera"></i>&nbsp消费能力分析</a></li>
					<li><a href="<%=basePath%>goandcome" style="font-size: 18px"><i
							class="icon-resize-full"></i>&nbsp出入校园分析</a></li>
					<li><a href="<%=basePath%>gephi" style="font-size: 18px"><i
							class="icon-magnet"></i>&nbsp关联分析</a></li>
					<li><a href="<%=basePath%>login" style="font-size: 18px"><i
							class="icon-cog"></i>&nbsp设置</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container"
		style="width:100%;height:950px;padding-left:0px;padding-right:0px;">
		<div class="row clearfix" style="margin-left: 0px;margin-right:0px">
			<div class="col-md-12 column"
				style="padding-left:0px;padding-right:0px;">
				<div id="container1" style="height:800px;width:100%;z-index:10;"></div>
				<div id="legend" class=" BMap_noprint anchorBR"
					style="z-index: 10;padding:0px;">
					<div class="legend-text">热力拥挤度图例：</div>
					<a class="legend-item legend-1" href="javascript:void(0);">非常稀疏：1
						<div class="legend-item-wrapper">
							<div class="legend-item-tip">
								非常稀疏：少于10人/100㎡ <span class="legend-item-tip-arrow"></span>
							</div>
						</div>
					</a> <a class="legend-item legend-2" href="javascript:void(0);">稀疏：2
						<div class="legend-item-wrapper">
							<div class="legend-item-tip">
								稀疏：10-20人/100㎡ <span class="legend-item-tip-arrow"></span>
							</div>
						</div>
					</a> <a class="legend-item legend-3" href="javascript:void(0);">一般：3
						<div class="legend-item-wrapper">
							<div class="legend-item-tip">
								一般：20-40人/100㎡ <span class="legend-item-tip-arrow"></span>
							</div>
						</div>
					</a> <a class="legend-item legend-4" href="javascript:void(0);">拥挤：4
						<div class="legend-item-wrapper">
							<div class="legend-item-tip">
								拥挤：40-60人/100㎡ <span class="legend-item-tip-arrow"></span>
							</div>
						</div>
					</a> <a class="legend-item legend-5" href="javascript:void(0);">非常拥挤：5
						<div class="legend-item-wrapper">
							<div class="legend-item-tip">
								非常拥挤：大于60人/100㎡ <span class="legend-item-tip-arrow"></span>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Copyright -->
	<div class="copyright" style="filter: alpha(opacity=90);opacity: 0.9;">
		<center>
			<div style="height:20px;">
				<p>
					<a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy;
					2014~2015
				</p>
			</div>
		</center>
	</div>
	<!-- /Copyright -->
</body>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=51dz08mPaRKDUMKPGVGi9rfF"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/InfoBox/1.2/src/InfoBox_min.js"></script>
<script src="<%=basePath%>wibupt/js/jquery.js"></script>
<script src="<%=basePath%>wibupt/js/highstock.js"></script>
<script src="<%=basePath%>wibupt/js/exporting1.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-tab.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-modal.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-carousel.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/Function.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/index.js"></script>

<script>
		var  place0;
		$(function(){
		    waitingDialog.show();
			var map = new BMap.Map("container1",{enableMapClick:false});//在百度地图容器中创建一个地图
			var point = new BMap.Point(116.364549,39.968112);//定义一个中心点坐标
        	map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        	
        			
        	var b = new BMap.Bounds(new BMap.Point(116.362168,39.965834),new BMap.Point(116.367432,39.9709325));
        	try {   
        		BMapLib.AreaRestriction.setBounds(map, b);
        	} catch (e) {
            	alert(e);
        	}
        			
        	//地图事件设置
        	map.disableDragging();//启用地图拖拽事件，默认启用
       		map.disableDoubleClickZoom();//启用鼠标双击放大，默认启用
       		map.disableKeyboard();//启用键盘上下左右键移动地图

        	//判断浏览区是否支持canvas
        	var elem = document.createElement('canvas');
        	var flag=!!(elem.getContext && elem.getContext('2d'));
        	if (!flag) {
        		alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~');
        	}
        	
			window.overlay = showoverlay();//首次进入立刻显示热力图标注
			var iID=setInterval(showoverlay,300000);//每隔5分钟删除所有已添加覆盖物，重新获取热力图标注
			
	//		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    //  			var activeTab = $(e.target).text(); // 获取已激活的标签页的名称
    //  			if(activeTab!="实时校园")
    //  				window.clearInterval(iID);
   	//		});
   	

        	function showoverlay(){
				heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":60,
    					"gradient":{.3:'rgb(70,176,53)',.5:'rgb(155,199,2)',.7:'rgb(255,174,0)',.8:'rgb(255,114,0)',.9:'rgb(253,48,35)'}
    				});
				map.clearOverlays();
        		$.ajax({
					url:"<%=basePath%>heatmap/getAllHeat/",
					dataType:"json",
					type:"GET",
					success:function(data){
        				var  points=new Array();
    					for(var i=0;i<data.heat.length;i++){
    						var point={
    							"lng":data.heat[i].lng,
    							"lat":data.heat[i].lat,
    							"count":data.heat[i].cnt,
    						};
    						points[i]=point;
    					}
    					var max=data?data.heat[0].cnt:100;
    					map.addOverlay(heatmapOverlay);
            			heatmapOverlay.setDataSet({data:points,max:max});
                		var myIcon1 =new BMap.Icon("<%=basePath%>wibupt/img/049.png", new BMap.Size(90, 90), {imageOffset: new BMap.Size(0, 0)});
                		for(var i=0;i<data.heat.length;i++){
							var marker = new BMap.Marker(new BMap.Point(data.heat[i].lng,data.heat[i].lat));  // 创建标注
							var content =[data.heat[i].monidname,data.heat[i].cnt];
							marker.setIcon(myIcon1);
							map.addOverlay(marker);               // 将标注添加到地图中
							showInfo(content,marker);
							showRealtime(content,marker);
						}
						waitingDialog.hide();
					}, error: function() {
					var data = {
						    "heat": [{
						        "lng": 116.363251,
						        "lat": 39.969802,
						        "cnt": 488,
						        "monidname": "综合餐厅"
						    }, {
						        "lng": 116.36582,
						        "lat": 39.969166,
						        "cnt": 135,
						        "monidname": "学生食堂"
						    }, {
						        "lng": 116.363288,
						        "lat": 39.968705,
						        "cnt": 128,
						        "monidname": "学生公寓4"
						    }, {
						        "lng": 116.363293,
						        "lat": 39.96921,
						        "cnt": 118,
						        "monidname": "学生公寓8"
						    }, {
						        "lng": 116.36573,
						        "lat": 39.970137,
						        "cnt": 110,
						        "monidname": "新科研楼"
						    }, {
						        "lng": 116.363324,
						        "lat": 39.968245,
						        "cnt": 107,
						        "monidname": "学生公寓2"
						    }, {
						        "lng": 116.362901,
						        "lat": 39.967773,
						        "cnt": 96,
						        "monidname": "教四"
						    }, {
						        "lng": 116.364531,
						        "lat": 39.967773,
						        "cnt": 91,
						        "monidname": "教一"
						    }, {
						        "lng": 116.362345,
						        "lat": 39.969251,
						        "cnt": 88,
						        "monidname": "学生公寓5"
						    }, {
						        "lng": 116.362376,
						        "lat": 39.968636,
						        "cnt": 82,
						        "monidname": "学生公寓3"
						    }, {
						        "lng": 116.363216,
						        "lat": 39.970298,
						        "cnt": 82,
						        "monidname": "学生公寓10"
						    }, {
						        "lng": 116.36248,
						        "lat": 39.968249,
						        "cnt": 82,
						        "monidname": "学生公寓1"
						    }, {
						        "lng": 116.36462,
						        "lat": 39.966331,
						        "cnt": 59,
						        "monidname": "教二"
						    }, {
						        "lng": 116.364653,
						        "lat": 39.970457,
						        "cnt": 52,
						        "monidname": "学生公寓6"
						    }, {
						        "lng": 116.362282,
						        "lat": 39.970492,
						        "cnt": 48,
						        "monidname": "学生公寓11"
						    }, {
						        "lng": 116.362237,
						        "lat": 39.970091,
						        "cnt": 47,
						        "monidname": "学生公寓9"
						    }, {
						        "lng": 116.36498,
						        "lat": 39.967154,
						        "cnt": 40,
						        "monidname": "主楼"
						    }, {
						        "lng": 116.367218,
						        "lat": 39.968543,
						        "cnt": 24,
						        "monidname": "学生公寓29"
						    }]
						};
						 var  points=new Array();
    					for(var i=0;i<data.heat.length;i++){
    						var point={
    							"lng":data.heat[i].lng,
    							"lat":data.heat[i].lat,
    							"count":data.heat[i].cnt,
    						};
    						points[i]=point;
    					}
    					var max=data?data.heat[0].cnt:100;
    					map.addOverlay(heatmapOverlay);
            			heatmapOverlay.setDataSet({data:points,max:max});
                		var myIcon1 =new BMap.Icon("<%=basePath%>wibupt/img/049.png", new BMap.Size(90, 90), {imageOffset: new BMap.Size(0, 0)});
                		for(var i=0;i<data.heat.length;i++){
							var marker = new BMap.Marker(new BMap.Point(data.heat[i].lng,data.heat[i].lat));  // 创建标注
							var content =[data.heat[i].monidname,data.heat[i].cnt];
							marker.setIcon(myIcon1);
							map.addOverlay(marker);               // 将标注添加到地图中
							showInfo(content,marker);
							showRealtime(content,marker);
						}
				}
				});
				heatmapOverlay.show();
				waitingDialog.hide();
		}
			var boxcontent1=  "<div class='module' style='border: #DEDEDE 1px solid;border-radius: 7px;background-color:rgba(249, 249, 249, 0.84);padding:15px'><div style='line-height:1.8em;font-size:12px;'>当前位置：<b><span id='heatplace1'></span></b></br>热力指数：<b><span id='heatvalue1'></span></b></div></div>"	
			var infoBox1 = new BMapLib.InfoBox(map,boxcontent1,{boxStyle:{width: "175px"}, closeIconMargin: "10px 10px 0 0",closeIconUrl:'<%=basePath%>wibupt/img/x1.png', enableAutoPan: true ,alignBottom: false});
			infoBox1.disableAutoPan();
			var polygon1 = new BMap.Polygon([
		    new BMap.Point(116.349103,39.973099),
		    new BMap.Point(116.361212,39.973181),
		    new BMap.Point(116.361787,39.961154),
		    new BMap.Point(116.352516,39.961265),		    
	      ], {strokeColor:"#fff", strokeWeight:0.1, strokeOpacity:0,fillOpacity:0.7});
			polygon1.disableMassClear();
	        map.addOverlay(polygon1);
	       
	        
	        var polygon2 = new BMap.Polygon([
		    new BMap.Point(116.367392,39.973596),
		    new BMap.Point(116.376806,39.973431),
		    new BMap.Point(116.377813,39.961375),
		    new BMap.Point(116.367895,39.962151),		    
	      ], {strokeColor:"#fff", strokeWeight:0.1, strokeOpacity:0,fillOpacity:0.7});
	         polygon2.disableMassClear();
	        map.addOverlay(polygon2);
	        
			function openInfo(content,e){
				var opts = {
					width : 0,     // 信息窗口宽度
					height: 0,     // 信息窗口高度
					title : 0 , // 信息窗口标题
					enableMessage:false//设置允许信息窗发送短息
			   };
				var p = e.target;
				var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
				var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
				infoWindow.disableAutoPan();
				place0=	infoWindow.getContent();
			}
			function showInfo(content,marker){
				marker.addEventListener("mouseover",function(e){
					openInfo(content,e);
					var lng1=marker.getPosition().lng;
			    	var lat1=marker.getPosition().lat;
			    	if (lat1>39.970122)
                	{lat1=lat1-0.0008;}
                	else {lat1=lat1+0.0003;}

			    	var  markerlocation1 = new BMap.Point(lng1,lat1);
			    	infoBox1.open(markerlocation1);
                	document.getElementById("heatplace1").innerHTML=place0[0];
					document.getElementById("heatvalue1").innerHTML=place0[1];
				 	infoBox1.open(markerlocation1);
                });
			    marker.addEventListener("mouseout",function(e){
			    	infoBox1.close();
			    });
		    }
			
			function showRealtime(content,marker){
				marker.addEventListener("click",function(e){
			    	openInfo(content,e);
			    	infoBox1.close();
					var lng0=marker.getPosition().lng;
			    	var lat0=marker.getPosition().lat;
			    	if (lat0>39.967627)
			     	{lat0=lat0-0.0025;}
			    	var  markerlocation0 = new BMap.Point(lng0,lat0);
				});
		    }
 	});
	
	</script>