<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Welcome you!</title>
	</head>

	<body>
		welcome you. ${username}! Your password is ${password}!<br>
		<br>
	</body>
</html>
