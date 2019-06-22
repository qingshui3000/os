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
<style type="text/css">
	.container{
		margin-top:50px;
	}
</style>
<script type="text/javascript">
	function check(){
		if(document.getElementById("account").value==""){
			alert("请输入用户名！");
			return false;
		}
		if(document.getElementById("password").value==""){
			alert("请输入密码！");
			return false;
		}
	}
</script>
</head>
<body class="bg-info">
<div class="container">
	<div>
		<form action="servlet/AdminServlet" method="post" role="form" class="col-md-4 col-md-offset-4" onsubmit="return check()">
			<h2 class="text-center">用户登录</h2>
			<div class="form-group">
				<input type="text" name="account" id="account" placeholder="请输入用户名" class="form-control ">
			</div>
			<div class="form-group">
				<input type="password" name="password" id="password" placeholder="请输入密码" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-primary col-md-offset-5" type="submit">登录</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>