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
<title>Wizone - 基于WiFi数据的展厅分析</title>
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
	    <style>
        /* Tooltip */
        .tip + .tooltip > .tooltip-inner {
            text-align: left;
            width: 160px;
            background-color: rgba(50, 50, 50, 0.7);
            border-width: 0px;
            border-color: rgb(51, 51, 51);
            border-radius: 4px;
            color: rgb(255, 255, 255);
            border-style: solid;
            padding: 10px;
            font-size: 13px;
        }
        /* Tooltip on top */
        .tip + .tooltip.top > .tooltip-arrow {
            border-top: 5px solid #ffffff;
        }
        /* Tooltip on bottom */
        .tip + .tooltip.bottom > .tooltip-arrow {
            border-bottom: 5px solid blue;
        }
        /* Tooltip on left */
        .tip + .tooltip.left > .tooltip-arrow {
            border-left: 5px solid red;
        }
        /* Tooltip on right */
        .tip + .tooltip.right > .tooltip-arrow {
            border-right: 5px solid black;
        }
    </style>
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
					src="<%=basePath%>wibupt/img/logo.png"
					style="width:150px;height:60px;"> </a>
			</div>
			<div class="navbar-collapse collapse" role="navigation">
				<ul class="nav navbar-nav navbar-left hidden-sm nav-tabs">
					<li class="active"><a href="<%=basePath%>index" style="font-size: 18px"><i
							class="icon-home"></i>&nbsp展厅热点</a>
					</li>
					<li><a href="<%=basePath%>realtime"
						style="font-size: 18px"><i class="icon-repeat"></i>&nbsp实时流量分析</a>
					</li>
					<li><a href="<%=basePath%>activity" style="font-size: 18px"><i
							class="icon-group"></i>&nbsp活跃分析</a>
					</li>
					<li><a href="<%=basePath%>consumption" style="font-size: 18px"><i
							class="icon-camera"></i>&nbsp手机品牌分析</a>
					</li>
					<li><a href="<%=basePath%>gephi" style="font-size: 18px"><i
							class="icon-magnet"></i>&nbsp关联分析</a>
					</li>
					<li><a href="<%=basePath%>login" style="font-size: 18px"><i
							class="icon-cog"></i>&nbsp设置</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div style="position:relative;margin-left: auto;margin-right:auto;width: 800px;height:600px">
    <img src="wibupt/img/map.jpg" width="800" height="575">
    <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
            <h3 style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 40px; height: 40px; left: 20px; top: 100px; z-index: -7993648; user-select: none;">F1</h3>
        <a href="<%=basePath%>realtime?id=1"><span id="1" data-placement="bottom" class="tip" data-tip="tip-1" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 220px; top: 160px; z-index: -7993648; user-select: none;"
              title="">
               <div class="heatmap1"  style="position: absolute; padding: 0px; margin: 0; border: 0px; cursor: pointer; width: 880px; height: 460px; border-radius:90px;left: -120px; top: -120px; z-index: -7993648; user-select: none;"></div>
        </span></a>
       
            <a href="<%=basePath%>realtime?id=2"><span data-placement="bottom" class="tip" data-tip="tip-2" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 364px; top: 160px; z-index: -7993648; user-select: none;"
                  title="">
        </span></a>
        
            <a href="<%=basePath%>realtime?id=3"><span data-placement="bottom" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 507px; top: 160px; z-index: -7993648; user-select: none;"
                  title="">
                   <div class="heatmap3 tip"  data-tip="tip-3" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
       
            <a href="<%=basePath%>realtime?id=4"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 220px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap4 tip" data-tip="tip-4" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
        
            <a href="<%=basePath%>realtime?id=5"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 364px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap5 tip" data-tip="tip-5" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
        
           <a href="<%=basePath%>realtime?id=6"> <span  data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 507px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap6 tip" data-tip="tip-6" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
        
        </div>
    </div>
</div>

<div style="position:relative;margin-left: auto;margin-right:auto;width: 800px;height:600px">
    <img src="wibupt/img/map.jpg" width="800" height="575">
    <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
            <h3 style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 40px; height: 40px; left: 20px; top: 100px; z-index: -7993648; user-select: none;">F3</h3>
        <a href="<%=basePath%>realtime?id=7"><span data-placement="bottom" class="tip" data-tip="tip-7" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 220px; top: 160px; z-index: -7993648; user-select: none;"
              title="">
              <div class="heatmap7" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 880px; height: 460px; border-radius:90px;left: -120px; top: -120px; z-index: -7993648; user-select: none;"></div>
        </span></a>
            <a href="<%=basePath%>realtime?id=8"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 364px; top: 160px; z-index: -7993648; user-select: none;"
                  title="">
                   <div class="heatmap8 tip" data-tip="tip-8" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
       
            <a href="<%=basePath%>realtime?id=9"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 507px; top: 160px; z-index: -7993648; user-select: none;"
                  title="">
                   <div class="heatmap9 tip" data-tip="tip-9" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: opx; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
       
            <a href="<%=basePath%>realtime?id=10"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 220px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                   <div class="heatmap10 tip" data-tip="tip-10" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
       
            <a href="<%=basePath%>realtime?id=11"><span data-placement="bottom" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 364px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                   <div class="heatmap11 tip" data-tip="tip-11" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
       
            <a href="<%=basePath%>realtime?id=12"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 507px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap12 tip" data-tip="tip-12" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
        
        </div>
    </div>
</div>

<div style="position:relative;margin-left: auto;margin-right:auto;width: 800px;height:600px">
    <img src="wibupt/img/map.jpg" width="800" height="575">
    <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
            <h3 style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 40px; height: 40px; left: 20px; top: 100px; z-index: -7993648; user-select: none;">F5</h3>
        <a href="<%=basePath%>realtime?id=13"><span data-placement="bottom" class="tip" data-tip="tip-13" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 220px; top: 160px; z-index: -7993648; user-select: none;"
              title="">
              <div class="heatmap13" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 880px; height: 460px; border-radius:90px;left: -120px; top: -120px; z-index: -7993648; user-select: none;"></div>
        </span></a>
            <a href="<%=basePath%>realtime?id=14"><span data-placement="bottom" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 364px; top: 160px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap14 tip" data-tip="tip-14" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
            <a href="<%=basePath%>realtime?id=15"><span data-placement="bottom" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 507px; top: 160px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap15 tip" data-tip="tip-15" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
            <a href="<%=basePath%>realtime?id=16"><span data-placement="bottom" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 220px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap16 tip"  data-tip="tip-16" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
            <a href="<%=basePath%>realtime?id=17"><span data-placement="bottom"  style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 364px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap17 tip" data-tip="tip-17" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a> 
            <a href="<%=basePath%>realtime?id=18"><span data-placement="bottom" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url('wibupt/img/049.png'); width: 40px; height: 40px; left: 507px; top: 305px; z-index: -7993648; user-select: none;"
                  title="">
                  <div class="heatmap18 tip" data-tip="tip-18" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 80px; height: 80px; border-radius:30px;left: 0px; top: 0px; z-index: -7993648; user-select: none;"></div>
        </span></a>
        </div>
    </div>
</div>
	<!-- Copyright -->
    <div class="copyright" style="filter: alpha(opacity=90);opacity: 0.9;">
		<center>
			<div style="height:20px;">
				<p>
<!-- 			<a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy;
					2014~2015
-->
				</p>
			</div>
		</center>
	</div>
	<!-- Tips content -->
<div id="dataOfAll">

</div>
</body>
	<!-- /Copyright -->
</body>
<script src="<%=basePath%>wibupt/js/jquery.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap.min.js"></script>
<script src="<%=basePath%>wibupt/js/highstock.js"></script>
<script src="<%=basePath%>wibupt/js/exporting1.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-tab.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-modal.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-carousel.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/Function.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/heatmap.min.js"></script>

<script>
		$(function(){
		waitingDialog.show();
		showoverlay();
            
		    //waitingDialog.show();
		
			setInterval(showoverlay,300000);//每隔5分钟删除所有已添加覆盖物，重新获取热力图标注
   	
        	function showoverlay(){
        	$('#dataOfAll').empty();
        		$.ajax({
					url:"<%=basePath%>heatmap/getAllHeat/",
					dataType:"json",
					type:"GET",
					success:function(data){
        				var  points=new Array();
    					for(var i=0;i<data.heat.length;i++){
    						var point={
    							"groupid":data.heat[i].groupid,
    							"count":data.heat[i].cnt,
    							"groupname": data.heat[i].monidname
    						};
    						points[i]=point;
    					}
    					console.log(points);
    					var dataStr='';
    					for(var i= 0,len=points.length;i < len;i++ ){
    					dataStr = "<div id='tip-"+points[i].groupid+"' class='tip-content hidden'><span>当前位置：<b>"+points[i].groupname+"</b></span><br/><span>热力指数：<b>"+points[i].count+"</b></span</div>";
    					$('#dataOfAll').append(dataStr);
    					}
    					console.log(dataStr)
    					 $('.tip').each(function () {
		              		 $(this).tooltip(
				                {
				                    html: true,
				                    title: $('#' + $(this).data('tip')).html()
				                });
		        		});
    					
    					//var max=data?data.heat[0].cnt:100;
    
    					var max = 1; // 以200作为人多的标准 
    					for (var j = 0; j < 18; j++) {
    						if (data.heat[j].cnt > max) {
    							max = data.heat[j].cnt;
    						}
    					}
						
						var heatmap1 = h337.create({
						  container: document.querySelector('.heatmap1'),
						  maxOpacity: .5,
						  minOpacity: 0,
						  blur: .75,

						});
						
						var data1 = {
							max:max,
							data:[
								{ x: 140, y: 130, value: points[0].count,radius:150},
								{ x: 300, y: 140, value: points[1].count,radius:150},
								{ x: 430, y: 140, value: points[2].count,radius:150},
								{ x: 140, y: 280, value: points[3].count,radius:150},
								{ x: 300, y: 280, value: points[4].count,radius:150},
								{ x: 430, y: 280, value: points[5].count,radius:150}  
							]
						};
						
						heatmap1.setData(data1);
						
						var heatmap7 = h337.create({
						  container: document.querySelector('.heatmap7'),
						  maxOpacity: .5,
						  minOpacity: 0,
						  blur: .75
						});
						
						var data2 = {
							max:max,
							data:[
								{ x: 140, y: 130, value: points[6].count,radius:150},
								{ x: 300, y: 140, value: points[7].count,radius:150},
								{ x: 430, y: 140, value: points[8].count,radius:150},
								{ x: 140, y: 280, value: points[9].count,radius:150},
								{ x: 300, y: 280, value: points[10].count,radius:150},
								{ x: 430, y: 280, value: points[11].count,radius:150}  
							]
						};
						
						heatmap7.setData(data2);
						
						var heatmap13 = h337.create({
						  container: document.querySelector('.heatmap13'),
						  maxOpacity: .5,
						  minOpacity: 0,
						  blur: .75
						});
						
						var data3 = {
							max:max,
							data:[
								{ x: 140, y: 130, value: points[12].count,radius:150},
								{ x: 300, y: 140, value: points[13].count,radius:150},
								{ x: 430, y: 140, value: points[14].count,radius:150},
								{ x: 140, y: 280, value: points[15].count,radius:150},
								{ x: 300, y: 280, value: points[16].count,radius:150},
								{ x: 430, y: 280, value: points[17].count,radius:150}  
							]
						};
						
						heatmap13.setData(data3);
    					 
						waitingDialog.hide();
					}, error: function() {
					
				   }
				});
		}
 	});
	
	</script>