<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String admintype="user";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>Wizone - 基于WiFi数据的展厅分析</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="description" content="This is FU'S page">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<meta http-equiv="X-UA-Compatible" content="IE=9" />
		<link rel="icon" href="http://localhost/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="http://localhost/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="<%=basePath%>resources/css/superfish.css" media="screen" />
		<link href="<%=basePath%>resources/css/report/css/bootstrap.min.css" rel="stylesheet">
		 <link href="<%=basePath%>wibupt/css/tuli.css" type="text/css" rel="stylesheet"></link>
		<!-- Base Template Styles-->
		<!-- Template Styles-->
		<link rel="stylesheet" href="<%=basePath%>resources/css/style.css" media="screen" />
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
  			<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  			<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<style>
		body,html {
			margin: 0;
			padding: 0;
			font-family: "微软雅黑";
		}
		
		body {
            background:url(<%=basePath%>wibupt/img/blue-background-6.jpg);
            background-size:100% 1000px;
            
		}
		</style>
		<script type="text/javascript" src="<%=basePath%>resources/js/jquery.js"></script>
		<script src="<%=basePath%>resources/js/alert.js"></script>
		<%
			String type = request.getParameter("type");
		%>
		<script type="text/javascript">
		window.onload = function() {
			//checktype(<%=type%>);
		}
		function checktype(str) {
			if(str) {
				switch(str) {
					case "1":
						window.location = "<%=basePath%>overall"; //ignore parameters: monid & walldis
						break;
					case "-2":
						document.getElementById("error1").innerHTML="账户或密码错误，请重新输入！";
						break;
					default:
						document.getElementById("error1").innerHTML="服务器出小差了，请稍后重试！";
						break;
				}
			}
		}
		function signin() {
			var username = document.getElementById("loginname").value;
			var password = document.getElementById("loginpasswd").value;
			if(username == "" || password == "") {
				sAlert("警告","请核对输入信息是否有空值！","<%=basePath%>resources/images/warn.jpg");
			} else {
				$.ajax({
	    	  		url: "<%=basePath%>user/signin/",
	    	  		data: "username="+username+"&password="+password,
	    	  		dataType: "json",
	    	  		type: "POST",
	    	  		success: function(data) {
	    	  			switch(data) {
							case 1:
								window.location = "<%=basePath%>admin?type=<%=admintype%>&PageNow"; //ignore parameters: monid & walldis
								break;
							case -2:
								document.getElementById("error1").innerHTML="账户或密码错误，请重新输入！";
								break;
							default:
								document.getElementById("error1").innerHTML="服务器出小差了，请稍后重试！";
								break;
						}
	    	  		},
	    	  		error: function(data) {
	    	  			sAlert("登录失败","服务器连接异常","<%=basePath%>resources/images/fail.jpg");
	    	  		}
	    	  	});
			}
		}
		</script>

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
          			<ul id="myTab" class="nav navbar-nav navbar-right hidden-sm nav-tabs">
   						<li class="active">
      						<a href="<%=basePath%>index" style="font-size: 18px">返回实时展厅</a>
   						</li>
          			</ul>
        		</div>
      		</div>
    	</div>

	
		<div id="content" style="height: 500px; margin: 140px 0px 0px 0px;">
			<div class="module" style="height: 350px;width:33%;position:absolute;left:34%;background-color:rgba(0,0,0,0.6)">
			<div id="login">
				<form method="post" name="frmLogin" action="LoginServlet"
					class="navbar-form navbar-right"
					style="position: absolute; left: 0%; width: 100%; height: 200px; margin: 50px 0px 0px 0px;">
					<p style="font-size: 15px; margin: 0 0 0px 30px;color:white">
						用户名
					</p>
					<input type="text" value="" id="loginname" name="txtUserName"
						onblur="tishi(this.value,this.id);"
						style="position: absolute; left: 15%; width: 70%; height: 40px; top: 28px"
						class="form-control" placeholder="用户名">
					<p style="font-size: 15px; margin: 60px 0 0px 30px;color:white">
						密码
					</p>
					<input type="password" value="" id="loginpasswd"
						name="txtPassword"
						onblur="tishi(this.value,this.id);"
						style="position: absolute; left: 15%; width: 70%; height: 40px; top: 110px"
						class="form-control" placeholder="密码">

					<button type="button"
						style="position: absolute; left: 15%; width: 70%; height: 40px; top: 190px; background-color: #3e5bb7; border: 3px solid #3e5bb7;"
						class="btn btn-success" onclick="signin()">
						登录
					</button>
				</form>
				<div id="error1"
					style="position: absolute; left: 25%; top: 210px; width: 80%; height: 30px; color: red; font-size: 15px">
				</div>
				<label for="remember_me"
					style="position: absolute; left: 15%; width: 40%; height: 40px; top: 300px;color:white">
					<input name="user[remember_me]" type="hidden" value="0">
					<input id="user_remember_me" name="user[remember_me]"
						type="checkbox" value="1">
					记住我
				</label>
				<p
					style="position: absolute; left: 65%; width: 40%; height: 40px; top: 300px;"
					onClick="sAlert('请联系我们','电话：18511599022','<%=basePath%>resources/images/tele.jpg');">
					<a href="#">忘记密码？</a>
				</p>

			</div>
			
		</div>
		</div>
		<!-- javaScript 函数 validateLogin(),用来验证用户名和密码是否为空 -->
		<script language="javaScript">
		function tishi(str, id) {
			if (str == "") {
				var obj = document.getElementById(id);
				obj.focus();
			}
		}
		</script>
	</body>
</html>

