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
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

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
<link rel="stylesheet" href="<%=basePath%>resources/css/realtime.css"
	media="screen" />

<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  			<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

<!-- Favicons
		================================================== -->
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
					<li><a href="<%=basePath%>index" style="font-size: 18px"><i
							class="icon-home"></i>&nbsp展厅热点</a>
					</li>
					<li class="active"><a href="<%=basePath%>realtime"
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
	<div id="page-nav" style="display: block;">
		<nav>
			<ul class="pagination" onselectstart="return false"
				style="display: block;">
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教一实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图"  value="1"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building1.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">一层东北</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教二实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="2"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building2.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">一层东中间</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教三实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="3"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building3.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">一层东南</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教四实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="4"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building4.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">一层西北</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看新科研楼实时流量图" value="5"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building5.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">一层西中间</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看主楼实时流量图" value="6"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building6.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">一层西南</p>
				</li>
			</ul>
		</nav>
	</div>
	<div id="page-nav" style="display: block;">
		<nav>
			<ul class="pagination" onselectstart="return false"
				style="display: block;">
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看综合餐厅实时流量图" value="7"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building7.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">三层东北</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生食堂实时流量图" value="8"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building8.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">三层东中间</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓1实时流量图" value="9"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building9.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">三层东南</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="10"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building10.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">三层西北</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教一实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图"  value="11"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building11.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">三层西中间</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教二实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="12"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building12.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">三层西南</p>
				</li>
			</ul>
		</nav>
	</div>
	<div id="page-nav" style="display: block;">
		<nav>
			<ul class="pagination" onselectstart="return false"
				style="display: block;">
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓4实时流量图" value="13"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building13.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">五层东北</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓5实时流量图" value="14"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building14.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">五层东中间</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓6实时流量图" value="15"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building15.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">五层东南</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓8实时流量图" value="16"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building16.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">五层西北</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓9实时流量图" value="17"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building17.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">五层西中间</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓10实时流量图" value="18"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building18.jpg);background-repeat: no-repeat;
    background-position: center; background-size: 75px;"><p
						class="buildingName">五层西南</p>
				</li>
			</ul>
		</nav>
	<div class="container" style="width:93%;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<hr style="opacity:0.4">
				<div class="row clearfix">
					<div id="container-line1"
						class="col-md-12 col-xs-12 column show-line"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group1" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line1"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph1('day');">
										今天</button>
									<button id="line2" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph1('week');">
										近7天</button>
									<button id="line3" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph1('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-1" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line2" class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group2" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line4"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph2('day');">
										今天</button>
									<button id="line5" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph2('week');">
										近7天</button>
									<button id="line6" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph2('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-2" style="height:320px"></div>
						</div>
					</div>
				</div>
				<div class="row clearfix">
					<div id="container-line3" class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group3" style="font-weight: bold;"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line7"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph3('day');">
										今天</button>
									<button id="line8" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph3('week');">
										近7天</button>
									<button id="line9" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph3('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-3" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line4" class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group4" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line10"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph4('day');">
										今天</button>
									<button id="line11"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph4('week');">
										近7天</button>
									<button id="line12"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph4('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-4" style="height:320px"></div>
						</div>
					</div>
				</div>
				<div class="row clearfix">
					<div id="container-line5" class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group5" style="font-weight: bold;color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line13"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph5('day');">
										今天</button>
									<button id="line14"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph5('week');">
										近7天</button>
									<button id="line15"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph5('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-5" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line6" class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group6"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line16"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph6('day');">
										今天</button>
									<button id="line17"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph6('week');">
										近7天</button>
									<button id="line18"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph6('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-6" style="height:320px"></div>
						</div>
					</div>
				</div>
				<div class="row clearfix">
					<div id="container-line7" class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group7" style="font-weight: bold;"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line19"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph7('day');">
										今天</button>
									<button id="line20"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph7('week');">
										近7天</button>
									<button id="line21"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph7('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-7" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line8" class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group8" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line22"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph8('day');">
										今天</button>
									<button id="line23"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph8('week');">
										近7天</button>
									<button id="line24"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph8('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-8" style="height:320px"></div>
						</div>
					</div>
				</div>



				<!-- 学1 、学2 -->
				<div class="row clearfix">
					<div id="container-line9" class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group9" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line25"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph9('day');">
										今天</button>
									<button id="line26"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph9('week');">
										近7天</button>
									<button id="line27"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph9('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-9" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line10"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group10" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line28"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph10('day');">
										今天</button>
									<button id="line29"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph10('week');">
										近7天</button>
									<button id="line30"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph10('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-10" style="height:320px"></div>
						</div>
					</div>
				</div>

				<!-- 学3、学4 -->
				<div class="row clearfix">
					<div id="container-line11"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group11" style="font-weight: bold;"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line31"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph11('day');">
										今天</button>
									<button id="line32"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph11('week');">
										近7天</button>
									<button id="line33"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph11('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#000;margin-top:10px">
							<div id="container6-11" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line12"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group12" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line34"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph12('day');">
										今天</button>
									<button id="line35"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph12('week');">
										近7天</button>
									<button id="line36"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph12('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-12" style="height:320px"></div>
						</div>
					</div>
				</div>

				<!--学5、学6  -->
				<div class="row clearfix">
					<div id="container-line13"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group13" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line37"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph13('day');">
										今天</button>
									<button id="line38"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph13('week');">
										近7天</button>
									<button id="line39"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph13('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-13" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line14"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group14" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line40"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph14('day');">
										今天</button>
									<button id="line41"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph14('week');">
										近7天</button>
									<button id="line42"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph14('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-14" style="height:320px"></div>
						</div>
					</div>
				</div>

				<!-- 学8、学9 -->
				<div class="row clearfix">
					<div id="container-line15"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group15" style="font-weight: bold;"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line43"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph15('day');">
										今天</button>
									<button id="line44"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph15('week');">
										近7天</button>
									<button id="line45"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph15('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-15" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line16"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group16" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line46"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph16('day');">
										今天</button>
									<button id="line47"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph16('week');">
										近7天</button>
									<button id="line48"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph16('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-16" style="height:320px"></div>
						</div>
					</div>
				</div>

				<!-- 学10、学11 -->
				<div class="row clearfix">
					<div id="container-line17"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group17" style="color:#fff"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line49"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph17('day');">
										今天</button>
									<button id="line50"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph17('week');">
										近7天</button>
									<button id="line51"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph17('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-17" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line18"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group18" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line52"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showgraph18('day');">
										今天</button>
									<button id="line53"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph18('week');">
										近7天</button>
									<button id="line54"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showgraph18('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-18" style="height:320px"></div>
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
			<div style="height:20px">
				<p>
<!--
					<a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy;
					2013~2014
-->
				</p>
			</div>
		</center>
	</div>
	<!-- /Copyright -->
</body>
<script src="<%=basePath%>wibupt/js/jquery.js"></script>
<script src="<%=basePath%>wibupt/js/highstock.js"></script>
<script src="<%=basePath%>wibupt/js/exporting1.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-tab.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-carousel.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/Function.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/index.js"></script>
<script type="text/javascript"
	src="<%=basePath%>wibupt/js/unslider-min.js"></script>
<script>
		function showgraph1(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[0];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line1").removeClass("btn-info").addClass("btn-primary");
		        $("#line2").removeClass("btn-primary").addClass("btn-info");
		        $("#line3").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line2").removeClass("btn-info").addClass("btn-primary");
		        $("#line1").removeClass("btn-primary").addClass("btn-info");
		        $("#line3").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line3").removeClass("btn-info").addClass("btn-primary");
		        $("#line2").removeClass("btn-primary").addClass("btn-info");
		        $("#line1").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-1').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            					},
		                },
		
		                navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#fff'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                
		                
		                
		                title: {
		                    text: info,
		                    style: {
		                        color: '#fff',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#fff',
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
		                    gridLineColor:'#fff',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#039'
		                        },
		                        itemHiddenStyle: {
		                            color: 'gray'
		                        }
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#fff'
		                    	}
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-1").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 教二 -->
<script>		
		function showgraph2(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[1];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line4").removeClass("btn-info").addClass("btn-primary");
		        $("#line5").removeClass("btn-primary").addClass("btn-info");
		        $("#line6").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line5").removeClass("btn-info").addClass("btn-primary");
		        $("#line4").removeClass("btn-primary").addClass("btn-info");
		        $("#line6").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line6").removeClass("btn-info").addClass("btn-primary");
		        $("#line5").removeClass("btn-primary").addClass("btn-info");
		        $("#line4").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-2').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            					},
		                },
						navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#000'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#000',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#000',
		                    lineColor: '#000',
		                    tickColor: '#000',
		                    labels: {
		                        style: {
		                            color: '#000',
		                            font: '11px Trebuchet MS, Verdana, sans-serif'
		                        }
		                    },
		                    type: 'category',
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		                    },
		                },
		                yAxis: {
		                    min: 0,
		                    gridLineColor:'#000',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: 'black'
		                        },
		                        itemHoverStyle: {
		                            color: '#000'
		                        },
		                        itemHiddenStyle: {
		                            color: '#000'
		                        }
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#000'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-2").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 教三 -->
<script>
		function showgraph3(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[2];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line7").removeClass("btn-info").addClass("btn-primary");
		        $("#line8").removeClass("btn-primary").addClass("btn-info");
		        $("#line9").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line8").removeClass("btn-info").addClass("btn-primary");
		        $("#line7").removeClass("btn-primary").addClass("btn-info");
		        $("#line9").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line9").removeClass("btn-info").addClass("btn-primary");
		        $("#line8").removeClass("btn-primary").addClass("btn-info");
		        $("#line7").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-3').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            					},
		                },
		
		                
		                navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#000'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#000',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#000',
		                    lineColor: '#000',
		                    tickColor: '#000',
		                    labels: {
		                        style: {
		                            color: '#000',
		                            font: '11px Trebuchet MS, Verdana, sans-serif'
		                        }
		                    },
		                    type: 'category',
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		                    },
		                },
		                yAxis: {
		                    min: 0,
		                    gridLineColor:'#000',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: 'black'
		                        },
		                        itemHoverStyle: {
		                            color: '#000'
		                        },
		                        itemHiddenStyle: {
		                            color: '#000'
		                        }
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#000'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-3").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 教四 -->
<script>	
		function showgraph4(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[3];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line10").removeClass("btn-info").addClass("btn-primary");
		        $("#line11").removeClass("btn-primary").addClass("btn-info");
		        $("#line12").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line11").removeClass("btn-info").addClass("btn-primary");
		        $("#line10").removeClass("btn-primary").addClass("btn-info");
		        $("#line12").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line12").removeClass("btn-info").addClass("btn-primary");
		        $("#line11").removeClass("btn-primary").addClass("btn-info");
		        $("#line10").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-4').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            					},
		                },
						navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#fff'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#fff',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#fff',
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
		                    gridLineColor:'#fff',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#039'
		                        },
		                        itemHiddenStyle: {
		                            color: 'gray'
		                        }
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#fff'
		                    	}
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-4").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 新科研楼 -->
<script>
		function showgraph5(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[4];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line13").removeClass("btn-info").addClass("btn-primary");
		        $("#line14").removeClass("btn-primary").addClass("btn-info");
		        $("#line15").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line14").removeClass("btn-info").addClass("btn-primary");
		        $("#line13").removeClass("btn-primary").addClass("btn-info");
		        $("#line15").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line15").removeClass("btn-info").addClass("btn-primary");
		        $("#line14").removeClass("btn-primary").addClass("btn-info");
		        $("#line13").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-5').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            					},
		                },
		
		                navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#fff'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                
		                
		                
		                title: {
		                    text: info,
		                    style: {
		                        color: '#fff',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#fff',
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
		                    gridLineColor:'#fff',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#039'
		                        },
		                        itemHiddenStyle: {
		                            color: 'gray'
		                        }
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#fff'
		                    	}
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-5").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 主楼 -->
<script>	
		function showgraph6(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[5];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line16").removeClass("btn-info").addClass("btn-primary");
		        $("#line17").removeClass("btn-primary").addClass("btn-info");
		        $("#line18").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line17").removeClass("btn-info").addClass("btn-primary");
		        $("#line16").removeClass("btn-primary").addClass("btn-info");
		        $("#line18").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line18").removeClass("btn-info").addClass("btn-primary");
		        $("#line17").removeClass("btn-primary").addClass("btn-info");
		        $("#line16").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-6').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            					},
		                },
						navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#000'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#000',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#000',
		                    lineColor: '#000',
		                    tickColor: '#000',
		                    labels: {
		                        style: {
		                            color: '#000',
		                            font: '11px Trebuchet MS, Verdana, sans-serif'
		                        }
		                    },
		                    type: 'category',
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		                    },
		                },
		                yAxis: {
		                    min: 0,
		                    gridLineColor:'#000',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: 'black'
		                        },
		                        itemHoverStyle: {
		                            color: '#000'
		                        },
		                        itemHiddenStyle: {
		                            color: '#000'
		                        }
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#000'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-6").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 综合餐厅 -->
<script>
		function showgraph7(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[6];		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line19").removeClass("btn-info").addClass("btn-primary");
		        $("#line20").removeClass("btn-primary").addClass("btn-info");
		        $("#line21").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line20").removeClass("btn-info").addClass("btn-primary");
		        $("#line19").removeClass("btn-primary").addClass("btn-info");
		        $("#line21").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line21").removeClass("btn-info").addClass("btn-primary");
		        $("#line20").removeClass("btn-primary").addClass("btn-info");
		        $("#line19").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-7').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            					},
		                },
		
		                
		                navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#000'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#000',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#000',
		                    lineColor: '#000',
		                    tickColor: '#000',
		                    labels: {
		                        style: {
		                            color: '#000',
		                            font: '11px Trebuchet MS, Verdana, sans-serif'
		                        }
		                    },
		                    type: 'category',
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		                    },
		                },
		                yAxis: {
		                    min: 0,
		                    gridLineColor:'#000',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: 'black'
		                        },
		                        itemHoverStyle: {
		                            color: '#000'
		                        },
		                        itemHiddenStyle: {
		                            color: '#000'
		                        }
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#000'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-7").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 学生食堂 -->
<script>
		function showgraph8(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[7];
		
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line22").removeClass("btn-info").addClass("btn-primary");
		        $("#line23").removeClass("btn-primary").addClass("btn-info");
		        $("#line24").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line23").removeClass("btn-info").addClass("btn-primary");
		        $("#line22").removeClass("btn-primary").addClass("btn-info");
		        $("#line24").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line24").removeClass("btn-info").addClass("btn-primary");
		        $("#line23").removeClass("btn-primary").addClass("btn-info");
		        $("#line22").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-8').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            					},
		                },
						navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#fff'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#fff',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#fff',
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
		                    gridLineColor:'#fff',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#039'
		                        },
		                        itemHiddenStyle: {
		                            color: 'gray'
		                        }
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#fff'
		                    	}
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-8").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
		
	</script>

<!-- 学生公寓1 -->
<script>		
		function showgraph9(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[8];
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line25").removeClass("btn-info").addClass("btn-primary");
		        $("#line26").removeClass("btn-primary").addClass("btn-info");
		        $("#line27").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line26").removeClass("btn-info").addClass("btn-primary");
		        $("#line25").removeClass("btn-primary").addClass("btn-info");
		        $("#line27").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line27").removeClass("btn-info").addClass("btn-primary");
		        $("#line26").removeClass("btn-primary").addClass("btn-info");
		        $("#line25").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-9').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#fff',
                				fontWeight: 'bold'
            					},
		                },
		
		                navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#fff'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                
		                
		                
		                title: {
		                    text: info,
		                    style: {
		                        color: '#fff',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#fff',
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
		                    gridLineColor:'#fff',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#039'
		                        },
		                        itemHiddenStyle: {
		                            color: 'gray'
		                        }
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#fff'
		                    	}
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#fff',
		                            font: 'bold 15px "微软雅黑"'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-9").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 学生公寓2 -->
<script>		
		function showgraph10(str) {
			var today=((new Date("<%=timer_%>")).getTime()) / 1000;
		    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
		    var xx = x / 1000;
		    var xxx = xx - 300;
		    var kaishi, jieshu, kaishi1, jieshu1, init;
		    var bool, info;
		    var xxxx = today;
		    var place=groups[9];
		    var info, datainfo;
		    if (str == 'day') {
		        kaishi = xxxx;
		        jieshu = xx;
		        kaishi1 = "<%=time%>";
		        jieshu1 = "<%=time%>";
		        init = 0;
		        bool = false;
		        $("#line28").removeClass("btn-info").addClass("btn-primary");
		        $("#line29").removeClass("btn-primary").addClass("btn-info");
		        $("#line30").removeClass("btn-primary").addClass("btn-info");
		        info = '今天该区域实时人流量';
		    } else if (str == 'week') {
		        kaishi = xxxx - 7 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi7%>";
		        jieshu1 = "<%=time1%>";
		        init = 1;
		        bool = true;
		        $("#line29").removeClass("btn-info").addClass("btn-primary");
		        $("#line28").removeClass("btn-primary").addClass("btn-info");
		        $("#line30").removeClass("btn-primary").addClass("btn-info");
		        info = '近7天该区域历史人流量';
		    } else if (str == 'month') {
		        kaishi = xxxx - 30 * 24 * 60 * 60;
		        jieshu = xxxx;
		        kaishi1 = "<%=kaishi30%>";
		        jieshu1 = "<%=time1%>";
		        init = 2;
		        bool = true;
		        $("#line30").removeClass("btn-info").addClass("btn-primary");
		        $("#line29").removeClass("btn-primary").addClass("btn-info");
		        $("#line28").removeClass("btn-primary").addClass("btn-info");
		        info = '近30天该区域历史人流量';
		    }
		    $.ajax({
				url: "<%=basePath%>realtimedataIn/realtimedataIn/",
				data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
		            Highcharts.setOptions({
						global : {
							useUTC : false
						},
						colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
							"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
						backgroundColor: {  
				        	linearGradient: [0, 0, 500, 500],  
				            stops: [  
				                [0, 'rgb(255, 255, 255)'],  
				                [1, 'rgb(240, 240, 255)']  
				            ]  
						},  
				        borderWidth: 2,  
				        plotBackgroundColor: null,  
				        plotShadow: true,  
				        plotBorderWidth: 1  
			       	});
		            var y1;
		            $('#container6-10').highcharts('StockChart', {
		                chart: {
		            		backgroundColor: 'rgba(0,0,0,0)',
		                    events: {
		                        load: function() {
		                            // set up the updating of the chart each second
		                            var series = this.series[0];
		                            setInterval(function() {
		                                $.ajax({
		                                    url: "<%=basePath%>realtimedataIn/realdata/",
		                                    data:"place=" + place + "&time=" + xxxx,
		                                    dataType: "json",
		                                    type: "POST",
		                                    success: function(data) {
		                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
		                                        series.addPoint([x + 300000, y1], true, true);
		                                        xxx = xxx + 300;
		                                        x = x + 300000;
		                                    }
		                                });
		                            },
		                            300000);
		                        }
		                    }
		                },
		
		                rangeSelector: {
		                    buttons: [{
		                        count: 1,
		                        type: 'day',
		                        text: '天'
		                    },
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
		                    inputStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            				},
		                    selected: init,
		                    labelStyle: {
                				color: '#000',
                				fontWeight: 'bold'
            					},
		                },
						navigator:{
		                	xAxis: {
    							tickWidth: 0,
    							lineWidth: 0,
    							gridLineWidth: 1,
    							tickPixelInterval: 200,
    							labels: {
        							align: 'left',
        							style: {
            							color: '#000'
        							},
        							x: 3,
        							y: -4
    							}
							},
		                },
		                title: {
		                    text: info,
		                    style: {
		                        color: '#000',
		                        font: 'bold 15px "微软雅黑"'
		                    }
		                },
		                xAxis: {
		                    gridLineWidth: 1,
		                    gridLineColor:'#000',
		                    lineColor: '#000',
		                    tickColor: '#000',
		                    labels: {
		                        style: {
		                            color: '#000',
		                            font: '11px Trebuchet MS, Verdana, sans-serif'
		                        }
		                    },
		                    type: 'category',
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
		                        }
		                    },
		                },
		                yAxis: {
		                    min: 0,
		                    gridLineColor:'#000',
		                    legend: {
		                        itemStyle: {
		                            font: '9pt Trebuchet MS, Verdana, sans-serif',
		                            color: '#fff'
		                        },
		                        itemHoverStyle: {
		                            color: '#000'
		                        },
		                        itemHiddenStyle: {
		                            color: '#000'
		                        }
		                    },
		                    labels:{
		                    	style:{
		                    		color:'#000'
		                    	}
		                    },
		                    title: {
		                        text: '',
		                        style: {
		                            color: '#000',
		                            font: 'bold 15px "微软雅黑"'
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
		                        activeColor: 'red',
		                        animation: true,
		                        arrowSize: 15,
		                        inactiveColor: '#CCC',
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
		
		                series: [{
		                    name: '流量数据',
		                    data: jsonObj.data
		                }]
		            });
				}, error: function() {
					document.getElementById("container6-10").innerHTML = "<div id=\"preloader\"></div>";
				}
			});	
		}
	</script>

<!-- 学生公寓3 -->
<script>	
	function showgraph11(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[10];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line31").removeClass("btn-info").addClass("btn-primary");
	        $("#line32").removeClass("btn-primary").addClass("btn-info");
	        $("#line33").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line32").removeClass("btn-info").addClass("btn-primary");
	        $("#line31").removeClass("btn-primary").addClass("btn-info");
	        $("#line33").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line33").removeClass("btn-info").addClass("btn-primary");
	        $("#line32").removeClass("btn-primary").addClass("btn-info");
	        $("#line31").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-11').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#000'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#000',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#000',
	                    lineColor: '#000',
	                    tickColor: '#000',
	                    labels: {
	                        style: {
	                            color: '#000',
	                            font: '11px Trebuchet MS, Verdana, sans-serif'
	                        }
	                    },
	                    type: 'category',
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
	                        }
	                    },
	                },
	                yAxis: {
	                    min: 0,
	                    gridLineColor:'#000',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: '#fff'
	                        },
	                        itemHoverStyle: {
	                            color: '#000'
	                        },
	                        itemHiddenStyle: {
	                            color: '#000'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#000'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-11").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>

<!-- 学生公寓4 -->
<script>	
	function showgraph12(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[11];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line34").removeClass("btn-info").addClass("btn-primary");
	        $("#line35").removeClass("btn-primary").addClass("btn-info");
	        $("#line36").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line35").removeClass("btn-info").addClass("btn-primary");
	        $("#line34").removeClass("btn-primary").addClass("btn-info");
	        $("#line36").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line36").removeClass("btn-info").addClass("btn-primary");
	        $("#line35").removeClass("btn-primary").addClass("btn-info");
	        $("#line34").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-12').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#fff'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#fff',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#fff',
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
	                    gridLineColor:'#fff',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: '#fff'
	                        },
	                        itemHoverStyle: {
	                            color: '#039'
	                        },
	                        itemHiddenStyle: {
	                            color: 'gray'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#fff'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#fff',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-12").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}	
	</script>

<!-- 学生公寓5 -->
<script>	
	function showgraph13(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[12];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line37").removeClass("btn-info").addClass("btn-primary");
	        $("#line38").removeClass("btn-primary").addClass("btn-info");
	        $("#line39").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line38").removeClass("btn-info").addClass("btn-primary");
	        $("#line37").removeClass("btn-primary").addClass("btn-info");
	        $("#line39").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line39").removeClass("btn-info").addClass("btn-primary");
	        $("#line38").removeClass("btn-primary").addClass("btn-info");
	        $("#line37").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-13').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#fff'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#fff',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#fff',
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
	                    gridLineColor:'#fff',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: '#fff'
	                        },
	                        itemHoverStyle: {
	                            color: '#039'
	                        },
	                        itemHiddenStyle: {
	                            color: 'gray'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#fff'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#fff',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-13").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>

<!-- 学生公寓6 -->
<script>	
	function showgraph14(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[13];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line40").removeClass("btn-info").addClass("btn-primary");
	        $("#line41").removeClass("btn-primary").addClass("btn-info");
	        $("#line42").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line41").removeClass("btn-info").addClass("btn-primary");
	        $("#line40").removeClass("btn-primary").addClass("btn-info");
	        $("#line42").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line42").removeClass("btn-info").addClass("btn-primary");
	        $("#line41").removeClass("btn-primary").addClass("btn-info");
	        $("#line40").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-14').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#000'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#000',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#000',
	                    lineColor: '#000',
	                    tickColor: '#000',
	                    labels: {
	                        style: {
	                            color: '#000',
	                            font: '11px Trebuchet MS, Verdana, sans-serif'
	                        }
	                    },
	                    type: 'category',
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
	                        }
	                    },
	                },
	                yAxis: {
	                    min: 0,
	                    gridLineColor:'#000',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: 'black'
	                        },
	                        itemHoverStyle: {
	                            color: '#000'
	                        },
	                        itemHiddenStyle: {
	                            color: '#000'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#000'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-14").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>

<!-- 学生公寓8 -->
<script>	
	function showgraph15(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[14];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line43").removeClass("btn-info").addClass("btn-primary");
	        $("#line44").removeClass("btn-primary").addClass("btn-info");
	        $("#line45").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line44").removeClass("btn-info").addClass("btn-primary");
	        $("#line43").removeClass("btn-primary").addClass("btn-info");
	        $("#line45").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line45").removeClass("btn-info").addClass("btn-primary");
	        $("#line44").removeClass("btn-primary").addClass("btn-info");
	        $("#line43").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-15').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#000'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#000',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#000',
	                    lineColor: '#000',
	                    tickColor: '#000',
	                    labels: {
	                        style: {
	                            color: '#000',
	                            font: '11px Trebuchet MS, Verdana, sans-serif'
	                        }
	                    },
	                    type: 'category',
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
	                        }
	                    },
	                },
	                yAxis: {
	                    min: 0,
	                    gridLineColor:'#000',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: 'black'
	                        },
	                        itemHoverStyle: {
	                            color: '#000'
	                        },
	                        itemHiddenStyle: {
	                            color: '#000'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#000'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-15").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>

<!-- 学生公寓9 -->
<script>	
	function showgraph16(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[15];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line46").removeClass("btn-info").addClass("btn-primary");
	        $("#line47").removeClass("btn-primary").addClass("btn-info");
	        $("#line48").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line47").removeClass("btn-info").addClass("btn-primary");
	        $("#line46").removeClass("btn-primary").addClass("btn-info");
	        $("#line48").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line48").removeClass("btn-info").addClass("btn-primary");
	        $("#line47").removeClass("btn-primary").addClass("btn-info");
	        $("#line46").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-16').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#fff'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#fff',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#fff',
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
	                    gridLineColor:'#fff',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: '#fff'
	                        },
	                        itemHoverStyle: {
	                            color: '#039'
	                        },
	                        itemHiddenStyle: {
	                            color: 'gray'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#fff'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#fff',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-16").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>

<!-- 学生公寓10 -->
<script>	
	function showgraph17(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[16];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line49").removeClass("btn-info").addClass("btn-primary");
	        $("#line50").removeClass("btn-primary").addClass("btn-info");
	        $("#line51").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line50").removeClass("btn-info").addClass("btn-primary");
	        $("#line49").removeClass("btn-primary").addClass("btn-info");
	        $("#line51").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line51").removeClass("btn-info").addClass("btn-primary");
	        $("#line50").removeClass("btn-primary").addClass("btn-info");
	        $("#line49").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-17').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#fff',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#fff'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#fff',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#fff',
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
	                    gridLineColor:'#fff',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: '#fff'
	                        },
	                        itemHoverStyle: {
	                            color: '#039'
	                        },
	                        itemHiddenStyle: {
	                            color: 'gray'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#fff'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#fff',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-17").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>

<!-- 学生公寓11 -->
<script>	
	function showgraph18(str) {
		var today=((new Date("<%=timer_%>")).getTime()) / 1000;
	    var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
	    var xx = x / 1000;
	    var xxx = xx - 300;
	    var kaishi, jieshu, kaishi1, jieshu1, init;
	    var bool, info;
	    var xxxx = today;
	    var place=groups[17];
	
	    var info, datainfo;
	    if (str == 'day') {
	        kaishi = xxxx;
	        jieshu = xx;
	        kaishi1 = "<%=time%>";
	        jieshu1 = "<%=time%>";
	        init = 0;
	        bool = false;
	        $("#line52").removeClass("btn-info").addClass("btn-primary");
	        $("#line53").removeClass("btn-primary").addClass("btn-info");
	        $("#line54").removeClass("btn-primary").addClass("btn-info");
	        info = '今天该区域实时人流量';
	    } else if (str == 'week') {
	        kaishi = xxxx - 7 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi7%>";
	        jieshu1 = "<%=time1%>";
	        init = 1;
	        bool = true;
	        $("#line53").removeClass("btn-info").addClass("btn-primary");
	        $("#line52").removeClass("btn-primary").addClass("btn-info");
	        $("#line54").removeClass("btn-primary").addClass("btn-info");
	        info = '近7天该区域历史人流量';
	    } else if (str == 'month') {
	        kaishi = xxxx - 30 * 24 * 60 * 60;
	        jieshu = xxxx;
	        kaishi1 = "<%=kaishi30%>";
	        jieshu1 = "<%=time1%>";
	        init = 2;
	        bool = true;
	        $("#line54").removeClass("btn-info").addClass("btn-primary");
	        $("#line53").removeClass("btn-primary").addClass("btn-info");
	        $("#line52").removeClass("btn-primary").addClass("btn-info");
	        info = '近30天该区域历史人流量';
	    }
	    $.ajax({
			url: "<%=basePath%>realtimedataIn/realtimedataIn/",
			data: "place=" + place + "&kaishi=" + kaishi + "&jieshu=" + jieshu + "&kaishi1=" + kaishi1 + "&jieshu1=" + jieshu1,
			dataType: "json",
			type: "POST",
			success: function(jsonObj) {
	            Highcharts.setOptions({
					global : {
						useUTC : false
					},
					colors: [ "#19BAEC", "#DF5353","black", "#7798BF" ,"#DDDF0D", "#55BF3B", "#DF5353", 
						"#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					backgroundColor: {  
			        	linearGradient: [0, 0, 500, 500],  
			            stops: [  
			                [0, 'rgb(255, 255, 255)'],  
			                [1, 'rgb(240, 240, 255)']  
			            ]  
					},  
			        borderWidth: 2,  
			        plotBackgroundColor: null,  
			        plotShadow: true,  
			        plotBorderWidth: 1  
		       	});
	            var y1;
	            $('#container6-18').highcharts('StockChart', {
	                chart: {
	            		backgroundColor: 'rgba(0,0,0,0)',
	                    events: {
	                        load: function() {
	                            // set up the updating of the chart each second
	                            var series = this.series[0];
	                            setInterval(function() {
	                                $.ajax({
	                                    url: "<%=basePath%>realtimedataIn/realdata/",
	                                    data:"place=" + place + "&time=" + xxxx,
	                                    dataType: "json",
	                                    type: "POST",
	                                    success: function(data) {
	                                        y1 = parseInt(data.real) == NaN ? 0 : parseInt(data.real);
	                                        series.addPoint([x + 300000, y1], true, true);
	                                        xxx = xxx + 300;
	                                        x = x + 300000;
	                                    }
	                                });
	                            },
	                            300000);
	                        }
	                    }
	                },
	
	                rangeSelector: {
	                    buttons: [{
	                        count: 1,
	                        type: 'day',
	                        text: '天'
	                    },
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
	                    inputStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        				},
	                    selected: init,
	                    labelStyle: {
            				color: '#000',
            				fontWeight: 'bold'
        					},
	                },
					navigator:{
	                	xAxis: {
							tickWidth: 0,
							lineWidth: 0,
							gridLineWidth: 1,
							tickPixelInterval: 200,
							labels: {
    							align: 'left',
    							style: {
        							color: '#000'
    							},
    							x: 3,
    							y: -4
							}
						},
	                },
	                title: {
	                    text: info,
	                    style: {
	                        color: '#000',
	                        font: 'bold 15px "微软雅黑"'
	                    }
	                },
	                xAxis: {
	                    gridLineWidth: 1,
	                    gridLineColor:'#000',
	                    lineColor: '#000',
	                    tickColor: '#000',
	                    labels: {
	                        style: {
	                            color: '#000',
	                            font: '11px Trebuchet MS, Verdana, sans-serif'
	                        }
	                    },
	                    type: 'category',
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
	                        }
	                    },
	                },
	                yAxis: {
	                    min: 0,
	                    gridLineColor:'#000',
	                    legend: {
	                        itemStyle: {
	                            font: '9pt Trebuchet MS, Verdana, sans-serif',
	                            color: 'black'
	                        },
	                        itemHoverStyle: {
	                            color: '#000'
	                        },
	                        itemHiddenStyle: {
	                            color: '#000'
	                        }
	                    },
	                    labels:{
	                    	style:{
	                    		color:'#000'
	                    	}
	                    },
	                    title: {
	                        text: '',
	                        style: {
	                            color: '#000',
	                            font: 'bold 15px "微软雅黑"'
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
	                        activeColor: 'red',
	                        animation: true,
	                        arrowSize: 15,
	                        inactiveColor: '#CCC',
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
	
	                series: [{
	                    name: '流量数据',
	                    data: jsonObj.data
	                }]
	            });
			}, error: function() {
				document.getElementById("container6-18").innerHTML = "<div id=\"preloader\"></div>";
			}
		});	
	}
	
	</script>
<script>
	 //$('#page-nav').unslider();
	 function GetRequest() { 
			var url = location.search; //获取url中"?"符后的字串 
			var theRequest = new Object(); 
			if (url.indexOf("?") != -1) { 
			var str = url.substr(1); 
			strs = str.split("&"); 
				for(var i = 0; i < strs.length; i ++) { 
					theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]); 
				} 
			} 
			return theRequest; 
		} 
		var groups=new Array();     		
   		window.onload =getGroup();
   		   		
   		function getGroup(){
   		waitingDialog.show();
   		var para = GetRequest();
   		var idofpara = para.id;
   				$.ajax({
					url:"<%=basePath%>overview/getAllGroup/",
					dataType:"json",
					type:"GET",
					success:function(data){
						var temp="group";
						for(var i=1;i<=data.groupnames.length;i++){
							group=temp+i;
							document.getElementById(group).innerHTML=data.groupnames[i-1];
							groups[i-1]=data.groupnames[i-1];
						}
						if(idofpara==undefined){
				   			showgraph1('day'); 
				   		} else { 
				   			var value = idofpara;
					   		var id = $('.show-line').attr('id');
					   		$('#'+id).addClass('hidden');
					   		$('#'+id).removeClass('show-line');
					   		$('#container-line'+value).addClass('show-line');
					   		$('#container-line'+value).removeClass('hidden');
					   		var func = 'showgraph' + value;
					   		if(typeof(eval(func)) == "function") {  
						        var fun = eval(func+"('day');");  
						        fun;  
						    }   
						    console.log(value);
				   		}
						
						waitingDialog.hide();
					}
				});
   		}
   		
   		
   		$('.pagination li').on('click',function(){
	   		var value = $(this).val();
	   		var id = $('.show-line').attr('id');
	   		$('#'+id).addClass('hidden');
	   		$('#'+id).removeClass('show-line');
	   		$('#container-line'+value).addClass('show-line');
	   		$('#container-line'+value).removeClass('hidden');
	   		var func = 'showgraph' + value;
	   		if(typeof(eval(func)) == "function") {  
		        var fun = eval(func+"('day');");  
		        fun;  
		    }  
	   		waitingDialog.hide();
   		});
   		
   			$('.input-page-div button').on('click',function(){
	   		var value = $('.input-page-div input').val();
	   		var id = $('.show-line').attr('id');
	   		$('#'+id).addClass('hidden');
	   		$('#'+id).removeClass('show-line');
	   		$('#container-line'+value).addClass('show-line');
	   		$('#container-line'+value).removeClass('hidden');
	   		var func = 'showgraph' + value;
	   		if(typeof(eval(func)) == "function") {  
		        var fun = eval(func+"('day');");  
		        fun;  
		    }  
	   		waitingDialog.hide();
   		});
	</script>