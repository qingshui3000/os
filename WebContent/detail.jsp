<%@page import="entity.Param"%>
<%@page import="dao.impl.ParamDaoImpl"%>
<%@page import="dao.ParamDao"%>
<%@page import="dao.impl.ProductDaoImpl"%>
<%@page import="dao.ProductDao"%>
<%@page import="entity.Product"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="nav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	ProductDao pDao = new ProductDaoImpl();
	int id = Integer.valueOf(request.getParameter("id"));
	Product p = pDao.getItemById(id);
	request.setAttribute("p",p);
	
	ParamDao pmDao = new ParamDaoImpl();
	Param pm = pmDao.getParamById(id);
	request.setAttribute("pm",pm);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#btnadd").click(function(){
			var num = parseInt(document.getElementById("number").value);
			if(num<100){
				document.getElementById("number").value=++num;
			}
		});
		$("#btnsub").click(function(){
			var num = parseInt(document.getElementById("number").value);
			if(num>1){
				document.getElementById("number").value=--num;
			}
		});
	})
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-5">
			<img src="image/imgs/${p.image}.jpg" alt="${p.name}" class="img-responsive"/>
		</div>
		<div class="text-center col-md-offset-6">
			<div>
				<h4>${p.name}</h4>
				<hr>
			</div>
			<div>
				<h4><strong class="text-danger">会员价：￥${p.price}</strong></h4>
				<form action="" method="post" role="form">
					<div class="form-group">
						<label>购买数量</label>
						<button type="button" id="btnsub" class="btn btn-default btn-xs">-</button>
						<input type="text" name="number" id="number" value="1" size="2">
						<button type="button" id="btnadd" class="btn btn-default btn-xs">+</button>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
						<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-th"></span>查看购物车</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		String list = "";
		//获取cookie
		Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0){
			for(Cookie c:cookies){
				if(c.getName().equals("ListViewCookie")){
					list = c.getValue();
				}
			}
		}
		
		list+=request.getParameter("id")+"#";
		//控制数量
		String[] arr = list.split("#");
		if(arr!=null&&arr.length>0){
			if(arr.length>=1000){
				list="";
			}
		}
		Cookie cookie = new Cookie("ListViewCookie",list);
		response.addCookie(cookie);
		ArrayList<Product> itemlist = pDao.getViewList(list);
		if(itemlist!=null&&itemlist.size()>0){
			request.setAttribute("hlist",itemlist);
		}
	%>
	<div class="container-fluid col-md-3">
		<div class="bg-warning row">
			<h4>
				历史足迹&nbsp;&nbsp; <small>浏览记录</small>
			</h4>
		</div>
		<div class="col-md-9 row">
		<c:forEach items="${hlist}" var="l">
			<td class="pull-left">
				<div class="text-center">
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
	<div class="col-md-9">
		<h1>详情区</h1>
		<div>
			<img src="image/descimg/${pm.img1}.jpg">	
		</div>
		<div>
			<img src="image/descimg/${pm.img2}.jpg">
		</div>
	</div>
</body>
</html>