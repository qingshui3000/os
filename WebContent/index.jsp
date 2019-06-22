<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page import="dao.impl.ProductDaoImpl"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	ProductDao pDao = new ProductDaoImpl();
	ArrayList<Product> list = pDao.getAll();
	request.setAttribute("list",list);
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
<style type="text/css">
	#myCarousel{
		margin-top:20px;
		margin-left:15px;
		margin-right:15px;
	}
</style>
</head>
<body>
	<div class="container-fulid">
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="image/0.jpg" alt="frist">
				</div>
				<div class="item">
					<img src="image/1.jpg" alt="second">
				</div>
				<div class="item">
					<img src="image/2.jpg" alt="threed">
				</div>
			</div>
			<!-- 轮播导航 -->
			<a class="carousel-control left" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control right" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div class="container-fluid">
			<div class="bg-info">
				<h3 class="text-danger">热卖商品</h3>
			</div>
			<c:forEach items="${list}" var="l">
				<td>
					<div class="col-md-2 text-center">
						<a href="detail.jsp?id=${l.id}">
							<img alt="${l.name}" class="img-responsive" src="image/imgs/${l.image}.jpg">
						</a>
						<a href="detail.jsp?id=${l.id}">${l.name}</a><br>
						<strong class="text-danger">￥${l.price}</strong>
					</div>
				</td>
			</c:forEach>
		</div>
	</div>
	<div class="">
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>