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
  <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
  <link href="<%=basePath%>wibupt/css/timelist.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>wibupt/css/docs.css">
  <link href="<%=basePath%>wibupt/css/tuli.css" type="text/css" rel="stylesheet"></link>
  <link href="<%=basePath%>wibupt/css/styles.css" type="text/css" rel="stylesheet"></link>
  <link href="<%=basePath%>resources/css/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath%>resources/css/report/css/bootstrap.min.css" rel="stylesheet">
  <!-- CSS==================================================- ->
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
  <link rel="stylesheet" href="<%=basePath%>resources/css/realtime.css" media="screen" />
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
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
	    <ul class="pagination" onselectstart="return false" style="display: block;">
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看联合展区实时流量图" value="1" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building1.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">联合展区</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看虚之实实时流量图" value="2" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building2.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">虚之实</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看神州数码实时流量图" value="3" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building3.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">神州数码</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看司南物联实时流量图" value="4" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building4.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">司南物联</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看路演区实时流量图" value="5" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building5.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">路演区</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看北京启智实时流量图" value="6" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building6.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">北京启智</p></li>
	    </ul>
	  </nav>
	</div>
	<div id="page-nav" style="display: block;">
	  <nav>
	    <ul class="pagination" onselectstart="return false" style="display: block;">
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看小睿科技实时流量图" value="7" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building7.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">小睿科技</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看浙江万博实时流量图" value="8" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building8.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">浙江万博</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看微景天下实时流量图" value="9" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building9.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">微景天下</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看京东智能实时流量图" value="10" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building10.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">京东智能</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看顺网科技实时流量图" value="11" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building11.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">顺网科技</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看吉利集团实时流量图" value="12" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building12.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">吉利集团</p></li>
	    </ul>
	  </nav>
	</div>
	<div id="page-nav" style="display: block;">
	  <nav>
	    <ul class="pagination" onselectstart="return false" style="display: block;">
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看旷视科技实时流量图" value="13" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building13.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">旷视科技</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看海康威视实时流量图" value="14" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building14.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">海康威视</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看科大讯飞实时流量图" value="15" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building15.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">科大讯飞</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看中科速智实时流量图" value="16" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building16.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">中科速智</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看杭州艾米实时流量图" value="17" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building17.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">杭州艾米</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看浙工大实时流量图" value="18" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building18.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">浙工大</p></li>
	    </ul>
	  </nav>
	</div>
	<div id="page-nav" style="display: block;">
	  <nav>
	    <ul class="pagination" onselectstart="return false" style="display: block;">
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看北邮实时流量图" value="19" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building13.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">北邮</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看哈工大实时流量图" value="20" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building14.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">哈工大</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看科沃斯实时流量图" value="21" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building15.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">科沃斯</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看大唐高鸿实时流量图" value="22" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building16.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">大唐高鸿</p></li>
	      <li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看义创空间实时流量图" value="23" style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building17.jpg);background-repeat: no-repeat;
	      background-position: center; background-size: 75px;">
	        <p class="buildingName">义创空间</p></li>
	    </ul>
	  </nav>
	</div>
		
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
									<button id="line1" style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 1);">
										今天</button>
									<button id="line2" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 1);">
										近7天</button>
									<button id="line3" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 1);">
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
									<button id="line4" style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 2);">
										今天</button>
									<button id="line5" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 2);">
										近7天</button>
									<button id="line6" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 2);">
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
									<button id="line7" style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 3);">
										今天</button>
									<button id="line8" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 3);">
										近7天</button>
									<button id="line9" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 3);">
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
										class="btn btn-info" onclick="showgraph('day', 4);">
										今天</button>
									<button id="line11"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 4);">
										近7天</button>
									<button id="line12"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 4);">
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
										class="btn btn-info" onclick="showgraph('day', 5);">
										今天</button>
									<button id="line14"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 5);">
										近7天</button>
									<button id="line15"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 5);">
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
										class="btn btn-info" onclick="showgraph('day', 6);">
										今天</button>
									<button id="line17"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 6);">
										近7天</button>
									<button id="line18"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 6);">
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
										class="btn btn-info" onclick="showgraph('day', 7);">
										今天</button>
									<button id="line20"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 7);">
										近7天</button>
									<button id="line21"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 7);">
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
										class="btn btn-info" onclick="showgraph('day', 8);">
										今天</button>
									<button id="line23"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 8);">
										近7天</button>
									<button id="line24"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 8);">
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
										class="btn btn-info" onclick="showgraph('day', 9);">
										今天</button>
									<button id="line26"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 9);">
										近7天</button>
									<button id="line27"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 9);">
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
										class="btn btn-info" onclick="showgraph('day', 10);">
										今天</button>
									<button id="line29"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 10);">
										近7天</button>
									<button id="line30"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 10);">
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
										class="btn btn-info" onclick="showgraph('day', 11);">
										今天</button>
									<button id="line32"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 11);">
										近7天</button>
									<button id="line33"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 11);">
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
										class="btn btn-info" onclick="showgraph('day', 12);">
										今天</button>
									<button id="line35"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 12);">
										近7天</button>
									<button id="line36"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 12);">
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
										class="btn btn-info" onclick="showgraph('day', 13);">
										今天</button>
									<button id="line38"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 13);">
										近7天</button>
									<button id="line39"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 13);">
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
										class="btn btn-info" onclick="showgraph('day', 14);">
										今天</button>
									<button id="line41"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 14);">
										近7天</button>
									<button id="line42"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 14);">
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
										class="btn btn-info" onclick="showgraph('day', 15);">
										今天</button>
									<button id="line44"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 15);">
										近7天</button>
									<button id="line45"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 15);">
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
										class="btn btn-info" onclick="showgraph('day', 16);">
										今天</button>
									<button id="line47"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 16);">
										近7天</button>
									<button id="line48"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 16);">
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
										class="btn btn-info" onclick="showgraph('day', 17);">
										今天</button>
									<button id="line50"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 17);">
										近7天</button>
									<button id="line51"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 17);">
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
										class="btn btn-info" onclick="showgraph('day', 18);">
										今天</button>
									<button id="line53"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 18);">
										近7天</button>
									<button id="line54"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 18);">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-18" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line19"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group19" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line55"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 19);">
										今天</button>
									<button id="line56"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 19);">
										近7天</button>
									<button id="line57"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 19);">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-19" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line20"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group20" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line58"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 20);">
										今天</button>
									<button id="line59"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 20);">
										近7天</button>
									<button id="line60"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 20);">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-20" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line21"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group21" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line61"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 21);">
										今天</button>
									<button id="line62"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 21);">
										近7天</button>
									<button id="line63"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 21);">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-21" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line22"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group22" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line64"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 22);">
										今天</button>
									<button id="line65"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 22);">
										近7天</button>
									<button id="line66"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 22);">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-22" style="height:320px"></div>
						</div>
					</div>
					<div id="container-line23"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-left: 0px">
						<div class="module"
							style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group23" style="font-weight: bold"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line67"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-info" onclick="showgraph('day', 23);">
										今天</button>
									<button id="line68"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('week', 23);">
										近7天</button>
									<button id="line69"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-info" onclick="showgraph('month', 23);">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-23" style="height:320px"></div>
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
<script src="<%=basePath%>wibupt/js/exporting1.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-tab.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-carousel.js"></script>
<script src="<%=basePath%>wibupt/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/Function.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/unslider-min.js"></script>
<script>
/**
 * period: day, week, month
 * i: (1-23) 
 * place: groups[i - 1]
 */
function showgraph(period, i) {
	var today = ((new Date("<%=timer_%>")).getTime()) / 1000;
  var x = parseInt(((new Date()).getTime()) / 300000) * 300000;
  var xx = x / 1000;
  var xxx = xx - 300;
  var kaishi, jieshu, kaishi1, jieshu1, init;
  var bool, info;
  var xxxx = today;
	var place = $('li[value=' + i + '] p').text();
  var info, datainfo;
  var tab3 = i * 3;
  var tab2 = tab3 - 1;
  var tab1 = tab2 - 1;
  if (period == 'day') {
    kaishi = xxxx;
    jieshu = xx;
    kaishi1 = "<%=time%>";
    jieshu1 = "<%=time%>";
    init = 0;
    bool = false;
    $('#line' + tab1).removeClass('btn-info').addClass('btn-primary');
    $('#line' + tab2).removeClass('btn-primary').addClass('btn-info');
    $('#line' + tab3).removeClass('btn-primary').addClass('btn-info');
    info = '今天' + place + '实时人流量';
  } else if (period == 'week') {
    kaishi = xxxx - 7 * 24 * 60 * 60;
    jieshu = xxxx;
    kaishi1 = '<%=kaishi7%>';
    jieshu1 = '<%=time1%>';
    init = 1;
    bool = true;
    $('#line' + tab2).removeClass('btn-info').addClass('btn-primary');
    $('#line' + tab1).removeClass('btn-primary').addClass('btn-info');
    $('#line' + tab3).removeClass('btn-primary').addClass('btn-info');
    info = '近7天' + place + '历史人流量';
  } else if (period == 'month') {
    kaishi = xxxx - 30 * 24 * 60 * 60;
    jieshu = xxxx;
    kaishi1 = '<%=kaishi30%>';
    jieshu1 = '<%=time1%>';
    init = 2;
    bool = true;
    $('#line' + tab3).removeClass('btn-info').addClass('btn-primary');
    $('#line' + tab2).removeClass('btn-primary').addClass('btn-info');
    $('#line' + tab1).removeClass('btn-primary').addClass('btn-info');
    info = '近30天' + place + '历史人流量';
  }
  $.ajax({
    url: '<%=basePath%>realtimedataIn/realtimedataIn/',
    data: 'place=' + place + '&kaishi=' + kaishi + '&jieshu=' + jieshu + '&kaishi1=' + kaishi1 + '&jieshu1=' + jieshu1,
    dataType: 'json',
    type: 'POST',
    success: function(jsonObj) {
      Highcharts.setOptions({
        global: {
          useUTC: false
        },
        colors: ['#19BAEC', '#DF5353', 'black', '#7798BF', '#DDDF0D', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee', '#ff0066', '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
        backgroundColor: {
          linearGradient: [0, 0, 500, 500],
          stops: [[0, 'rgb(255, 255, 255)'], [1, 'rgb(240, 240, 255)']]
        },
        borderWidth: 2,
        plotBackgroundColor: null,
        plotShadow: true,
        plotBorderWidth: 1
      });
      var y1;
      $('#container6-' + i).highcharts('StockChart', {
        chart: {
          backgroundColor: 'rgba(0,0,0,0)',
          events: {
            load: function() {
              // set up the updating of the chart each second
              var series = this.series[0];
              setInterval(function() {
                $.ajax({
                  url: '<%=basePath%>realtimedataIn/realdata/',
                  data: 'place=' + place + '&time=' + xxxx,
                  dataType: 'json',
                  type: 'POST',
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
            type: 'week',
            text: '周'
          },
          {
            count: 30,
            type: 'month',
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
        navigator: {
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
          gridLineColor: '#000',
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
          gridLineColor: '#000',
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
          labels: {
            style: {
              color: '#000'
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
    },
    error: function() {
      document.getElementById('container6-' + i).innerHTML = '<div id=\"preloader\"></div>';
    }
  });
}
 
function GetRequest() {
  var url = location.search; //获取url中"?"符后的字串 
  var theRequest = new Object();
  if (url.indexOf("?") != -1) {
    var str = url.substr(1);
    strs = str.split("&");
    for (var i = 0; i < strs.length; i++) {
      theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
    }
  }
  return theRequest;
}

var groups = new Array();
window.onload = getGroup();

function getGroup() {
  waitingDialog.show();
  var para = GetRequest();
  var idofpara = para.id;
  
	for (var i = 1; i <= 23; i++) {
    group = "group" + i;
		$('#group' + i).html($('li[value=' + i + '] p').text());
  }
  
	if (idofpara == undefined) {
    showgraph('day', 1);
  } else {
    var id = $('.show-line').attr('id');
    $('#' + id).addClass('hidden');
    $('#' + id).removeClass('show-line');
    $('#container-line' + idofpara).addClass('show-line');
    $('#container-line' + idofpara).removeClass('hidden');
    showgraph('day', idofpara);
  }

  waitingDialog.hide();
}

$('.pagination li').on('click',
	function() {
	  var value = $(this).val();
	  var id = $('.show-line').attr('id');
	  $('#' + id).addClass('hidden');
	  $('#' + id).removeClass('show-line');
	  $('#container-line' + value).addClass('show-line');
	  $('#container-line' + value).removeClass('hidden');
	  showgraph('day', value);
	  waitingDialog.hide();
	}
);
</script>