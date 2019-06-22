<%@page import="entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%
	ArrayList<Cart> list = new ArrayList<Cart>();
	list = (ArrayList<Cart>)session.getAttribute("clist");
	request.setAttribute("clist",list);
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
<title></title>
</head>
<body>
<%
	if(session.getAttribute("lname")!=null){
%>
	<table class="table table-hover">
		<tr>
			<th>商品名</th>
			<th>商品单价</th>
			<th>购买数量</th>
			<th>商品总价</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${clist}" var="cl">
		<tr>
			<td>${cl.pname }</td>
			<td>${cl.price }</td>
			<td>${cl.num }</td>
			<td>${cl.count }</td>
			<td></td>
		</tr>
		</c:forEach>
		
	</table>
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