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
<body><div class="text-center">
		<h2>登陆失败，请检查用户名和密码</h2>
		<a href="/os/admin/alogin.jsp">
			<button class="btn btn-primary">登陆</button>
		</a>
	</div>
</body>
</html>