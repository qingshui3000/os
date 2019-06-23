<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	#main{
		background:#2D2D2D;
	}
</style>
</head>
<body>
<div class="text-info text-center" id="main">
    <p class="text-center">版权及相关说明</p>
    <div class="row">
        <!-- 部分：一 -->
        <div class="col-md-3">
            <p>一些链接</p>
            <div class="row">
                <div class="container-fluid">
                    <ul>
                        <li>
                        	<a href="https://getbootstrap.com/" target="_blank">本站所使用的前端框架</a>
                        </li>
                        <li>
                        	<a href="https://www.jd.com/" target="_blank">商品图片来源</a>
                        </li>
                        <li>
                        	<a href="https://github.com/qingshui3000/os" target="_blank">Github地址</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 部分：二 -->
        <div class="col-md-6">
            <p>本项目仅为学习练习项目，所有实例商品及图片均来自某购物网站。</p>
            <p>如有侵权请联系管理员删除。</p>
        </div>
        <!-- 部分：三 -->
        <div class="col-md-3">
            <ul>
                <li>
                	<a href="admin/alogin.jsp">管理员登陆</a>
                </li>
                <li>
                	<p>邮箱:zhao6582@qq.com</p>
                	<p>博客:</p>
                </li>
            </ul>
        </div>
    </div>

</div>
</body>
</html>