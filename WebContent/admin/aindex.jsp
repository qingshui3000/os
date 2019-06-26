<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	<div class="container-fluid">
		<jsp:include page="left.jsp"></jsp:include>
		<h2>欢迎，<%=session.getAttribute("aname") %></h2>
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