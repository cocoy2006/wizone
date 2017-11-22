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
	<link rel="stylesheet" href="<%=basePath%>resources/css/index.css" media="screen" />
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
        .tip {
        	position: absolute; background: url('wibupt/img/049.png'); width: 40px; height: 40px; z-index: -7993648; user-select: none;
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
	<div style="margin:0 auto; width: 974px; padding-top: 10px; position:relative;">
	    <img src="wibupt/img/map.jpg" width="974px" height="1705px">
	    
	    <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
	      <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
					<div class="heatmap1" style="position: absolute; padding: 0px; margin: 0; border: 0px; width: 974px; height: 1705px; border-radius:90px; z-index: -7993648; user-select: none;"></div>
			  	
			  	<a href="<%=basePath%>realtime?id=1">
					  <span data-placement="bottom" class="tip" data-tip="tip-1" style="left: 168px; top: 274px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=2">
					  <span data-placement="bottom" class="tip" data-tip="tip-2" style="left: 330px; top: 274px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=3">
					  <span data-placement="bottom" class="tip" data-tip="tip-3" style="left: 507px; top: 306px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=4">
					  <span data-placement="bottom" class="tip" data-tip="tip-4" style="left: 610px; top: 306px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=5">
					  <span data-placement="bottom" class="tip" data-tip="tip-5" style="left: 726px; top: 306px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=6">
					  <span data-placement="bottom" class="tip" data-tip="tip-6" style="left: 154px; top: 418px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=7">
					  <span data-placement="bottom" class="tip" data-tip="tip-7" style="left: 262px; top: 404px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=8">
					  <span data-placement="bottom" class="tip" data-tip="tip-8" style="left: 364px; top: 524px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=9">
					  <span data-placement="bottom" class="tip" data-tip="tip-9" style="left: 600px; top: 534px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=10">
					  <span data-placement="bottom" class="tip" data-tip="tip-10" style="left: 158px; top: 608px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=11">
					  <span data-placement="bottom" class="tip" data-tip="tip-11" style="left: 262px; top: 585px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=12">
					  <span data-placement="bottom" class="tip" data-tip="tip-12" style="left: 598px; top: 692px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=13">
					  <span data-placement="bottom" class="tip" data-tip="tip-13" style="left: 158px; top: 886px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=14">
					  <span data-placement="bottom" class="tip" data-tip="tip-14" style="left: 310px; top: 886px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=15">
					  <span data-placement="bottom" class="tip" data-tip="tip-15" style="left: 500px; top: 878px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=16">
					  <span data-placement="bottom" class="tip" data-tip="tip-16" style="left: 602px; top: 878px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=17">
					  <span data-placement="bottom" class="tip" data-tip="tip-17" style="left: 712px; top: 878px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=18">
					  <span data-placement="bottom" class="tip" data-tip="tip-18" style="left: 252px; top: 1054px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=19">
					  <span data-placement="bottom" class="tip" data-tip="tip-19" style="left: 598px; top: 1068px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=20">
					  <span data-placement="bottom" class="tip" data-tip="tip-20" style="left: 254px; top: 1286px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=21">
					  <span data-placement="bottom" class="tip" data-tip="tip-21" style="left: 554px; top: 1240px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=22">
					  <span data-placement="bottom" class="tip" data-tip="tip-22" style="left: 554px; top: 1338px;" title="">
					  </span>
					</a>
					<a href="<%=basePath%>realtime?id=23">
					  <span data-placement="bottom" class="tip" data-tip="tip-23" style="left: 724px; top: 1305px;" title="">
					  </span>
					</a>
				</div>
	    </div>
	</div>

	<div id="dataOfAll"></div>
</body>

	<script src="<%=basePath%>wibupt/js/jquery.js"></script>
	<script src="<%=basePath%>wibupt/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>wibupt/js/highstock.js"></script>
	<script src="<%=basePath%>wibupt/js/exporting1.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=basePath%>wibupt/js/bootstrap-tab.js"></script>
	<script src="<%=basePath%>wibupt/js/bootstrap-modal.js"></script>
	<script src="<%=basePath%>wibupt/js/bootstrap-carousel.js"></script>
	<script type="text/javascript" src="<%=basePath%>wibupt/js/Function.js"></script>
	<script type="text/javascript" src="<%=basePath%>wibupt/js/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>wibupt/js/heatmap.min.js"></script>
	
	<script>
	$(function() {
	    waitingDialog.show();
	    showoverlay();	
	    setInterval(showoverlay, 300000); //每隔5分钟删除所有已添加覆盖物，重新获取热力图标注
	});
	
	function showoverlay() {
    $('#dataOfAll').empty();
    $.ajax({
    	async: false,
      url: '<%=basePath%>heatmap/getAllHeat/',
      dataType: 'json',
      success: function(data) {
        var points = new Array();
        for (var i = 0; i < data.heat.length; i++) {
            var point = {
                'groupid': data.heat[i].groupid,
                'count': data.heat[i].cnt,
                'groupname': data.heat[i].monidname
            };
            points[i] = point;
        }
        var dataStr = '';
        for (var i = 0,
        len = points.length; i < len; i++) {
            dataStr = '<div id="tip-' + points[i].groupid + '" class="tip-content hidden"><span>当前位置：<b>' + points[i].groupname + '</b></span><br/><span>热力指数：<b>' + points[i].count + '</b></span</div>';
            $('#dataOfAll').append(dataStr);
        }
        $('.tip').each(function() {
            $(this).tooltip({
                html: true,
                title: $('#' + $(this).data('tip')).html()
            });
        });

        var max = 1; // 以200作为人多的标准 
        for (var j = 0; j < 23; j++) {
            if (data.heat[j].cnt > max) {
                max = data.heat[j].cnt;
            }
        }
        
        var data1 = {
            max: max,
            data: [
            	{x:168,y:274,value:points[0].count},
            	{x:330,y:274,value:points[1].count},
            	{x:507,y:306,value:points[2].count},
            	{x:610,y:306,value:points[3].count},
            	{x:726,y:306,value:points[4].count},
            	{x:154,y:418,value:points[5].count},
            	{x:262,y:404,value:points[6].count},
            	{x:364,y:524,value:points[7].count},
            	{x:600,y:534,value:points[8].count},
            	{x:158,y:608,value:points[9].count},
            	{x:262,y:585,value:points[10].count},
            	{x:598,y:692,value:points[11].count},
            	{x:158,y:886,value:points[12].count},
            	{x:310,y:886,value:points[13].count},
            	{x:500,y:878,value:points[14].count},
            	{x:602,y:878,value:points[15].count},
            	{x:712,y:878,value:points[16].count},
            	{x:252,y:1054,value:points[17].count},
            	{x:598,y:1068,value:points[18].count},
            	{x:254,y:1286,value:points[19].count},
            	{x:554,y:1240,value:points[20].count},
            	{x:554,y:1338,value:points[21].count},
            	{x:724,y:1305,value:points[22].count}
            	]
        };
        
        var heatmap1 = h337.create({
            container: document.querySelector('.heatmap1'),
            maxOpacity: .5,
            minOpacity: 0,
            blur: .75,
            radius: 100 
        });
        heatmap1.setData(data1);
      }
    });
    waitingDialog.hide();
	}
	</script>

</html>