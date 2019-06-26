<%@page import="entity.Order"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%
	request.setAttribute("olist",session.getAttribute("olist"));
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
	<div class="container-fluid">
		<table class="table table-hover pull-left">
				<tr>
					<th>订单编号</th>
					<th>商品数目</th>
					<th>订单金额</th>
					<th>备注</th>
					<th>订单时间</th>
					<th>订单状态</th>
				</tr>
				<c:forEach items="${olist}" var="ol">
					<tr>
						<td>${ol.no}</td>
						<td>${ol.tNum }</td>
						<td>${ol.tCount }</td>
						<td>${ol.remark }</td>
						<td>${ol.ctime }</td>
						<c:set var="statu" value="${ol.statu }"></c:set>
						<%
							Order o = new Order();
							o.setStatu(Integer.parseInt(pageContext.getAttribute("statu").toString()));
							o.setStatus();
							String status = o.getStatus();
							request.setAttribute("status",status);
						%>
						<td>
							${status}
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
</body>
</html>