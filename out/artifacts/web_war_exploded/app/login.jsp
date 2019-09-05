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
       $("#logname").blur(function () {
           if ($(this).val().trim()==""){
               $("#lgspan").html("用户名不能为空!");
               $("#button").attr("disabled",true);
           }else {
               $("#lgspan").html("");
               $("#button").attr("disabled",false);
           }
       });
       $("#password").blur(function () {
          if ($(this).val().trim()==""){
              $("#pdspan").html("密码不能为空！");
              $("#button").attr("disabled",true);
          }else {
              $("#pdspan").html("");
              $("#button").attr("disabled",false);
          }
       });
        $("#code").blur(function () {
            if ($(this).val().trim()==""){
                $("#button").attr("disabled",true);
            }else {
                $("#button").attr("disabled",false);
            }
        });
    });
    function changeCode(){
        //得到图片元素
        var img = document.getElementsByTagName("img")[0];
        img.src = "code?time="+new Date().getTime();
    }
</script>
<body>
<div style="width: 600px;margin: 60px auto;">
    <div style="margin-left: 50px;margin-top: 200px">
        <div class="login-box" >

        <form action="login.do" method="post">
            <h1 style="color: #38D5FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瑞莱斯特餐饮店登录</h1>
            <%
                String msg = (String)request.getAttribute("msg");
                if(msg!=null){
            %>
            <span style="color: #FF6B68;">${requestScope.get("msg")}</span>
            <%
                 }
            %>
            <span id="buspan" style="color: #FF6B68;">${requestScope.get("buspan")}</span>
            <p><font color="white">用户名：</font><input type="text" name="logname" placeholder="请输入用户名" id="logname"><span id="lgspan" style="color: #FF6B68;"></span></p>
            <p>&nbsp;<font color="white">密码：</font>&nbsp;&nbsp;<input type="password" name="password" placeholder="请输入密码" id="password"><span id="pdspan" style="color: #FF6B68;"></span></p>
            <font color="white">验证码：</font><input type="text" name="code" id="code"/>
            <img style="height: 25px" src="code" onclick="changeCode()"/><a href="javascript:changeCode()" style="color: navajowhite">换一张</a><br>
            <p> <font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <input type="radio" name="role" value="0">管理员
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <input type="radio" name="role" value="1">会员
            </font></p>
            <p style="margin-left: 40px">
                <button type="submit" tabindex="5" id="button" disabled="disabled">登录</button></p>
        </form>
        </div>
    </div>
</div>
</body>
</html>
