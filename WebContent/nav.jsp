<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.impl.CategoryDaoImpl"%>
<%@page import="dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CategoryDao cDao = new CategoryDaoImpl();
	ArrayList<Category> clist = cDao.getAll();
	request.setAttribute("clist",clist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#nav{
		margin-top:50px;
		margin-bottom:0px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".dropdown").mouseover(function(){
			$(this).addClass("open");
		});
		$(".dropdown").mouseleave(function(){
			$(this).removeClass("open");
		});
	})
	function check_search(){
		if(doucment.getElementById("str").value==null){
			alert("请输入关键字！");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- 头部 -->
		<div style="background:#ffcc33;" id="header">
			<div class="container-fluid">
				<h1>Java Web在线商城</h1>
			</div>
			<!-- 根据登录状态变换 -->
			<div class="pull-right">
				<%
					if(session.getAttribute("lname")!=null){
				%>
				<strong class="text-info">欢迎，<%=session.getAttribute("lname") %></strong>
				<a class="btn btn-outline-success" href="servlet/LoginServlet?action=out"><strong>退出</strong></a>
				<%
					}else{
				%>
				<a class="btn btn-outline-success" href="login.jsp"><strong>登录</strong></a>
				<a class="btn btn-outline-success text-danger" href="reg.jsp"><strong>免费注册</strong></a>
				<%
					}
				%>
			</div>
			<!-- 导航栏 -->
			<nav class="navbar navbar-inverse" role="navigation" id="nav">
				<div class="contain-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span>商城首页</a>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<span class="glyphicon glyphicon-th-list"></span>分类
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
								<c:forEach items="${clist}" var="l">
									<li><a href="category.jsp?cid=${l.id}">${l.name}</a></li>
									<li class="divider"></li>
								</c:forEach>
								</ul>
							</li>
						</ul>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li>
								<a class="" href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a>
							</li>
						</ul>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li>
								<a href="myorder.jsp"><span class="glyphicon glyphicon-briefcase"></span>我的订单</a>
							</li>
						</ul>
					</div>
					<form class="navbar-form navbar-right" role="search" action="servlet/ProductServlet?action=search" method="post" onsubmit="return check_search()">
						<div class="form-group">
							<input type="text" class="form-control" name="str" id="str" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-inverse">搜索</button>
					</form>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>