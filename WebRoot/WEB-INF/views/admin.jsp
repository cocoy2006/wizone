<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.wicloud.main.java.entity.Monindex"%>
<%@ page import="com.wicloud.main.java.entity.Userinfo"%>
<%@ page import="com.wicloud.main.java.util.Wicloud"%>
<%@ page import="com.wicloud.main.java.util.DB"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Userinfo user = (Userinfo) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect(basePath.concat("index"));
	}
	
	String username = user.getUserName();
	String usertype = user.getUserType();
	String passwd = user.getPasswd();
	String contact = user.getContract();
	String type = request.getParameter("type");
	String qq = request.getParameter("pageNow");
	String admintype = "";
	if ("administrator".equals(usertype)) {
		admintype = "user";
	} else if ("user".equals(usertype)) {
		admintype = "user1";
	}
	int Page = (qq == null || "".equals(qq) ? 0 : Integer.parseInt(qq));
	int dis;
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>WiBupt - 基于WiFi数据的北邮校园分析</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="description" content="This is FU'S page">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
        <link rel="icon" href="<%=basePath%>favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="<%=basePath%>favicon.ico" type="image/x-icon" />		     
        <link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="<%=basePath%>resources/css/superfish.css" media="screen" />
		<link rel="stylesheet" href="<%=basePath%>resources/css/responsive.css" media="screen" />
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
  			<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  			<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script type="text/javascript" src="<%=basePath%>resources/js/jquery.js"></script>	
	    <script type="text/javascript" src="<%=basePath%>resources/js/bootstrap.js"></script>
	    <script type="text/javascript" src="<%=basePath%>resources/js/bootstrap-tab.js"></script>
	    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/DataTables-1.10.0/examples/resources/bootstrap/3/dataTables.bootstrap.css">
		<script type="text/javascript" src="<%=basePath%>resources/DataTables-1.10.0/media/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/DataTables-1.10.0/examples/resources/bootstrap/3/dataTables.bootstrap.js"></script>
		<script src="<%=basePath%>resources/js/Function.js"></script>	
		<script src="<%=basePath%>resources/js/alert.js"></script>	
		<script language="javaScript">
     	window.onload = function() {
		    if (('<%=usertype%>' == 'administrator')||('<%=usertype%>' == 'user')) {
		        $("#adminshow").show();
		        document.getElementById("<%=type%>").style.backgroundColor = "#3e5bb7";
		        document.getElementById("<%=type%>").style.fontWeight = "900";
		        document.getElementById("<%=type%>").style.fontSize = "20px";
		         document.getElementById("<%=type%>").style.color = "#fff";
		        if ('<%=type%>' == 'user') {
		            showuser();
		            showuserdata();
		            $("#addusershow").show();
		            $("#addgroupshow").hide();
		            $("#addnetshow").hide();
		            $("#addgroup").hide();
		        } else if ('<%=type%>' == 'net') {
		            shownet();
		            $("#userdata").hide();
		            $("#addusershow").hide();
		            $("#addgroupshow").hide();
		            $("#addgroup").hide();
		        }else if ('<%=type%>' == 'group') {
		            showgroup();
		            $("#userdata").hide();
		            $("#addusershow").hide();
		            $("#addnetshow").hide();
		            $("#addgroupshow").show();
		        }
		    } 
		}
     	
     	function showuser() {    
		    $("#userinfo").load("<%=basePath%>admin/userinfo/", 
		    	{pageNow:<%=Page%>});
		}
		function shownet() {
		    $("#netinfo").load("<%=basePath%>admin/netinfo/", 
		    	{pageNow:<%=Page%>});
		}
		//新加的group info
		function showgroup() {
	    	$("#groupinfo").load("<%=basePath%>admin/groupinfo/",
	    		{pageNow:<%=Page%>,username:'<%=username%>'});
	    		
		}
		function showuserdata() {
		    $.ajax({
				url: "<%=basePath%>admin/userinfo/",
				dataType: "json",
				success: function(jsonObj) {
					document.getElementById("total").innerHTML = jsonObj.total + "&nbsp;&nbsp;&nbsp;人";
		            document.getElementById("admin").innerHTML = jsonObj.admin + "&nbsp;&nbsp;&nbsp;人";
		            document.getElementById("ff").innerHTML = jsonObj.ff + "&nbsp;&nbsp;&nbsp;人";
				}
			});
		}
		function showoptionname() {
		    $("#change").show();
		    $("#old").hide();
		}
		function hidechangename() {
		    $("#change").hide();
		    $("#old").show();
		}
		function changeuser() {
		    hidechangename();
		    var reg = /\s/;
		    var passwd = $("#newpasswd").val();
		    var contact = $("#newcontact").val();
		    if (passwd == "" || contact == "") {
		        sAlert("警告", "请核对输入是否有空值！", "<%=basePath%>resources/images/warn.jpg");
		        return false;
		    } else if (reg.test(passwd) || reg.test(contact)) {
		        sAlert("警告", "请核对输入是否有空格！", "<%=basePath%>resources/images/warn.jpg");
		        return false;
		    } else {
		        $.ajax({
					url: "<%=basePath%>user/update/",
					data: "oldname=<%=username%>&newpasswd=" + passwd + "&newcontact=" + contact,
					dataType: "json",
					type: "POST",
					success: function(jsonObj) {
						if("1" == jsonObj) {
							sAlert("修改:<%=username%>个人信息,成功!", "重新登陆后有效", "<%=basePath%>resources/images/ok.jpg");
						} else {
							sAlert("修改失败", "请核对输入信息！", "<%=basePath%>resources/images/fail.jpg");
						}
					}
				});
		    }
		}
		function hidename(str1, str2, str3, str4) {
		    var newname = document.getElementById("name" + str1).value;
		    var newdis = document.getElementById("dis" + str2).value;
		    document.getElementById(str1).innerHTML = newname;
		    document.getElementById(str2).innerHTML = newdis;
		    document.getElementById(str4).innerHTML = "<botton style='margin:0px 0 0 5%;width:90%;background-color:#DF4C12;border:2px solid #DF4C12;' class='btn btn-success' onClick='showform('" + str1 + "','" + str2 + "','" + str3 + "','" + str4 + "');' >修改</botton>";
		}
		function showform(str1, str2, str3, str4) {
		    document.getElementById(str4).innerHTML = "<botton style='margin:5px 0 0 10%;width:80%;background-color:#DF4C12;border:2px solid #DF4C12;' class='btn btn-success' onClick='changename('" + str1 + "','" + str2 + "','" + str3 + "','" + str4 + "');' >确定</botton><botton style='margin:5px 0 0 10%;width:80%;background-color:#DF4C12;border:2px solid #DF4C12;' class='btn btn-success' onClick='hidename('" + str1 + "','" + str2 + "','" + str3 + "','" + str4 + "');' >取消</botton>";
		    document.getElementById(str1).innerHTML = "<input style='margin:5px 0 0 0%;width:100%;background-color:#fff;color:black' type=text id='name" + str1 + "' name=" + str1 + " value=" + str1 + " size='20' maxlength='20' class='form-control'>";
		    document.getElementById(str2).innerHTML = "<input style='margin:5px 0 0 0%;width:100%;background-color:#fff;color:black' type=text id='dis" + str2 + "' name=" + str2 + " value=" + str3 + " size='20' maxlength='20' class='form-control'>";
		
		}
		function changename(str1, str2, str3, str4) {
		    var reg = /\s/;
		    var newname = document.getElementById("name" + str1).value;
		    var newdis = document.getElementById("dis" + str2).value;
		    hidename(str1, str2, str3, str4);
		    if (newname == "" || newdis == "") {
		        sAlert("警告", "请核对输入是否有空值！", "<%=basePath%>resources/images/warn.jpg");
		        return false;
		    } else if (reg.test(newname) || reg.test(newdis)) {
		        sAlert("警告", "请核对输入是否有空格！", "<%=basePath%>resources/images/warn.jpg");
		        return false;
		    } else {
		        $.ajax({
					url: "<%=basePath%>monindex/update/",
					data: "monid=" + str2 + "&newname=" + newname + "&newdis=" + newdis,
					dataType: "json",
					type: "POST",
					success: function(jsonObj) {
						if("1" == jsonObj) {
							sAlert("修改店铺名称:" + newname + ",成功!", "您现在可以查看新的监测点信息了", "<%=basePath%>resources/images/ok.jpg");
						} else {
							sAlert("修改失败", "请核对输入信息！", "<%=basePath%>resources/images/fail.jpg");
						}
					}
				});
		    }
		}
		function tishi(str, id) {
		    if (str == "") {
		        var obj = document.getElementById(id);
		        obj.focus();
		    }
		}
		function choose(str) {
		    window.location.href = "<%=basePath%>admin?type=" + str + "&PageNow=<%=Page%>";
		}
		function showadduser() {
		    document.getElementById("adduser").innerHTML = 
		    	"<table  class='hovertable' border='0' cellpadding='0' cellspacing='0' style='width:100%;height:400px;'>" +
		    	"	<tr>" +
		    	"		<td>用户名</td>" +
		    	"	</tr> " +
		    	"	<tr>" +
		    	"		<td> <input type='text' value='用户名' id='regname' onfocus='if(this.value=='用户名')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td>密码</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='password' value='密码密码' id='passwd'onfocus='if(this.value=='密码密码')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td>核对密码</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='password' value='核对密码' id='passwd1' onfocus='if(this.value=='核对密码')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td>联系方式</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' value='联系方式' id='tele' onfocus='if(this.value=='联系方式')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><button  style='margin:20px 0 0 20%;width:60%;background-color:#3e5bb7;border:3px solid #3e5bb7;' class='btn btn-success' onclick='adduser();' >添加</button> </td>" +
		    	"	</tr>" +
		    	"</table>";
		} 
		
		
		// <!--添加用户-->
		function adduser() {
		    var user = document.getElementById("regname").value;
		    var passwd = document.getElementById("passwd").value;
		    var passwd1 = document.getElementById("passwd1").value;
		    var contract = document.getElementById("tele").value;
		    if (user == "" || passwd == "" || passwd1 == "" || contract == "") {
		        sAlert("警告", "请核对输入信息是否有空值！", "<%=basePath%>resources/images/warn.jpg");
		    } else if (passwd != passwd1) {
		        sAlert("警告", "请核对密码！", "<%=basePath%>resources/images/warn.jpg");
		        return false;
		    } else {
		        $.ajax({
	    	  		url: "<%=basePath%>user/save/",
	    	  		data: "username=" + user + "&passwd=" + passwd  + "&contract=" + contract,
	    	  		dataType: "json",
	    	  		type: "POST",
	    	  		success: function(data) {
	    	  			showuser();
	    	  			switch(data) {
	    	  				case 1:
	    	  					sAlert("注册成功", user+",欢迎您", "<%=basePath%>resources/images/ok.jpg");
	    	  					break;
	    	  				case -2:
	    	  					sAlert("注册失败", "用户名存在，请更换", "<%=basePath%>resources/images/fail.jpg");
	    	  					break;
	    	  				case -1: default:
	    	  					sAlert("注册失败", "请重试", "<%=basePath%>resources/images/fail.jpg");
	    	  					break;
	    	  			}
	    	  		},
	    	  		error: function(data) {
	    	  			sAlert("注册失败", data, "<%=basePath%>resources/images/fail.jpg");
	    	  		}
	    	  	});
		    }
		}
		// 添加监测点
		function showaddnet() {
		    document.getElementById("addnet").innerHTML = 
		    	"<table  class='hovertable' border='0' cellpadding='0' cellspacing='0' style='width:100%;height:400px;'>" +
		    	"	<tr>" +
		    	"		<td>监测点名称</td>" +
		    	"	</tr> " +
		    	"	<tr>" +
		    	"		<td> <input type='text' id='monidname' onfocus='if(this.value=='监测点名称')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td>监测点id</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='monidID' onfocus='if(this.value=='监测点id')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td>监测点分组</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='mongroupname' onfocus='if(this.value=='监测点分组')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td>监测点经度(必填)</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='monidlng' onfocus='if(this.value=='监测点经度')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td>监测点纬度(必填)</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='monidlat' onfocus='if(this.value=='监测点纬度')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td>室内信号强度(必填)</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='monidrssin' onfocus='if(this.value=='入店信号强度')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td>周边信号强度(必填)</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='monidrssout' onfocus='if(this.value=='周边信号强度')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td>布置地点</td>" +
		    	"	</tr>" +
		    	"	<tr>" +
		    	"		<td><input type='text' id='monidplace' onfocus='if(this.value=='布置地点')this.value='';' style='margin:0 0 0 5%;width:90%;' onblur='tishi(this.value,this.id);' class='form-control'></td>" +
		    	"	</tr>  " +
		    	"	<tr>" +
		    	"		<td><button  style='margin:20px 0 0 20%;width:60%;background-color:#3e5bb7;border:3px solid #3e5bb7;' class='btn btn-success' onclick='addnet();' >添加</button> </td>" +
		    	"	</tr>" +
		    	"</table>";
		} 
		// <!--添加监测点-->
		function addnet() {
			var netuser='<%=username%>';
		    var netname = document.getElementById("monidname").value;
		    var netID = document.getElementById("monidID").value;
		    var netGroup=document.getElementById("mongroupname").value;
		    var netlng = document.getElementById("monidlng").value;
		    var netlat = document.getElementById("monidlat").value;
		    var netrssin = document.getElementById("monidrssin").value;
		    var netrssout = document.getElementById("monidrssout").value;
		    var netadd = document.getElementById("monidplace").value;
		    if (netname == "" || netID == "" || netlng == "" || netlat == "" || netrssin  == ""|| netrssout  == "") {
		        sAlert("警告", "请核对输入信息是否有空值！", "<%=basePath%>resources/images/warn.jpg");
		    } else {
		        $.ajax({
	    	  		url: "<%=basePath%>monindex/add/",
	    	  		data: "netname=" + netname + "&netID=" + netID + "&netGroup=" + netGroup +"&netlng=" + netlng +"&netlat=" + netlat + "&netrssin=" + netrssin + "&netrssout=" + netrssout+"&netadd=" + netadd,
	    	  		dataType: "json",
	    	  		type: "POST",
	    	  		success: function(data) {
	    	  			shownet();
	    	  			switch(data) {
	    	  				case 1:
	    	  					sAlert("监测点添加成功", netuser + ",欢迎您的使用", "<%=basePath%>resources/images/ok.jpg");
	    	  					break;
	    	  				case -2:
	    	  					sAlert("添加失败", "监测点已存在，请更换", "<%=basePath%>resources/images/fail.jpg");
	    	  					break;
	    	  				case -1: default:
	    	  					sAlert("添加失败", "请检查分组是否存在", "<%=basePath%>resources/images/fail.jpg");
	    	  					break;
	    	  			}
	    	  			shownet();
	    	  		},
	    	  		error: function(data) {
	    	  			sAlert("注册失败,请检查分组是否存在！", data, "<%=basePath%>resources/images/fail.jpg");
	    	  		}
	    	  	});
		    }
		}
		
		// <!--添加分组-->
		function showaddgroup(){
			document.getElementById("addgroup").innerHTML = 
		    	"<form name='add' method='post'>" +
		    	"	<table class='hovertable'>" +
		    	"		<tr>" +
		    	"			<td> " +
		    	"				监测小组名称：" +
		    	"			</td>" +
		    	"			<td align='left' width='*'>" +
		    	"				<input type=text id='groupname' placeholder='监测小组名称' class='form-control'>" +
		    	"			</td>" +
		    	"		</tr>" +
		    	"	</table>" +
		    	"	</br>" +
		    	"	<botton style='color:#fff; margin: 20px 0 0 20%; height: 40px; width: 60%; background-color: #3e5bb7; border: 3px solid #3e5bb7;border-radius:4px' class='btn btn-success' onClick='addgroup();'>添加 </botton>  " +
		    	"</form>" ;
		}
		function addgroup() {
		    var reg = /\s/;
		    var groupuser = '<%=username%>';
		    var groupname = document.getElementById("groupname").value;
		    if (groupname == "") {
		        sAlert("警告", "请核对输入信息是否有空值！", "<%=basePath%>resources/images/warn.jpg");
		    } else if (reg.test(groupname)) {
		        sAlert("警告", "请核对输入是否有空格！", "/<%=basePath%>resources/images/warn.jpg");
		        return false;
		    } else {
		        $.ajax({
	    	  		url: "<%=basePath%>overview/add/",
	    	  		data: "groupname=" + groupname,
	    	  		dataType: "json",
	    	  		type: "POST",
	    	  		success: function(data) {
	    	  			showgroup();
	    	  			switch(data) {
	    	  				case 1:
	    	  					sAlert("分组名称添加成功,请刷新", groupuser + ",欢迎您的使用", "<%=basePath%>resources/images/ok.jpg");
	    	 
	    	  					break;
	    	  				default:
	    	  					sAlert("该分组名已存在", "请重试", "<%=basePath%>resources/images/fail.jpg");
	    	  					break;
	    	  			}
	    	  		}
	    	  	});
		    }
		}//addgroup
		function dispDataTable(className) {
			var oTable = $("." + className).dataTable({
				"bRetrieve":true,
				"language": {
		            "lengthMenu": "",
		            "zeroRecords": " 暂时没有记录 ",
		            "info": " 从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条", // do not work
		            "infoEmpty": " 暂时没有记录 ",
		            "infoFiltered": "(全部记录数 _MAX_  条)",
		            "search": " 模糊搜索 ",
		            "paginate": {
						"first": 	" 第一页 ",
						"previous": " 上一页 ",
						"next":     " 下一页 ",
						"last":     " 最后一页 "
		            }
		        }
			});
			return oTable;
		}
     	</script>
	</head>
	<body>
		<div id="wrapper row1"
			style="height: 50px; color: #F8F9F3; margin: 0px 0px 0px 0px; border-bottom: 1px solid #999999;">
			<header id="header" class="header" style="position:fixed;height:50px;width:100%;background-color:#464141;border-bottom:1px solid #3e5bb7;Z-index:1">
			<div class="grid_4 mobile-nomargin" style="position: absolute; left: 5%">
				<!-- BEGIN LOGO -->
				<div id="logo" class="logo">
					<a href="<%=basePath%>index">
						<img src="<%=basePath%>wibupt/img/logo_wibupt-m.png" style="width: 125px; height: 50px" alt="Wibupt" />
					</a>
				</div>
				<!-- END LOGO -->
			</div>
			<div style="position: absolute; left: 45%; width: 10%; height: 50px;" onmouseover="this.style.backgroundColor='#585151';"
				onmouseout="this.style.background='none';">
				<center>
					<p style="margin: 5px 0px 0px 0px; color: #C0CEFA; height: 15px; font-size: 15px; font-weight: 700"><%=username%>
					</p>
					<p style="margin: 5px 0px 0px 10px; color: white; height: 15px; font-size: 15px; font-weight: 800">
						欢迎您!
					</p>
				</center>
			</div>
			<div style="position: absolute; left: 60%; width: 31%">
				<!-- Main Navigation -->
				<nav class="primary clearfix">
				<!-- Menu -->
				<ul class="sf-menu">
					<li style="position: absolute; left: 0%; width: 33%">
						<a style="color: #ffffff" href="<%=basePath%>index"><center>我的首页 </center></a>
					</li>
					<li class="current-menu-item" style="position: absolute; left: 34%; width: 33%">
						<a href="<%=basePath%>admin?&type=<%=admintype%>&PageNow" style="color: #FFFFFF; font-size: 15px; font-weight: 200">
							<center> 设置 </center>
						</a>
					</li>
				</ul>
				<!-- Menu / End -->
				</nav>
				<!-- Main Navigation / End -->
			</div>
			<div style="position: absolute; height: 50px; width: 8%; left: 92%; top: 10px; font-size: 15px; font-weight: 800; color: #FFFFFF">
				<button style="margin: 0 0 0 10%; height: 30px; width: 80%; background-color: #3e5bb7; border: 3px solid #3e5bb7;"
					class="btn btn-success" onclick="window.location.href='<%=basePath%>user/logout/';">
					退出
				</button>
			</div>
			</header>
		</div>
		
		<div id="adminshow" style="position: absolute; left: 7.5%; top: 70px; width: 85%; height: 825px; border: 1px solid #fff; background-color: #E4E4E4;">
			<div id="navbar" style="position: absolute; left: 0%; top: 20px; width: 100%; height: 50px;">
				<input type="submit" id="user" value="用户管理" onClick="choose('user')" class="btn btn-success"
					style="position: absolute; top: 0px; width: 20%; left: 5%; height: 50px; background-color: #fff; color: black; border: 1px solid #999;" />
				<input type="submit" id="net" value="监测点管理" onClick="choose('net')" class="btn btn-success"
					style="position: absolute; top: 0px; width: 20%; left: 25%; height: 50px; background-color: #ffffff; color: black; border: 1px solid #999;" />
				<input type="submit" id="group" value="分组管理" onClick="choose('group')" class="btn btn-success"
					style="position: absolute; top: 0px; width: 20%; left: 45%; height: 50px; background-color: #ffffff; color: black; border: 1px solid #999;" />
			</div>
			<div id="content" style="position: absolute; width: 100%;">
				<div style="position: absolute; width: 100%; margin: 70px 0px 0px 0%; color: black;">
					<div style="position: absolute; width: 73%; margin: 0px 0px 0px 2%; color: black; height: 750px; border: 1px solid #999;">
						<div id="userinfo"></div>
						<div id="netinfo"></div>
						<div id="groupinfo"></div>
					</div>
					<div id="addnetshow" style="position: absolute; width: 23%; margin: 0px 0px 0px 76%; color: black; height: 750px; border: 1px solid #999;">
						<button style="color:white;margin: 20px 0 0 20%; height: 40px; width: 60%; background-color: #3e5bb7; border: 3px solid #3e5bb7;border-radius:4px"
							 onclick="showaddnet();">
							添加监测点
						</button>
						<div id="addnet" style="margin: 20px 0 0 5%; height: 450px; width: 90%;"></div>
					</div>
					<div id="addusershow" style="position: absolute; width: 23%; margin: 0px 0px 0px 76%; color: black; height: 750px; border: 1px solid #999;">
						<button style="color:white;margin: 20px 0 0 20%; height: 40px; width: 60%; background-color: #3e5bb7; border: 3px solid #3e5bb7;border-radius:4px"
						  onclick="showadduser();">
							添加用户
						</button>
						<div id="adduser" style="margin: 20px 0 0 5%; height: 420px; width: 90%;"></div>
					</div>
					<div id="addgroupshow" style="position: absolute; width: 23%; margin: 0px 0px 0px 76%; color: black; height: 750px; border: 1px solid #999;">
						<button style="color:white;margin: 20px 0 0 20%; height: 40px; width: 60%; background-color: #3e5bb7; border: 3px solid #3e5bb7;border-radius:4px" class="btn btn-success"
							onclick="showaddgroup();">
							添加监测小组
						</button>
						<div id="addgroup" style="margin: 20px 0 0 5%; height: 420px; width: 90%;"></div>
						
					</div><!-- addgroup 结束 -->
					
				</div>
			</div>
		</div>
	</body>
</html>