<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if(session.getAttribute("user") != null) {
		session.removeAttribute("user");
	}
	session.invalidate();
	response.sendRedirect(basePath + "index");
%>