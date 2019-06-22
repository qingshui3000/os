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
		if(document.getElementById("password2").value==""){
			alert("请确认密码！");
			return false;
		}
		if(document.getElementById("password").value!=document.getElementById("password2").value){
			alert("两次密码不一致，请检查输入！");
			return false;
		}
	}
</script>
</head>
<body class="bg-info">
<div class="container">
	<div>
		<form action="servlet/LoginServlet?action=in" method="post" role="form" class="col-md-4 col-md-offset-4 bg-info" onsubmit="check()">
			<h2 class="text-center">用户注册</h2>
			<div class="form-group">
				<input type="text" name="account" placeholder="请输入用户名" class="form-control" id="account">
			</div>
			<div class="form-group">
				<input type="password" name="password" placeholder="请输入密码" class="form-control" id="password">
			</div>
			<div class="form-group">
				<input type="password" name="password2" placeholder="请确认密码" class="form-control" id="password2">
			</div>
			<div class="form-group">
				<button class="btn btn-primary col-md-offset-5" type="submit">注册</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>