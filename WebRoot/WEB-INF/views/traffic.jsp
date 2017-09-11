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
<style>
.highcharts-container {
            padding-right: 60px;
        }

        .tipMess {
            height: 25px;
            line-height: 25px;
            font-size: 12px;
            margin-bottom: 10px;
            width: 526px;
            margin-left: 55px;
        }

        .tipTab {
            width: 515px;
            border: 1px solid #E5E5E5;
            text-align: center;
            margin: 0px auto;
            background: #F5F5F5;
        }

        .tipTab td {
            width: 20%;
        }

        @media screen and (min-width: 700px) {
            .tipTab {
                width: 794px;
            }

            .tipMess {
                margin-left: 42px;
                width: 794px;
            }
        }

        @media screen and (min-width: 1000px) {
            .tipTab {
                width: 831px;
            }

            .tipMess {
                margin-left: 50px;
                width: 850px;
                font-size: 14px
            }
        }
</style>
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
					style="width:150px;height:60px;"> </a>
			</div>
			<div class="navbar-collapse collapse" role="navigation">
				<ul class="nav navbar-nav navbar-left hidden-sm nav-tabs">
					<li><a href="<%=basePath%>index" style="font-size: 18px"><i
							class="icon-home"></i>&nbsp实时校园</a>
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
					<li><a href="<%=basePath%>goandcome" style="font-size: 18px"><i
							class="icon-resize-full"></i>&nbsp出入校园分析</a>
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
				style="display: inline-block;">
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教一实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图"  value="1"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building1.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">教一</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教二实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="2"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building2.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">教二</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教三实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="3"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building3.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">教三</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看教四实时流量图" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="4"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building4.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">教四</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看新科研楼实时流量图" value="5"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building5.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">新科研楼</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看主楼实时流量图" value="6"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building6.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">主楼</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看综合餐厅实时流量图" value="7"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building7.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">综合餐厅</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生食堂实时流量图" value="8"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building8.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生食堂</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓1实时流量图" value="9"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building9.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓1</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看实时流量图" value="10"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building10.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓2</p>
				</li>
			</ul>
		</nav>
	</div>
		<div id="page-nav" style="display: block;">
		<nav>
			<ul class="pagination pagination2" onselectstart="return false"
				style="display: inline-block;">
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓4实时流量图" value="11"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building11.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓4</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓5实时流量图" value="12"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building12.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓5</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓6实时流量图" value="13"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building13.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓6</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓8实时流量图" value="14"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building14.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓8</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓9实时流量图" value="15"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building15.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓9</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓10实时流量图" value="16"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building16.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓10</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓11实时流量图" value="17"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building17.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓11</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓29实时流量图" value="18"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building18.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓29</p>
				</li>
				<li class="commonPage thumbnail" data-toggle="tooltip" data-placement="top" title="点击查看学生公寓3实时流量图" value="19"
					style="width:80px;height:80px;padding:20px;margin:10px;background:url(wibupt/img/building19.jpg);background-repeat: no-repeat;
    background-position: center;"><p
						class="buildingName">学生公寓3</p>
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
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-1" ></div>
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
										class="btn btn-default" onclick="showline2('day');">
										今天</button>
									<button id="line5" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline2('week');">
										近7天</button>
									<button id="line6" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline2('month');">
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
										class="btn btn-default" onclick="showline3('day');">
										今天</button>
									<button id="line8" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline3('week');">
										近7天</button>
									<button id="line9" style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline3('month');">
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
										class="btn btn-default" onclick="showline4('day');">
										今天</button>
									<button id="line11"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline4('week');">
										近7天</button>
									<button id="line12"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline4('month');">
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
										class="btn btn-default" onclick="showline5('day');">
										今天</button>
									<button id="line14"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline5('week');">
										近7天</button>
									<button id="line15"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline5('month');">
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
										class="btn btn-default" onclick="showline6('day');">
										今天</button>
									<button id="line17"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline6('week');">
										近7天</button>
									<button id="line18"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline6('month');">
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
										class="btn btn-default" onclick="showline7('day');">
										今天</button>
									<button id="line20"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline7('week');">
										近7天</button>
									<button id="line21"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline7('month');">
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
										class="btn btn-default" onclick="showline8('day');">
										今天</button>
									<button id="line23"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline8('week');">
										近7天</button>
									<button id="line24"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline8('month');">
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
										class="btn btn-default" onclick="showline9('day');">
										今天</button>
									<button id="line26"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline9('week');">
										近7天</button>
									<button id="line27"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline9('month');">
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
										class="btn btn-default" onclick="showline10('day');">
										今天</button>
									<button id="line29"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline10('week');">
										近7天</button>
									<button id="line30"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline10('month');">
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
										class="btn btn-default" onclick="showline11('day');">
										今天</button>
									<button id="line32"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline11('week');">
										近7天</button>
									<button id="line33"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline11('month');">
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
										class="btn btn-default" onclick="showline12('day');">
										今天</button>
									<button id="line35"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline12('week');">
										近7天</button>
									<button id="line36"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline12('month');">
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
										class="btn btn-default" onclick="showline13('day');">
										今天</button>
									<button id="line38"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline13('week');">
										近7天</button>
									<button id="line39"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline13('month');">
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
										class="btn btn-default" onclick="showline14('day');">
										今天</button>
									<button id="line41"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline14('week');">
										近7天</button>
									<button id="line42"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline14('month');">
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
										class="btn btn-default" onclick="showline15('day');">
										今天</button>
									<button id="line44"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline15('week');">
										近7天</button>
									<button id="line45"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline15('month');">
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
										class="btn btn-default" onclick="showline16('day');">
										今天</button>
									<button id="line47"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline16('week');">
										近7天</button>
									<button id="line48"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline16('month');">
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
										class="btn btn-default" onclick="showline17('day');">
										今天</button>
									<button id="line50"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline17('week');">
										近7天</button>
									<button id="line51"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline17('month');">
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
										class="btn btn-default" onclick="showline18('day');">
										今天</button>
									<button id="line53"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline18('week');">
										近7天</button>
									<button id="line54"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline18('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-18" style="height:320px"></div>
						</div>
					</div>
				</div>

				<!-- 学29 -->
				<div class="row clearfix">
					<div id="container-line19"
						class="col-md-12 col-xs-12 column hidden"
						style="padding-right: 0px">
						<div class="module"
							style="margin-right: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;;background-color:rgba(255,255,255,0.3)">
							<div class="row clearfix">
								<div class="col-md-6 col-xs-6 column">
									<h4 id="group19" style="font-weight: bold;"></h4>
								</div>
								<div class="col-md-6 col-xs-6 column">
									<button id="line55"
										style=" width: 25%;margin: 10px 0px 0px 10%;"
										class="btn btn-default" onclick="showline19('day');">
										今天</button>
									<button id="line56"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline19('week');">
										近7天</button>
									<button id="line57"
										style=" width: 25%;margin: 10px 0px 0px 1%;"
										class="btn btn-default" onclick="showline19('month');">
										近30天</button>
								</div>
							</div>
							<hr style="color:#fff;margin-top:10px">
							<div id="container6-19" style="height:320px"></div>
						</div>
					</div>
					<!--       				<div class="col-md-6 col-xs-6 column" style="padding-left: 0px">
							<div class="module" style="margin-left: 0px;padding-top:10px;padding-bottom:10px;border-radius:0px;background-color:rgba(51,46,46,0.6)">
								<div class="row clearfix">
									<div class="col-md-6 col-xs-6 column">
										<h4 id="group20" style="color:#fff"></h4>
									</div>
									<div class="col-md-6 col-xs-6 column">
										<button id="line58" style=" width: 25%;margin: 10px 0px 0px 10%;" class="btn btn-default" onclick="showline20('day');">
																今天
										</button>
										<button id="line59" style=" width: 25%;margin: 10px 0px 0px 1%;" class="btn btn-default" onclick="showline20('week');">
																近7天
										</button>
										<button id="line60" style=" width: 25%;margin: 10px 0px 0px 1%;" class="btn btn-default" onclick="showline20('month');">
																近30天
										</button>
									</div>
								</div>
								<hr style="color:#fff;margin-top:10px">
								<div id="container6-20" style="height:320px"></div>
							</div>
					   </div>
-->
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
					<a href="<%=basePath%>index">WiBupt </a><span class="separator">|</span>北京邮电大学版权所有&copy;
					2013~2014
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
<script type="text/javascript" src="<%=basePath%>wibupt/js/util_fy.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/minstock.js"></script>
<script type="text/javascript" src="<%=basePath%>wibupt/js/unslider-min.js"></script>
 <script type="text/javascript">

        //向服务器发送ajax请求
        function request(req) {
            var res = {
                "data": [
                    {
                        "date": 1492651912000,
                        "mean": 64.48,
                        "pricechangeratio": -10.44,
                        "transactioncount": 46644,
                        "transactionprice": 2141.1
                    }, {
                        "date": 1492651912000,
                        "mean": 64.48,
                        "pricechangeratio": -10.44,
                        "transactioncount": 46644,
                        "transactionprice": 2141.1
                    }, {
                        "date": 1492651972000,
                        "mean": 71.96,
                        "pricechangeratio": -4.4,
                        "transactioncount": 20674,
                        "transactionprice": 2147.14
                    }, {
                        "date": 1492652032000,
                        "mean": 70.82,
                        "pricechangeratio": 6.69,
                        "transactioncount": 27134,
                        "transactionprice": 2158.23
                    }, {
                        "date": 1492652092000,
                        "mean": 70.53,
                        "pricechangeratio": 3.76,
                        "transactioncount": 28318,
                        "transactionprice": 2155.3
                    }, {
                        "date": 1492652152000,
                        "mean": 71.27,
                        "pricechangeratio": 4.77,
                        "transactioncount": 30882,
                        "transactionprice": 2156.31
                    }, {
                        "date": 1492652212000,
                        "mean": 69.96,
                        "pricechangeratio": 7.82,
                        "transactioncount": 25407,
                        "transactionprice": 2159.36
                    }, {
                        "date": 1492652272000,
                        "mean": 73.48,
                        "pricechangeratio": 9.88,
                        "transactioncount": 7447,
                        "transactionprice": 2161.42
                    }, {
                        "date": 1492652332000,
                        "mean": 75.61,
                        "pricechangeratio": 9.74,
                        "transactioncount": 8180,
                        "transactionprice": 2161.28
                    }, {
                        "date": 1492652392000,
                        "mean": 78.83,
                        "pricechangeratio": 7.41,
                        "transactioncount": 5063,
                        "transactionprice": 2158.95
                    }, {
                        "date": 1492652452000,
                        "mean": 83.1,
                        "pricechangeratio": 8.42,
                        "transactioncount": 11289,
                        "transactionprice": 2159.96
                    }, {
                        "date": 1492652512000,
                        "mean": 85.24,
                        "pricechangeratio": 9.91,
                        "transactioncount": 18871,
                        "transactionprice": 2161.45
                    }, {
                        "date": 1492652572000,
                        "mean": 85.61,
                        "pricechangeratio": 4.44,
                        "transactioncount": 10427,
                        "transactionprice": 2155.98
                    }, {
                        "date": 1492652632000,
                        "mean": 87.64,
                        "pricechangeratio": 4.71,
                        "transactioncount": 6292,
                        "transactionprice": 2156.25
                    }, {
                        "date": 1492652692000,
                        "mean": 88.86,
                        "pricechangeratio": 1.02,
                        "transactioncount": 5493,
                        "transactionprice": 2152.56
                    }, {
                        "date": 1492652752000,
                        "mean": 90.25,
                        "pricechangeratio": 4.82,
                        "transactioncount": 7248,
                        "transactionprice": 2156.36
                    }, {
                        "date": 1492652812000,
                        "mean": 91.47,
                        "pricechangeratio": -4.09,
                        "transactioncount": 6382,
                        "transactionprice": 2147.45
                    }, {
                        "date": 1492652872000,
                        "mean": 93.69,
                        "pricechangeratio": -6.68,
                        "transactioncount": 5354,
                        "transactionprice": 2144.86
                    }, {
                        "date": 1492652932000,
                        "mean": 94.25,
                        "pricechangeratio": -8.19,
                        "transactioncount": 5867,
                        "transactionprice": 2143.35
                    }, {
                        "date": 1492652992000,
                        "mean": 94.4,
                        "pricechangeratio": -3.37,
                        "transactioncount": 6950,
                        "transactionprice": 2148.17
                    }, {
                        "date": 1492653052000,
                        "mean": 95.08,
                        "pricechangeratio": -2.67,
                        "transactioncount": 5067,
                        "transactionprice": 2148.87
                    }, {
                        "date": 1492653112000,
                        "mean": 95.02,
                        "pricechangeratio": 2.6,
                        "transactioncount": 8563,
                        "transactionprice": 2154.14
                    }, {
                        "date": 1492653172000,
                        "mean": 95.54,
                        "pricechangeratio": 1.77,
                        "transactioncount": 7088,
                        "transactionprice": 2153.31
                    }, {
                        "date": 1492653232000,
                        "mean": 95.6,
                        "pricechangeratio": -3.39,
                        "transactioncount": 8598,
                        "transactionprice": 2148.15
                    }, {
                        "date": 1492653292000,
                        "mean": 96.32,
                        "pricechangeratio": 0.01,
                        "transactioncount": 6718,
                        "transactionprice": 2151.55
                    }, {
                        "date": 1492653352000,
                        "mean": 96.72,
                        "pricechangeratio": 0.23,
                        "transactioncount": 5399,
                        "transactionprice": 2151.77
                    }, {
                        "date": 1492653412000,
                        "mean": 96.85,
                        "pricechangeratio": -0.35,
                        "transactioncount": 5785,
                        "transactionprice": 2151.19
                    }, {
                        "date": 1492653472000,
                        "mean": 97.12,
                        "pricechangeratio": -0.91,
                        "transactioncount": 11806,
                        "transactionprice": 2150.63
                    }, {
                        "date": 1492653532000,
                        "mean": 97.34,
                        "pricechangeratio": -0.04,
                        "transactioncount": 10622,
                        "transactionprice": 2151.5
                    }, {
                        "date": 1492653592000,
                        "mean": 97.4,
                        "pricechangeratio": -1.74,
                        "transactioncount": 8017,
                        "transactionprice": 2149.8
                    }, {
                        "date": 1492653652000,
                        "mean": 97.09,
                        "pricechangeratio": -3.92,
                        "transactioncount": 20286,
                        "transactionprice": 2147.62
                    }, {
                        "date": 1492653712000,
                        "mean": 97.06,
                        "pricechangeratio": -4.2,
                        "transactioncount": 5947,
                        "transactionprice": 2147.34
                    }, {
                        "date": 1492653772000,
                        "mean": 96.65,
                        "pricechangeratio": -5.9,
                        "transactioncount": 14513,
                        "transactionprice": 2145.64
                    }, {
                        "date": 1492653832000,
                        "mean": 96.08,
                        "pricechangeratio": -6.2,
                        "transactioncount": 17440,
                        "transactionprice": 2145.34
                    }, {
                        "date": 1492653892000,
                        "mean": 95.91,
                        "pricechangeratio": -7.06,
                        "transactioncount": 12144,
                        "transactionprice": 2144.48
                    }, {
                        "date": 1492653952000,
                        "mean": 95.31,
                        "pricechangeratio": -3.91,
                        "transactioncount": 8595,
                        "transactionprice": 2147.63
                    }, {
                        "date": 1492654012000,
                        "mean": 95.69,
                        "pricechangeratio": -7.3,
                        "transactioncount": 5511,
                        "transactionprice": 2144.24
                    }, {
                        "date": 1492654072000,
                        "mean": 95.56,
                        "pricechangeratio": -7.57,
                        "transactioncount": 8027,
                        "transactionprice": 2143.97
                    }, {
                        "date": 1492654132000,
                        "mean": 96.08,
                        "pricechangeratio": -7.39,
                        "transactioncount": 7240,
                        "transactionprice": 2144.15
                    }, {
                        "date": 1492654192000,
                        "mean": 96.48,
                        "pricechangeratio": -7.09,
                        "transactioncount": 10825,
                        "transactionprice": 2144.45
                    }, {
                        "date": 1492654252000,
                        "mean": 94.84,
                        "pricechangeratio": -5.95,
                        "transactioncount": 21648,
                        "transactionprice": 2145.59
                    }, {
                        "date": 1492654312000,
                        "mean": 95.07,
                        "pricechangeratio": -5.38,
                        "transactioncount": 13967,
                        "transactionprice": 2146.16
                    }, {
                        "date": 1492654372000,
                        "mean": 94.96,
                        "pricechangeratio": -0.6,
                        "transactioncount": 9606,
                        "transactionprice": 2150.94
                    }, {
                        "date": 1492654432000,
                        "mean": 94.77,
                        "pricechangeratio": -1.96,
                        "transactioncount": 9032,
                        "transactionprice": 2149.58
                    }, {
                        "date": 1492654492000,
                        "mean": 95.03,
                        "pricechangeratio": -1.71,
                        "transactioncount": 14970,
                        "transactionprice": 2149.83
                    }, {
                        "date": 1492654552000,
                        "mean": 95.67,
                        "pricechangeratio": -1.62,
                        "transactioncount": 7687,
                        "transactionprice": 2149.92
                    }, {
                        "date": 1492654612000,
                        "mean": 96.93,
                        "pricechangeratio": -1.62,
                        "transactioncount": 11377,
                        "transactionprice": 2149.92
                    }, {
                        "date": 1492654672000,
                        "mean": 97.48,
                        "pricechangeratio": 0.57,
                        "transactioncount": 8679,
                        "transactionprice": 2152.11
                    }, {
                        "date": 1492654732000,
                        "mean": 98.22,
                        "pricechangeratio": -8.74,
                        "transactioncount": 11187,
                        "transactionprice": 2142.8
                    }, {
                        "date": 1492654792000,
                        "mean": 98.23,
                        "pricechangeratio": -6.13,
                        "transactioncount": 16647,
                        "transactionprice": 2145.41
                    }, {
                        "date": 1492654852000,
                        "mean": 98.17,
                        "pricechangeratio": -7.58,
                        "transactioncount": 9694,
                        "transactionprice": 2143.96
                    }, {
                        "date": 1492654912000,
                        "mean": 97.96,
                        "pricechangeratio": -7.28,
                        "transactioncount": 10191,
                        "transactionprice": 2144.26
                    }, {
                        "date": 1492654972000,
                        "mean": 98.08,
                        "pricechangeratio": -6.04,
                        "transactioncount": 14215,
                        "transactionprice": 2145.5
                    }, {
                        "date": 1492655032000,
                        "mean": 98.99,
                        "pricechangeratio": -10.41,
                        "transactioncount": 5998,
                        "transactionprice": 2141.13
                    }, {
                        "date": 1492655092000,
                        "mean": 99.45,
                        "pricechangeratio": -13.26,
                        "transactioncount": 4651,
                        "transactionprice": 2138.28
                    }, {
                        "date": 1492655152000,
                        "mean": 99.57,
                        "pricechangeratio": -5.61,
                        "transactioncount": 8549,
                        "transactionprice": 2145.93
                    }, {
                        "date": 1492655212000,
                        "mean": 99.94,
                        "pricechangeratio": -8.16,
                        "transactioncount": 6270,
                        "transactionprice": 2143.38
                    }, {
                        "date": 1492655272000,
                        "mean": 98.97,
                        "pricechangeratio": -4.7,
                        "transactioncount": 16703,
                        "transactionprice": 2146.84
                    }, {
                        "date": 1492655332000,
                        "mean": 97.97,
                        "pricechangeratio": -9.03,
                        "transactioncount": 13405,
                        "transactionprice": 2142.51
                    }, {
                        "date": 1492655392000,
                        "mean": 97.84,
                        "pricechangeratio": -9.46,
                        "transactioncount": 10976,
                        "transactionprice": 2142.08
                    }, {
                        "date": 1492655452000,
                        "mean": 97.23,
                        "pricechangeratio": -6.02,
                        "transactioncount": 13417,
                        "transactionprice": 2145.52
                    }, {
                        "date": 1492655512000,
                        "mean": 95.78,
                        "pricechangeratio": -4.62,
                        "transactioncount": 21056,
                        "transactionprice": 2146.92
                    }, {
                        "date": 1492655572000,
                        "mean": 95.64,
                        "pricechangeratio": -4.87,
                        "transactioncount": 7134,
                        "transactionprice": 2146.67
                    }, {
                        "date": 1492655632000,
                        "mean": 94.6,
                        "pricechangeratio": -4.7,
                        "transactioncount": 16419,
                        "transactionprice": 2146.84
                    }, {
                        "date": 1492655692000,
                        "mean": 93.84,
                        "pricechangeratio": -0.81,
                        "transactioncount": 13863,
                        "transactionprice": 2150.73
                    }, {
                        "date": 1492655752000,
                        "mean": 92.97,
                        "pricechangeratio": -1.17,
                        "transactioncount": 16031,
                        "transactionprice": 2150.37
                    }, {
                        "date": 1492655812000,
                        "mean": 92.63,
                        "pricechangeratio": 1.13,
                        "transactioncount": 10665,
                        "transactionprice": 2152.67
                    }, {
                        "date": 1492655872000,
                        "mean": 92.54,
                        "pricechangeratio": 4.63,
                        "transactioncount": 11664,
                        "transactionprice": 2156.17
                    }, {
                        "date": 1492655932000,
                        "mean": 92.06,
                        "pricechangeratio": 0.71,
                        "transactioncount": 11729,
                        "transactionprice": 2152.25
                    }, {
                        "date": 1492655992000,
                        "mean": 91.6,
                        "pricechangeratio": 0.72,
                        "transactioncount": 12043,
                        "transactionprice": 2152.26
                    }, {
                        "date": 1492656052000,
                        "mean": 91.26,
                        "pricechangeratio": 2.34,
                        "transactioncount": 9677,
                        "transactionprice": 2153.88
                    }, {
                        "date": 1492656112000,
                        "mean": 91.16,
                        "pricechangeratio": 4.14,
                        "transactioncount": 8909,
                        "transactionprice": 2155.68
                    }, {
                        "date": 1492656172000,
                        "mean": 91.15,
                        "pricechangeratio": 6.74,
                        "transactioncount": 7666,
                        "transactionprice": 2158.28
                    }, {
                        "date": 1492656232000,
                        "mean": 91.23,
                        "pricechangeratio": 5.27,
                        "transactioncount": 8684,
                        "transactionprice": 2156.81
                    }, {
                        "date": 1492656292000,
                        "mean": 91.46,
                        "pricechangeratio": 4.91,
                        "transactioncount": 5777,
                        "transactionprice": 2156.45
                    }, {
                        "date": 1492656352000,
                        "mean": 90.6,
                        "pricechangeratio": 6.37,
                        "transactioncount": 19725,
                        "transactionprice": 2157.91
                    }, {
                        "date": 1492656412000,
                        "mean": 90.59,
                        "pricechangeratio": 8.38,
                        "transactioncount": 7015,
                        "transactionprice": 2159.92
                    }, {
                        "date": 1492656472000,
                        "mean": 90.68,
                        "pricechangeratio": 9.83,
                        "transactioncount": 6285,
                        "transactionprice": 2161.37
                    }, {
                        "date": 1492656532000,
                        "mean": 90.66,
                        "pricechangeratio": 7.8,
                        "transactioncount": 6675,
                        "transactionprice": 2159.34
                    }, {
                        "date": 1492656592000,
                        "mean": 90.8,
                        "pricechangeratio": 8.39,
                        "transactioncount": 3224,
                        "transactionprice": 2159.93
                    }, {
                        "date": 1492656652000,
                        "mean": 90.91,
                        "pricechangeratio": 7.55,
                        "transactioncount": 6357,
                        "transactionprice": 2159.09
                    }, {
                        "date": 1492656712000,
                        "mean": 90.64,
                        "pricechangeratio": 8.49,
                        "transactioncount": 8388,
                        "transactionprice": 2160.03
                    }, {
                        "date": 1492656772000,
                        "mean": 90.78,
                        "pricechangeratio": 7.25,
                        "transactioncount": 4374,
                        "transactionprice": 2158.79
                    }, {
                        "date": 1492656832000,
                        "mean": 90.61,
                        "pricechangeratio": -1.16,
                        "transactioncount": 6825,
                        "transactionprice": 2150.38
                    }, {
                        "date": 1492656892000,
                        "mean": 90.84,
                        "pricechangeratio": -0.7,
                        "transactioncount": 4754,
                        "transactionprice": 2150.84
                    }, {
                        "date": 1492656952000,
                        "mean": 91.04,
                        "pricechangeratio": -2.59,
                        "transactioncount": 5632,
                        "transactionprice": 2148.95
                    }, {
                        "date": 1492657012000,
                        "mean": 90.97,
                        "pricechangeratio": -5.82,
                        "transactioncount": 7209,
                        "transactionprice": 2145.72
                    }, {
                        "date": 1492657072000,
                        "mean": 90.97,
                        "pricechangeratio": -5.53,
                        "transactioncount": 5935,
                        "transactionprice": 2146.01
                    }, {
                        "date": 1492657132000,
                        "mean": 91,
                        "pricechangeratio": -5.3,
                        "transactioncount": 5965,
                        "transactionprice": 2146.24
                    }, {
                        "date": 1492657192000,
                        "mean": 90.83,
                        "pricechangeratio": -10.13,
                        "transactioncount": 7850,
                        "transactionprice": 2141.41
                    }, {
                        "date": 1492657252000,
                        "mean": 91.05,
                        "pricechangeratio": -6.6,
                        "transactioncount": 4975,
                        "transactionprice": 2144.94
                    }, {
                        "date": 1492657312000,
                        "mean": 91.22,
                        "pricechangeratio": -5.54,
                        "transactioncount": 5376,
                        "transactionprice": 2146
                    }, {
                        "date": 1492657372000,
                        "mean": 91.29,
                        "pricechangeratio": -6.18,
                        "transactioncount": 5060,
                        "transactionprice": 2145.36
                    }, {
                        "date": 1492657432000,
                        "mean": 91.3,
                        "pricechangeratio": -7.35,
                        "transactioncount": 7878,
                        "transactionprice": 2144.19
                    }, {
                        "date": 1492657492000,
                        "mean": 91.17,
                        "pricechangeratio": -8.1,
                        "transactioncount": 5279,
                        "transactionprice": 2143.44
                    }, {
                        "date": 1492657552000,
                        "mean": 91.49,
                        "pricechangeratio": -7.96,
                        "transactioncount": 3588,
                        "transactionprice": 2143.58
                    }, {
                        "date": 1492657612000,
                        "mean": 91.63,
                        "pricechangeratio": -7.9,
                        "transactioncount": 2914,
                        "transactionprice": 2143.64
                    }, {
                        "date": 1492657672000,
                        "mean": 91.5,
                        "pricechangeratio": -8.19,
                        "transactioncount": 14441,
                        "transactionprice": 2143.35
                    }, {
                        "date": 1492657732000,
                        "mean": 91.71,
                        "pricechangeratio": -8.51,
                        "transactioncount": 5313,
                        "transactionprice": 2143.03
                    }, {
                        "date": 1492657792000,
                        "mean": 91.9,
                        "pricechangeratio": -5.52,
                        "transactioncount": 5227,
                        "transactionprice": 2146.02
                    }, {
                        "date": 1492657852000,
                        "mean": 92.11,
                        "pricechangeratio": -6.04,
                        "transactioncount": 5686,
                        "transactionprice": 2145.5
                    }, {
                        "date": 1492657912000,
                        "mean": 91.33,
                        "pricechangeratio": -6.57,
                        "transactioncount": 22760,
                        "transactionprice": 2144.97
                    }, {
                        "date": 1492657972000,
                        "mean": 91.48,
                        "pricechangeratio": -5.99,
                        "transactioncount": 5255,
                        "transactionprice": 2145.55
                    }, {
                        "date": 1492658032000,
                        "mean": 91.55,
                        "pricechangeratio": -9.08,
                        "transactioncount": 5431,
                        "transactionprice": 2142.46
                    }, {
                        "date": 1492658092000,
                        "mean": 91.77,
                        "pricechangeratio": -10.15,
                        "transactioncount": 4762,
                        "transactionprice": 2141.39
                    }, {
                        "date": 1492658152000,
                        "mean": 91.99,
                        "pricechangeratio": -12.34,
                        "transactioncount": 4312,
                        "transactionprice": 2139.2
                    }, {
                        "date": 1492658212000,
                        "mean": 92.3,
                        "pricechangeratio": -12.82,
                        "transactioncount": 3804,
                        "transactionprice": 2138.72
                    }, {
                        "date": 1492658272000,
                        "mean": 92.26,
                        "pricechangeratio": -13.02,
                        "transactioncount": 5721,
                        "transactionprice": 2138.52
                    }, {
                        "date": 1492658332000,
                        "mean": 92.42,
                        "pricechangeratio": -15.99,
                        "transactioncount": 4853,
                        "transactionprice": 2135.55
                    }, {
                        "date": 1492658392000,
                        "mean": 92.5,
                        "pricechangeratio": -16.23,
                        "transactioncount": 5102,
                        "transactionprice": 2135.31
                    }, {
                        "date": 1492658452000,
                        "mean": 92.87,
                        "pricechangeratio": -15.91,
                        "transactioncount": 4637,
                        "transactionprice": 2135.63
                    }, {
                        "date": 1492658512000,
                        "mean": 92.95,
                        "pricechangeratio": -17.33,
                        "transactioncount": 6406,
                        "transactionprice": 2134.21
                    }, {
                        "date": 1492658572000,
                        "mean": 93.25,
                        "pricechangeratio": -14.99,
                        "transactioncount": 3575,
                        "transactionprice": 2136.55
                    }, {
                        "date": 1492658632000,
                        "mean": 93.29,
                        "pricechangeratio": -15.53,
                        "transactioncount": 6065,
                        "transactionprice": 2136.01
                    }, {
                        "date": 1492658692000,
                        "mean": 93.39,
                        "pricechangeratio": -17.12,
                        "transactioncount": 4732,
                        "transactionprice": 2134.42
                    }, {
                        "date": 1492658752000,
                        "mean": 93.67,
                        "pricechangeratio": -16.49,
                        "transactioncount": 4730,
                        "transactionprice": 2135.05
                    }, {
                        "date": 1492658812000,
                        "mean": 93.81,
                        "pricechangeratio": -17.2,
                        "transactioncount": 4661,
                        "transactionprice": 2134.34
                    }, {
                        "date": 1492658872000,
                        "mean": 93.77,
                        "pricechangeratio": -16.95,
                        "transactioncount": 5471,
                        "transactionprice": 2134.59
                    }, {
                        "date": 1492658932000,
                        "mean": 93.98,
                        "pricechangeratio": -15.61,
                        "transactioncount": 4192,
                        "transactionprice": 2135.93
                    }, {
                        "date": 1492658992000,
                        "mean": 94.72,
                        "pricechangeratio": -16.74,
                        "transactioncount": 8707,
                        "transactionprice": 2134.8
                    }, {
                        "date": 1492659052000,
                        "mean": 95,
                        "pricechangeratio": -16.48,
                        "transactioncount": 4578,
                        "transactionprice": 2135.06
                    }, {
                        "date": 1492664511000,
                        "mean": 95.13,
                        "pricechangeratio": -17.78,
                        "transactioncount": 2838,
                        "transactionprice": 2133.76
                    }, {
                        "date": 1492664571000,
                        "mean": 95.2,
                        "pricechangeratio": -16.34,
                        "transactioncount": 5638,
                        "transactionprice": 2135.2
                    }, {
                        "date": 1492664631000,
                        "mean": 93.54,
                        "pricechangeratio": -15.93,
                        "transactioncount": 62779,
                        "transactionprice": 2135.61
                    }, {
                        "date": 1492664691000,
                        "mean": 93.61,
                        "pricechangeratio": -16.81,
                        "transactioncount": 3523,
                        "transactionprice": 2134.73
                    }, {
                        "date": 1492664751000,
                        "mean": 93.71,
                        "pricechangeratio": -17.55,
                        "transactioncount": 3773,
                        "transactionprice": 2133.99
                    }, {
                        "date": 1492664811000,
                        "mean": 93.85,
                        "pricechangeratio": -17.96,
                        "transactioncount": 3253,
                        "transactionprice": 2133.58
                    }, {
                        "date": 1492664871000,
                        "mean": 93.97,
                        "pricechangeratio": -15.83,
                        "transactioncount": 6024,
                        "transactionprice": 2135.71
                    }, {
                        "date": 1492664931000,
                        "mean": 94.09,
                        "pricechangeratio": -16.72,
                        "transactioncount": 6787,
                        "transactionprice": 2134.82
                    }, {
                        "date": 1492664991000,
                        "mean": 95.25,
                        "pricechangeratio": -15.52,
                        "transactioncount": 8116,
                        "transactionprice": 2136.02
                    }, {
                        "date": 1492665051000,
                        "mean": 95.86,
                        "pricechangeratio": -15.27,
                        "transactioncount": 5664,
                        "transactionprice": 2136.27
                    }, {
                        "date": 1492665111000,
                        "mean": 96.06,
                        "pricechangeratio": -16,
                        "transactioncount": 3350,
                        "transactionprice": 2135.54
                    }, {
                        "date": 1492665171000,
                        "mean": 96.29,
                        "pricechangeratio": -15.67,
                        "transactioncount": 3796,
                        "transactionprice": 2135.87
                    }, {
                        "date": 1492665231000,
                        "mean": 96.37,
                        "pricechangeratio": -15.21,
                        "transactioncount": 5369,
                        "transactionprice": 2136.33
                    }, {
                        "date": 1492665291000,
                        "mean": 96.68,
                        "pricechangeratio": -14.57,
                        "transactioncount": 5219,
                        "transactionprice": 2136.97
                    }, {
                        "date": 1492665351000,
                        "mean": 96.78,
                        "pricechangeratio": -15.95,
                        "transactioncount": 3702,
                        "transactionprice": 2135.59
                    }, {
                        "date": 1492665411000,
                        "mean": 96.98,
                        "pricechangeratio": -16.59,
                        "transactioncount": 4304,
                        "transactionprice": 2134.95
                    }, {
                        "date": 1492665471000,
                        "mean": 97.17,
                        "pricechangeratio": -15.09,
                        "transactioncount": 4554,
                        "transactionprice": 2136.45
                    }, {
                        "date": 1492665531000,
                        "mean": 97.27,
                        "pricechangeratio": -15.56,
                        "transactioncount": 3588,
                        "transactionprice": 2135.98
                    }, {
                        "date": 1492665591000,
                        "mean": 97.37,
                        "pricechangeratio": -15.52,
                        "transactioncount": 3358,
                        "transactionprice": 2136.02
                    }, {
                        "date": 1492665651000,
                        "mean": 97.52,
                        "pricechangeratio": -13.98,
                        "transactioncount": 4372,
                        "transactionprice": 2137.56
                    }, {
                        "date": 1492665711000,
                        "mean": 97.59,
                        "pricechangeratio": -14.15,
                        "transactioncount": 3756,
                        "transactionprice": 2137.39
                    }, {
                        "date": 1492665771000,
                        "mean": 97.68,
                        "pricechangeratio": -15.49,
                        "transactioncount": 4760,
                        "transactionprice": 2136.05
                    }, {
                        "date": 1492665831000,
                        "mean": 97.81,
                        "pricechangeratio": -14.95,
                        "transactioncount": 5642,
                        "transactionprice": 2136.59
                    }, {
                        "date": 1492665891000,
                        "mean": 97.91,
                        "pricechangeratio": -14.42,
                        "transactioncount": 5385,
                        "transactionprice": 2137.12
                    }, {
                        "date": 1492665951000,
                        "mean": 97.57,
                        "pricechangeratio": -14.56,
                        "transactioncount": 13301,
                        "transactionprice": 2136.98
                    }, {
                        "date": 1492666011000,
                        "mean": 97.54,
                        "pricechangeratio": -13.02,
                        "transactioncount": 4447,
                        "transactionprice": 2138.52
                    }, {
                        "date": 1492666071000,
                        "mean": 97.61,
                        "pricechangeratio": -11.59,
                        "transactioncount": 4072,
                        "transactionprice": 2139.95
                    }, {
                        "date": 1492666131000,
                        "mean": 97.67,
                        "pricechangeratio": -13.49,
                        "transactioncount": 3647,
                        "transactionprice": 2138.05
                    }, {
                        "date": 1492666191000,
                        "mean": 97.96,
                        "pricechangeratio": -11.86,
                        "transactioncount": 5425,
                        "transactionprice": 2139.68
                    }, {
                        "date": 1492666251000,
                        "mean": 98.08,
                        "pricechangeratio": -13.6,
                        "transactioncount": 4415,
                        "transactionprice": 2137.94
                    }, {
                        "date": 1492666311000,
                        "mean": 98.11,
                        "pricechangeratio": -13.88,
                        "transactioncount": 5690,
                        "transactionprice": 2137.66
                    }, {
                        "date": 1492666371000,
                        "mean": 98.13,
                        "pricechangeratio": -12.73,
                        "transactioncount": 4501,
                        "transactionprice": 2138.81
                    }, {
                        "date": 1492666431000,
                        "mean": 98.19,
                        "pricechangeratio": -13.42,
                        "transactioncount": 4905,
                        "transactionprice": 2138.12
                    }, {
                        "date": 1492666491000,
                        "mean": 98.26,
                        "pricechangeratio": -14.96,
                        "transactioncount": 3102,
                        "transactionprice": 2136.58
                    }, {
                        "date": 1492666551000,
                        "mean": 98.14,
                        "pricechangeratio": -15.99,
                        "transactioncount": 11183,
                        "transactionprice": 2135.55
                    }, {
                        "date": 1492666611000,
                        "mean": 98.21,
                        "pricechangeratio": -16.49,
                        "transactioncount": 2101,
                        "transactionprice": 2135.05
                    }, {
                        "date": 1492666671000,
                        "mean": 98.35,
                        "pricechangeratio": -17.38,
                        "transactioncount": 9070,
                        "transactionprice": 2134.16
                    }, {
                        "date": 1492666731000,
                        "mean": 98.56,
                        "pricechangeratio": -18.14,
                        "transactioncount": 3220,
                        "transactionprice": 2133.4
                    }, {
                        "date": 1492666791000,
                        "mean": 98.71,
                        "pricechangeratio": -18.71,
                        "transactioncount": 5049,
                        "transactionprice": 2132.83
                    }, {
                        "date": 1492666851000,
                        "mean": 98.74,
                        "pricechangeratio": -19.79,
                        "transactioncount": 5557,
                        "transactionprice": 2131.75
                    }, {
                        "date": 1492666911000,
                        "mean": 98.69,
                        "pricechangeratio": -20.21,
                        "transactioncount": 6728,
                        "transactionprice": 2131.33
                    }, {
                        "date": 1492666971000,
                        "mean": 99.03,
                        "pricechangeratio": -23.02,
                        "transactioncount": 3931,
                        "transactionprice": 2128.52
                    }, {
                        "date": 1492667031000,
                        "mean": 99.12,
                        "pricechangeratio": -23.81,
                        "transactioncount": 3378,
                        "transactionprice": 2127.73
                    }, {
                        "date": 1492667091000,
                        "mean": 99.61,
                        "pricechangeratio": -23.09,
                        "transactioncount": 5680,
                        "transactionprice": 2128.45
                    }, {
                        "date": 1492667151000,
                        "mean": 99.7,
                        "pricechangeratio": -24.58,
                        "transactioncount": 5401,
                        "transactionprice": 2126.96
                    }, {
                        "date": 1492667211000,
                        "mean": 99.85,
                        "pricechangeratio": -24.53,
                        "transactioncount": 3978,
                        "transactionprice": 2127.01
                    }, {
                        "date": 1492667271000,
                        "mean": 99.89,
                        "pricechangeratio": -25.32,
                        "transactioncount": 3607,
                        "transactionprice": 2126.22
                    }, {
                        "date": 1492667331000,
                        "mean": 99.94,
                        "pricechangeratio": -25.45,
                        "transactioncount": 3834,
                        "transactionprice": 2126.09
                    }, {
                        "date": 1492667391000,
                        "mean": 99.94,
                        "pricechangeratio": -26.23,
                        "transactioncount": 5473,
                        "transactionprice": 2125.31
                    }, {
                        "date": 1492667451000,
                        "mean": 99.95,
                        "pricechangeratio": -25.98,
                        "transactioncount": 6221,
                        "transactionprice": 2125.56
                    }, {
                        "date": 1492667511000,
                        "mean": 100.31,
                        "pricechangeratio": -27.2,
                        "transactioncount": 6781,
                        "transactionprice": 2124.34
                    }, {
                        "date": 1492667571000,
                        "mean": 100.31,
                        "pricechangeratio": -26.9,
                        "transactioncount": 5460,
                        "transactionprice": 2124.64
                    }, {
                        "date": 1492667631000,
                        "mean": 100.31,
                        "pricechangeratio": -27.67,
                        "transactioncount": 4916,
                        "transactionprice": 2123.87
                    }, {
                        "date": 1492667691000,
                        "mean": 100.67,
                        "pricechangeratio": -26.57,
                        "transactioncount": 7933,
                        "transactionprice": 2124.97
                    }, {
                        "date": 1492667751000,
                        "mean": 100.69,
                        "pricechangeratio": -28.33,
                        "transactioncount": 3759,
                        "transactionprice": 2123.21
                    }, {
                        "date": 1492667811000,
                        "mean": 100.58,
                        "pricechangeratio": -29.01,
                        "transactioncount": 6002,
                        "transactionprice": 2122.53
                    }, {
                        "date": 1492667871000,
                        "mean": 100.59,
                        "pricechangeratio": -30.65,
                        "transactioncount": 5162,
                        "transactionprice": 2120.89
                    }, {
                        "date": 1492667931000,
                        "mean": 100.62,
                        "pricechangeratio": -33.26,
                        "transactioncount": 6460,
                        "transactionprice": 2118.28
                    }, {
                        "date": 1492667991000,
                        "mean": 100.54,
                        "pricechangeratio": -33.47,
                        "transactioncount": 6322,
                        "transactionprice": 2118.07
                    }, {
                        "date": 1492668051000,
                        "mean": 100.53,
                        "pricechangeratio": -33.25,
                        "transactioncount": 4218,
                        "transactionprice": 2118.29
                    }, {
                        "date": 1492668111000,
                        "mean": 100.63,
                        "pricechangeratio": -35.4,
                        "transactioncount": 4384,
                        "transactionprice": 2116.14
                    }, {
                        "date": 1492668171000,
                        "mean": 100.68,
                        "pricechangeratio": -34.04,
                        "transactioncount": 6965,
                        "transactionprice": 2117.5
                    }, {
                        "date": 1492668231000,
                        "mean": 100.91,
                        "pricechangeratio": -34,
                        "transactioncount": 6184,
                        "transactionprice": 2117.54
                    }, {
                        "date": 1492668291000,
                        "mean": 100.73,
                        "pricechangeratio": -32.84,
                        "transactioncount": 9918,
                        "transactionprice": 2118.7
                    }, {
                        "date": 1492668351000,
                        "mean": 100.54,
                        "pricechangeratio": -32.08,
                        "transactioncount": 7021,
                        "transactionprice": 2119.46
                    }, {
                        "date": 1492668411000,
                        "mean": 100.42,
                        "pricechangeratio": -31.06,
                        "transactioncount": 7672,
                        "transactionprice": 2120.48
                    }, {
                        "date": 1492668471000,
                        "mean": 100.52,
                        "pricechangeratio": -33.82,
                        "transactioncount": 3740,
                        "transactionprice": 2117.72
                    }, {
                        "date": 1492668531000,
                        "mean": 100.74,
                        "pricechangeratio": -31.03,
                        "transactioncount": 3435,
                        "transactionprice": 2120.51
                    }, {
                        "date": 1492668591000,
                        "mean": 99.94,
                        "pricechangeratio": -30.17,
                        "transactioncount": 37274,
                        "transactionprice": 2121.37
                    }, {
                        "date": 1492668651000,
                        "mean": 100,
                        "pricechangeratio": -29.03,
                        "transactioncount": 4554,
                        "transactionprice": 2122.51
                    }, {
                        "date": 1492668711000,
                        "mean": 100.03,
                        "pricechangeratio": -30.6,
                        "transactioncount": 4666,
                        "transactionprice": 2120.94
                    }, {
                        "date": 1492668771000,
                        "mean": 99.87,
                        "pricechangeratio": -29.43,
                        "transactioncount": 11036,
                        "transactionprice": 2122.11
                    }, {
                        "date": 1492668831000,
                        "mean": 100.08,
                        "pricechangeratio": -31.1,
                        "transactioncount": 7359,
                        "transactionprice": 2120.44
                    }, {
                        "date": 1492668891000,
                        "mean": 100.18,
                        "pricechangeratio": -31.17,
                        "transactioncount": 5461,
                        "transactionprice": 2120.37
                    }, {
                        "date": 1492668951000,
                        "mean": 100.13,
                        "pricechangeratio": -31.9,
                        "transactioncount": 7687,
                        "transactionprice": 2119.64
                    }, {
                        "date": 1492669011000,
                        "mean": 100.13,
                        "pricechangeratio": -32.97,
                        "transactioncount": 4129,
                        "transactionprice": 2118.57
                    }, {
                        "date": 1492669071000,
                        "mean": 100.11,
                        "pricechangeratio": -32.91,
                        "transactioncount": 4538,
                        "transactionprice": 2118.63
                    }, {
                        "date": 1492669131000,
                        "mean": 99.9,
                        "pricechangeratio": -32.65,
                        "transactioncount": 9282,
                        "transactionprice": 2118.89
                    }, {
                        "date": 1492669191000,
                        "mean": 100.04,
                        "pricechangeratio": -34.09,
                        "transactioncount": 5059,
                        "transactionprice": 2117.45
                    }, {
                        "date": 1492669251000,
                        "mean": 99.92,
                        "pricechangeratio": -33.24,
                        "transactioncount": 8089,
                        "transactionprice": 2118.3
                    }, {
                        "date": 1492669311000,
                        "mean": 100.05,
                        "pricechangeratio": -33.58,
                        "transactioncount": 5833,
                        "transactionprice": 2117.96
                    }, {
                        "date": 1492669371000,
                        "mean": 100.17,
                        "pricechangeratio": -34.68,
                        "transactioncount": 5496,
                        "transactionprice": 2116.86
                    }, {
                        "date": 1492669431000,
                        "mean": 100.1,
                        "pricechangeratio": -34.09,
                        "transactioncount": 5998,
                        "transactionprice": 2117.45
                    }, {
                        "date": 1492669491000,
                        "mean": 100.04,
                        "pricechangeratio": -33.56,
                        "transactioncount": 9503,
                        "transactionprice": 2117.98
                    }, {
                        "date": 1492669551000,
                        "mean": 100.03,
                        "pricechangeratio": -34.33,
                        "transactioncount": 5142,
                        "transactionprice": 2117.21
                    }, {
                        "date": 1492669611000,
                        "mean": 99.94,
                        "pricechangeratio": -33.47,
                        "transactioncount": 7202,
                        "transactionprice": 2118.07
                    }, {
                        "date": 1492669671000,
                        "mean": 99.73,
                        "pricechangeratio": -32.46,
                        "transactioncount": 9220,
                        "transactionprice": 2119.08
                    }, {
                        "date": 1492699971000,
                        "mean": 99.83,
                        "pricechangeratio": -32.46,
                        "transactioncount": 9220,
                        "transactionprice": 2119.08
                    }],
                "ydclosingprice": 2151.54
            };
            $("#container6-1").html("");
            $("#container6-1").append('<div class="tipMess"></div><div class="cb"></div><div id="container-x" ></div>');
            // var data = eval("(" + res + ")");
            new minStockChart("container-x", res, false);


            /*$.ajax({
             type: "post",
             async: true,
             url: req,
             dataType: "text",
             success: function (data) {

             }
             });*/
        };
        $(function () {
            request();
        });

    </script>
	  