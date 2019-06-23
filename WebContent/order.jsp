<%@page import="entity.Cart"%>
<%@page import="dao.impl.CartDaoImpl"%>
<%@page import="dao.CartDao"%>
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
<title>Insert title here</title>
</head>
<body>
<%
	if(session.getAttribute("lname")!=null){
%>
	<div>
		<h2 class="text-center">确认订单</h2>
		<table class="table table-hover pull-left">
			<tr>
				<th>商品名</th>
				<th class="col-md-5">图片</th>
				<th>商品单价</th>
				<th>购买数量</th>
				<th>商品总价</th>
			</tr>
			<c:forEach items="${clist}" var="cl">
				<tr>
					<td><a href="detail.jsp?id=${cl.pid}"> ${cl.pname } </a></td>
					<td>
						<div class="col-md-3">
							<a href="detail.jsp?id=${cl.pid}"> <img
								src="image/imgs/${cl.pimg}.jpg" class="img-responsive">
							</a>
						</div>

					</td>
					<td>${cl.price }</td>
					<td>${cl.num }</td>
					<td>${cl.count }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="text-center">
			<strong>总金额：<font class="text-danger">￥${total}</font></strong>
		</div>
		<form role="form" class="col-md-4 col-md-offset-8" action="servlet/">
			<div class="form-group">
				<input class="form-control" name="tel" placeholder="请输入您的手机号码">
			</div>
			<div class="form-group">
				<input class="form-control" name="remark" placeholder="请输入备注">
			</div>
			<div class="text-right">
				<button type="submit" class="btn btn-danger">确认提交</button>
			</div>
		</form>
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