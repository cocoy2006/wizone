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
            <th>监测点名称</th>
            <th>监测点id</th>
            <th>监测点分组</th>
            <th>检测点经纬度</th>
            <th>室内信号强度</th>
            <th>周边信号强度</th>
            <th>布置地点</th>
            <th>操作</th>
        </tr>
    </thead> 
    <tbody>
    <c:if test="${monindexs != null}">
    	<c:forEach var="monindex" items="${monindexs}">
    	<tr>
            <td>${monindex.monname }</td>
			<td>${monindex.monid }</td>
			<td><c:forEach var="group" items="${groupinfo}">
			<c:if test="${monindex.groupindex.groupid==group.groupid}">${group.groupname}</c:if></c:forEach></td>
			<td>${monindex.lng }, ${monindex.lat}</td>
			<td>${monindex.rssin }</td>
			<td>${monindex.rssout }</td>
			<td>${monindex.monAdd }</td>
			<td> <button class='btn btn-danger' onClick="openGroupModal('${monindex.monname }','${monindex.monid }','${monindex.lng }','${monindex.lat }','${monindex.rssin }','${monindex.rssout }','${group.groupname}','${monindex.monAdd}')" style="height:22px;width:40px;padding:0;margin:0;font-weight:bold"
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
					各监测点信息
				</h4>
			</div>
			<div class="modal-body">
				<form role="form">
				  <div class="form-group">
				    <label for="newmonname">监测点名称</label>
				    <input type="text" class="form-control" id="newmonname" value="" placeholder="请输入新的监测点名称">
				  </div>
				  <div class="form-group">
				    <label for="newmonid">检测点ID</label>
				    <input type="text" readonly class="form-control" id="newmonid" value="" placeholder="请输入新的检测点ID">
				  </div>
				  <div class="form-group">
				    <label for="newmongroup">所属小组</label>
				    <select class="form-control" id="newmongroup" placeholder="">
				    <option value="">请选择新的监测点小组名称</option>
				    <c:forEach var="group" items="${groupinfo}">
				    	<option value="${group.groupid}">${group.groupname}</option>
					</c:forEach>
				    </select>
				  </div>
				  <div class="form-group">
				    <label for="newmodel">监测点经度</label>
				    <input type="text" class="form-control" id="newlng" value="" placeholder="请输入新的监测点经度">
				  </div>
				  <div class="form-group">
				    <label for="newmodel">监测点纬度</label>
				    <input type="text" class="form-control" id="newlat" value="" placeholder="请输入新的监测点纬度">
				  </div>
				  <div class="form-group">
				    <label for="newmodel">室内信号强度</label>
				    <input type="text" class="form-control" id="newrssin" value="" placeholder="请输入新的室内信号强度">
				  </div>
				  <div class="form-group">
				    <label for="newmodel">周边信号强度</label>
				    <input type="text" class="form-control" id="newrssout" value="" placeholder="请输入新的周边信号强度">
				  </div>
				  <div class="form-group">
				    <label for="newaddress">布置地点</label>
				    <input type="text" class="form-control" id="newaddress" value="" placeholder="请输入新的布置地点">
				  </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button"  data-dismiss="modal">
					关闭
				</button>
				<button type="button"  onclick="updateMonindex()">
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
	
	function openGroupModal( monname,monid,lng,lat,rssin,rssout,groupname,monAdd) {
		$("#newmonid").val(monid);
		$("#newmonname").val(monname);
		$("#newlng").val(lng);
		$("#newlat").val(lat);
		$("#newrssin").val(rssin);
		$("#newrssout").val(rssout);
		$("#newmongroup").val(groupname);
		$("#newaddress").val(monAdd);
		$(".modal").modal();
	}
	
	
	function updateMonindex() {
		var reg = /\s/;
		var monid = $("#newmonid").val();
		var newname = $("#newmonname").val();
		var newgroup = $("#newmongroup").val();
		var newlng = $("#newlng").val();
		var newlat = $("#newlat").val();
		var newrssin = $("#newrssin").val();
		var newrssout=$("#newrssout").val();
		var newaddress=$("#newaddress").val();
		
		
		if (newname == "" || monid == "") {
	        sAlert("警告", "请核对输入是否有空值！", "<%=basePath%>resources/images/warn.jpg");
	        return false;
	    } else if (reg.test(newname) || reg.test(monid)) {
	        sAlert("警告", "请核对输入是否有空格！", "<%=basePath%>resources/images/warn.jpg");
	        return false;
	    } else {
	        $.ajax({
				url: "<%=basePath%>admin/netupdate/",
				data: "monid=" + monid + "&newname=" + newname + "&newgroup=" + newgroup+  "&newaddress=" + newaddress+"&newlng=" + newlng +"&newlat=" + newlat+"&newrssin=" + newrssin+"&newrssout=" + newrssout,
				dataType: "json",
				type: "POST",
				success: function(jsonObj) {
				shownet();
    	  			switch(jsonObj) {
    	  				case 1:
    	  					sAlert("修改监测点:" + newname + ",成功!", "您现在可以查看新的监测点信息了", "<%=basePath%>resources/images/ok.jpg");
    	  					break;
    	  				case -1: default:
    	  					sAlert("修改失败", "请核对输入信息！", "<%=basePath%>resources/images/fail.jpg");
    	  					break;
    	  			}
    	  		},
    	  		error: function(jsonObj) {
    	  			sAlert("修改失败", "请检查分组是否选择！", "<%=basePath%>resources/images/fail.jpg");
    	  			
    	  		}
					
			});
	        $('.modal').modal('hide');
	    }
	}
</script>
</script>	