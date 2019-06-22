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
<%
	if(session.getAttribute("aname")!=null){
%>
	<div class="text-center">
		<button class="btn btn-primary">1</button>
		<button class="btn btn-primary">2</button>
		<button class="btn btn-primary">3</button>
	</div>
<%
	}else{
%>
	<div class="container-fluid">
		<h1>您没有访问权限，请登陆！</h1>
	</div>
<%
	}
%>
</body>
</html>