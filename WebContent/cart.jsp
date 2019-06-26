<%@page import="dao.impl.CartDaoImpl"%>
<%@page import="dao.CartDao"%>
<%@page import="entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%
	if(session.getAttribute("lname")!=null){
		int uid = Integer.parseInt(session.getAttribute("uid").toString());
		CartDao cartDao = new CartDaoImpl();
		double total = cartDao.getTotalCount(uid);
		request.setAttribute("total",total);
		if(session.getAttribute("clist")==null){
			ArrayList<Cart> list = cartDao.getAll(uid);
			session.setAttribute("clist",list);
		}
		ArrayList<Cart> list = new ArrayList<Cart>();
		list = (ArrayList<Cart>)session.getAttribute("clist");
		request.setAttribute("clist",list);
	}
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
<div class="container-fluid">
	<table class="table table-hover pull-left">
		<tr>
			<th>商品名</th>
			<th class="col-md-5">图片</th>
			<th>商品单价</th>
			<th>购买数量</th>
			<th>商品总价</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${clist}" var="cl">
		<tr>
			<td>
				<a href="detail.jsp?id=${cl.pid}">
					${cl.pname }
				</a>
			</td>
			<td>
				<div class="col-md-3">
					<a href="detail.jsp?id=${cl.pid}">
						<img src="image/imgs/${cl.pimg}.jpg" class="img-responsive">
					</a>
				</div>
				
			</td>
			<td>${cl.price }</td>
			<td>${cl.num }</td>
			<td>${cl.count }</td>
			<td>
				<a>
					<button class="btn btn-primary">修改</button>
				</a>
				<a>
					<button class="btn btn-danger">删除</button>
				</a>
			</td>
		</tr>
		</c:forEach>
	</table>
<%
	if(session.getAttribute("clist")!=null){
%>
	<div class="text-center">
		<strong>总金额：<font class="text-danger">￥0.0</font></strong>
	</div>
	<div class="text-right">
		<a href="order.jsp">
			<button class="btn btn-danger">提交订单</button>
		</a>
	</div>
<%
	}
%>
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