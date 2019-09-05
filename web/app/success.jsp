<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/16
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<style type="text/css">
    .login-box {
        padding: 30px;
        background: url(${pageContext.request.contextPath}/app/style/images/back.png);
        border-radius: 10px;
    }
    body{
        background-image: url(${pageContext.request.contextPath}/app/style/images/lgback1.jpg);
    }
    h1 {
        font-size: 30px;
        font-weight: 700;
        color: white;
        text-shadow: 0 1px 4px rgba(0,0,0,.2);
    }
    input[type=text], input[type=password] {
        width: 270px;
        height: 42px;
        margin-top: 25px;
        padding: 0px 15px;
        border: 1px solid rgba(255,255,255,.15);
        border-radius: 6px;
        color: #fff;
        letter-spacing: 2px;
        font-size: 16px;
        background: transparent;
    }
    button {
        cursor: pointer;
        width: 100%;
        height: 44px;
        padding: 0;
        background: #1D9CD1;
        border: 1px solid ;
        border-radius: 6px;
        font-weight: 700;
        color: #fff;
        font-size: 24px;
        letter-spacing: 15px;
        text-shadow: 0 1px 2px rgba(0,0,0,.1);
    }
</style>
<script src="${pageContext.request.contextPath}/app/style/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
    $(function () {
        alert("注册成功");
        window.location.href='${pageContext.request.contextPath }/app/login.jsp'
    });
</script>
<body>
<%--<div style="width: 600px;margin: 60px auto;">--%>
    <%--<div style="margin-left: 50px;margin-top: 200px">--%>
        <%--<div class="login-box" >--%>
            <%--<h1>注册成功</h1>--%>
            <%--<a href="${pageContext.request.contextPath}/app/login.jsp">返回登录</a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
</body>
</html>
