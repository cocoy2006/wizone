<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.wicloud.main.java.entity.Userinfo"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Userinfo user = (Userinfo) session.getAttribute("user");
	String userName = user.getUserName();

	if (user == null) {
		response.sendRedirect(basePath.concat("index"));
	}
%>

<!DOCTYPE HTML>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<br/>
<table class="table table-striped table-bordered dataTable" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>权限</th>
            <th>联系方式 </th>
            <th style="width:70px">操作</th>
        </tr>
    </thead> 
    <tbody>
    <c:if test="${users != null}">
    	<c:forEach var="user" items="${users}">
    	<tr>
            <td>${user.userName }</td>
			<td>${user.passwd }</td>
			<td>${user.userType }</td>
			<td>${user.contract }</td>
			<td><button  class='btn btn-danger' onClick="openGroupModal('${user.userName}','${user.passwd }','${user.passwd }','${user.contract}')" style="height:22px;width:40px;padding:0;margin:0;font-weight:bold"
			 >修改</button></td>
        </tr>
    	</c:forEach>
    </c:if>
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
					用户信息修改
				</h4>
			</div>
			<div class="modal-body">
				<form role="form">
				  <div class="form-group">
				    <label for="newpassword">用户名</label>
				    <input readonly class="form-control" id="newusername" value="" placeholder="请输入新的用户名">
				  </div>
				   <div  class="form-group">
				    <label  for="newpassword">新密码</label>
				    <input  class="form-control" id="newpassword" value="" placeholder="请输入新的密码">
				  </div>
				  <div  class="form-group">
				    <label  for="newpassword1">确认密码</label>
				    <input  class="form-control" id="newpassword1" value="" placeholder="请输入新的确认密码">
				  </div>
				  <div class="form-group">
				    <label for="newcontact">联系方式</label>
				    <input type="text" class="form-control" id="newcontact" value="" placeholder="请输入新的联系方式">
				  </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button"  data-dismiss="modal">
					关闭
				</button>
				<button type="button" onclick="updateUser()">
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
	
	function openGroupModal( userName, userpasswd,userpasswd1,contract) {
		$("#newusername").val(userName);
		$("#newuserpassword").val(userpasswd);
		$("#newuserpassword1").val(userpasswd1);
		$("#newcontact").val(contract);
		$(".modal").modal();
	}

	function updateUser() {
		var username = $("#newusername").val();
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
    	  		url: "<%=basePath%>admin/update/",
    	  		data: "oldname="+username+"&newpasswd="+passwd+"&newcontact="+contract,
    	  		dataType: "json",
    	  		type: "POST",
    	  		success: function(data) {
    	  			showuser();
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
