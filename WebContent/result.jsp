<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
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
	<div>
		<div class="bg-info">
			<h3 class="text-danger">搜索结果</h3>
		</div>
		<c:forEach items="${result}" var="l">
			<td>
				<div class="col-md-2 text-center">
					<a href="detail.jsp?id=${l.id}"> <img alt="${l.name}"
						class="img-responsive" src="image/imgs/${l.image}.jpg">
					</a> <a href="detail.jsp?id=${l.id}">${l.name}</a><br> <strong
						class="text-danger">￥${l.price}</strong>
				</div>
			</td>
		</c:forEach>
	</div>
</body>
</html>