<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.wicloud.main.java.entity.Userinfo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Userinfo user = (Userinfo) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect(basePath.concat("index"));
	}
%>
<!DOCTYPE HTML>
<br/>
<table class="table table-striped table-bordered dataTable" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>权限</th>
            <th>联系方式 </th>
            <th>操作</th>
        </tr>
    </thead> 
    <tbody>
    	<tr>
            <td><%=user.getUserName() %></td>
			<td><%=user.getPasswd() %></td>
			<td><%=user.getUserType() %></td>
			<td><%=user.getContract() %></td>
			<td><button class='btn btn-danger' onclick="openUserModal1()">修改</button></td>
        </tr>
    </tbody>
</table>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">
					我的个人信息
				</h4>
			</div>
			<div class="modal-body">
				<form role="form">
				  <div class="form-group">
				    <label for="newpassword">密码</label>
				    <input type="password" class="form-control" id="newpassword" value="<%=user.getPasswd() %>" placeholder="请输入新的密码">
				  </div>
				  <div class="form-group">
				    <label for="newpassword1">确认密码</label>
				    <input type="password" class="form-control" id="newpassword1" value="<%=user.getPasswd() %>" placeholder="请输入新的确认密码">
				  </div>
				  <div class="form-group">
				    <label for="newcontact">联系方式</label>
				    <input type="text" class="form-control" id="newcontact" value="<%=user.getContract() %>" placeholder="请输入新的联系方式">
				  </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="updateUser()">
					保存并关闭
				</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		dispDataTable("table");
	});
	
	function openUserModal1() {
		$(".modal").modal();
	}
	
	function updateUser() {
		var username = "<%=user.getUserName() %>";
	  	var passwd = $("#newpassword").val();
	  	var passwd1 = $("#newpassword1").val();
	  	var contract = $("#newcontact").val();
	 	if( username==""||passwd==""||passwd1==""||contract=="") {
       		sAlert("警告","请核对输入信息是否有空值！","<%=basePath%>resources/images/warn.jpg");
      	} else if( passwd != passwd1) {
       		sAlert("警告","请核对密码！","<%=basePath%>resources/images/warn.jpg");
       		return false;
      	} else {
    	  	$.ajax({
    	  		url: "<%=basePath%>user/update/",
    	  		data: "oldname="+username+"&newpasswd="+passwd+"&newcontact="+contract,
    	  		dataType: "json",
    	  		type: "POST",
    	  		success: function(data) {
    	  			showuser1();
    	  			switch(data) {
    	  				case 1:
    	  					sAlert("修改成功", "", "<%=basePath%>resources/images/ok.jpg");
    	  					break;
    	  				case -1: default:
    	  					sAlert("修改失败", "请重试", "<%=basePath%>resources/images/fail.jpg");
    	  					break;
    	  			}
    	  		},
    	  		error: function(data) {
    	  			sAlert("修改失败", data, "<%=basePath%>resources/images/fail.jpg");
    	  			
    	  		}
    	  	});
    	  	$('.modal').modal('hide');
      	}
	}
</script>	