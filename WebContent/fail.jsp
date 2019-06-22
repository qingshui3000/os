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
<script type="text/javascript">
	function info(){
		alert("用户名或密码错误，请重新登陆或注册！");	
	}
</script>
<style type="text/css">
	body{
		margin-top:200px;
	}
</style>
</head>
<body class="bg-info" onload="info()">
<div class="text-center container">
	<a href="/os/login.jsp">
		<button class="btn btn-primary">登陆</button>
	</a>
	<a href="/os/reg.jsp">
		<button class="btn btn-danger">注册</button>
	</a>
</div>
</body>
</html>