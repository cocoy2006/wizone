<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.wicloud.main.java.entity.Groupindex"%>
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
            <th>分组名称</th>
            <th>小组id</th>
            <th style="width:50px">操作</th>
        </tr>
    </thead> 
    <tbody>
    <c:if test="${uncs != null}">
    	<c:forEach var="unc" items="${uncs}">
    	<tr>
            <td>${unc.groupname }</td>
			<td>${unc.groupid }</td>
			<td>  
				<button class='btn btn-danger' onClick="openGroupModal('${unc.groupname}','${unc.groupid }')" style="height:22px;width:40px;padding:0;margin:0;font-weight:bold">修改</button>
			</td>
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
					我的分组信息
				</h4>
			</div>
			<div class="modal-body">
				<form role="form">
				  <div class="form-group">
				    <label for="newgroupname">分组名称</label>
				    <input type="text" class="form-control" id="newgroupname" value="" placeholder="请输入新的分组名称">
				  </div>
				  <input type="hidden" id="groupid" value="">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="updateGroupindex()">
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

	function openGroupModal( groupname, groupid) {
		$("#groupid").val(groupid);
		$("#newgroupname").val(groupname);
		$(".modal").modal();
	}
	
	function updateGroupindex() {
		var reg = /\s/;
		var groupid = $("#groupid").val();
		var groupname = $("#newgroupname").val();
		if (groupname == "" ) {
	        sAlert("警告", "请核对输入是否有空值！", "<%=basePath%>resources/images/warn.jpg");
	        return false;
	    } else if (reg.test(groupname)) {
	        sAlert("警告", "请核对输入是否有空格！", "<%=basePath%>resources/images/warn.jpg");
	        return false;
	    } else {
	        $.ajax({
				url: "<%=basePath%>admin/updategroup/",
				data: "groupid=" + groupid + "&groupname=" + groupname ,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
				showgroup();

    	  			switch(jsonObj) {
    	  				case 1:
    	  					sAlert("修改分组名称:" + groupname + ",成功!", "您现在可以查看新的分组信息了", "<%=basePath%>resources/images/ok.jpg");
    	  					break;
    	  				case -1: default:
    	  					sAlert("修改失败", "请核对输入信息！", "<%=basePath%>resources/images/fail.jpg");
    	  					break;
    	  			}
    	  		},
    	  		error: function(jsonObj) {
    	  			sAlert("修改失败", jsonObj, "<%=basePath%>resources/images/fail.jpg");
    	  			
    	  		}
					
			});
	        $('.modal').modal('hide');
	    }
	}
</script>