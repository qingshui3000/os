<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="col-md-2">
	<div class="list-group col-lg-8">
		<button class="list-group-item" data-toggle="collapse"
			data-target="#item1">
			<p class="text-primary">商品管理</p>
		</button>
		<div id="item1" class="list-group collapse">
			<a href="admin/addpd.jsp" class="list-group-item"><small class="">添加商品</small></a>
			<a href="#" class="list-group-item"><small>修改商品</small></a>
		</div>
		<button class="list-group-item" data-toggle="collapse"
			data-target="#item2">
			<p class="text-primary">订单管理</p>
		</button>
		<div id="item2" class="list-group collapse">
			<a href="#" class="list-group-item"><small class="">订单处理</small></a>
		</div>
		<button class="list-group-item" data-toggle="collapse"
			data-target="#item3">
			<p class="text-primary">个人中心</p>
		</button>
		<div id="item3" class="list-group collapse">
			<a href="#" class="list-group-item"><small>修改密码</small></a>
		</div>
		<a href="/os/index.jsp" class="list-group-item" id="out">退出系统</a>
	</div>
</div>
</body>
</html>