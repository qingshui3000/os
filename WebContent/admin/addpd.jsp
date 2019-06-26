<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.impl.CategoryDaoImpl"%>
<%@page import="dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	function check(){
		if(document.getElementById("account").value==""){
			alert("请输入用户名！");
			return false;
		}
		if(document.getElementById("password").value==""){
			alert("请输入密码！");
			return false;
		}
	}
</script>
</head>
<body>
<%
	if(session.getAttribute("aname")!=null){
%>
	<div class="container-fluid">
		<jsp:include page="left.jsp"></jsp:include>
		<div>
			<form action="servlet/ProductServlet?action=add" role="form" class="col-md-4 col-md-offset-2" onsubmit="return check()" enctype="multipart/form-data">
				<h2 class="text-center">添加商品</h2>
				<div class="form-group">
					<input type="text" name="name" id="name" placeholder="请输入商品名"
						class="form-control ">
				</div>
				<div class="form-group">
					<input type="text" name="price" id="price" placeholder="请设定价格" class="form-control">
				</div>
				<div class="form-group">
					<label>上传商品主图</label>
					<input type="file" name="image" id="image">
				</div>
				<div class="form-group col-md-6">
					<label for="cate">选择列表</label>
    				<select class="form-control" name="cate">
    				<c:forEach items="${clist}" var="cl">
					    <option>${cl.name}</option>
					</c:forEach>
   					</select>
				</div>
				<div class="form-group col-md-6">
					<label>设定为热门商品?</label>
					<select class="form-control" name="hot">
					    <option>是</option>
					    <option>否</option>
   					</select>
				</div>
				<div class="form-group">
					<button class="btn btn-primary col-md-offset-5" type="submit">添加</button>
				</div>
			</form>
		</div>
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