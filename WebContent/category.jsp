<%@page import="dao.impl.ProductDaoImpl"%>
<%@page import="dao.ProductDao"%>
<%@page import="entity.Product"%>
<%@page import="dao.CategoryDao"%>
<%@page import="dao.impl.CategoryDaoImpl"%>
<%@page import="entity.Category"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	Category c = cDao.getById(cid);
	ProductDao pDao = new ProductDaoImpl();
	ArrayList<Product> list = new ArrayList<Product>();
	list = pDao.getAllByCid(cid);
	request.setAttribute("c",c);
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
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<h2>${c.name}</h2>
		<div class="">
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
	<div>
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>