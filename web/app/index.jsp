<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/23
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>瑞莱斯特点餐平台</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <style type="text/css">
        .total{
            -webkit-box-shadow: 0px 0px 15px #E3E3E3;
            box-shadow: 0px 0px 15px #E3E3E3;
            -o-box-shadow: 0px 0px 15px #E3E3E3;
            -moz-box-shadow: 0px 0px 15px #E3E3E3;
            background: #fff9ed;
            box-shadow: inset 0 1px 0 #ffe7b7,inset 0 0 340px 0 #ffe7b7;
        }
        body{
            font-family:'AmbleRegular';
            padding-bottom:10%;
            background:url("${pageContext.request.contextPath}/app/style/images/body-bg.png")no-repeat center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            background-position:center;
            background-size: 100% 100%;
        }

    </style>
</head>
<body>
<div class="wrap">
    <div class="total">
        <div class="header">
            <div class="header_top_right">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/app/login.jsp">登录</a></li>|
                    <li><a href="${pageContext.request.contextPath}/app/register.jsp">注册</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div align="center" style=" margin: auto">
    <div >
        <img width="1000px" src="${pageContext.request.contextPath}/app/style/images/welcome1.jpg">
    </div>
</div>

</body>
</html>