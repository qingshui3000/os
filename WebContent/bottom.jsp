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
		background:black;
	}
</style>
</head>
<body>
<div class="" id="main">
    <p>这里是底部信息的标题</p>
    <div class="row">
        <!-- 部分：一 -->
        <div class="col-md-3">
            <p>部分：一</p>
            <div class="row">
                <div class="col-md-6">
                    <ul>
                        <li>部分：一内容</li>
                        <li>部分：一内容</li>
                        <li>部分：一内容</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul>
                        <li>部分：一内容</li>
                        <li>部分：一内容</li>
                        <li>部分：一内容</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 部分：二 -->
        <div class="col-md-6">
            <p>部分：二</p>
            <ul>
                <li>部分：二内容</li>
                <li>部分：二内容</li>
                <li>部分：二内容</li>
                <li>部分：二内容</li>
                <li>部分：二内容</li>
                <li>部分：二内容</li>
            </ul>
        </div>
        <!-- 部分：三 -->
        <div class="col-md-3">
            <ul>
                <li>
                	<a href="admin/alogin.jsp">管理员登陆</a>
                </li>
                <li>部分：三内容</li>
                <li>部分：三内容</li>
                <li>部分：三内容</li>
                <li>部分：三内容</li>
                <li>部分：三内容</li>
            </ul>
        </div>
    </div>

</div>
</body>
</html>