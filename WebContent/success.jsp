<%@page import="entity.Order"%>
<%@page import="dao.impl.OrderDaoImpl"%>
<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%
	OrderDao oDao = new OrderDaoImpl();
	ArrayList<Order> olist = new ArrayList<Order>();
	int uid = Integer.parseInt(session.getAttribute("uid").toString());
	olist = oDao.getAll(uid);
	session.setAttribute("olist",olist);
%>
<!DOCTYPE html>
<html>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>添加成功,请查看订单!</h1>
	<a href="myorder.jsp">
		123
	</a>
</body>
</html>