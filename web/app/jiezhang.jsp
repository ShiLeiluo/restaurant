<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/25
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">
<script src="${pageContext.request.contextPath}/app/style/js/jquery-3.2.1.js" type="text/javascript"></script>
<script type="text/javascript">
    // alert('尊敬的顾客,您好!已经通知服务员结账，请稍等!');
    $(function () {
        var url="${pageContext.request.contextPath}/sum.do";
        $.post(url,function (data) {
            var json=eval(data);
            $("#price").html(json);
            showAdd();
        });
    });

    function upddesk() {
        var url="${pageContext.request.contextPath}/upddesk.do";
        $.post(url,function () {
            alert('尊敬的顾客,您好!已经通知服务员结账，请稍等!');
            del();
        });
    }
    function del() {
        var url="${pageContext.request.contextPath}/del.do";
        $.post(url,function () {
            window.location.href='${pageContext.request.contextPath }/app/index.jsp'
        });
    }
    function showAdd() {
        var url="${pageContext.request.contextPath}/orders.do";
        var args={"time":new Date()};
        var str="";
        $.get(url,args,function(data){
            var json=eval(data);
            $.each(json, function (index, obj) {
                str += "<tr>" + "<td>" + obj.foodName + "</td>" + "<td>" + obj.foodPrice + "</td>" + "</tr>";
            });
            $("#showAdd").empty();
            $("#showAdd").append(str);
            $("#showAdd").show();
        },"json");
    }
</script>
<style type="text/css">
    body{
        background-image: url("/app/style/images/lgback3.jpg");
    }
    .a_demo_two {
        background-color:#6fba26;
        padding:10px;
        position:relative;
        font-family: 'Open Sans', sans-serif;
        font-size:12px;
        text-decoration:none;
        color:#fff;
        background-image: linear-gradient(bottom, rgb(100,170,30) 0%, rgb(129,212,51) 100%);
        box-shadow: inset 0px 1px 0px #b2f17f, 0px 6px 0px #3d6f0d;
        border-radius: 5px;
    }

    .a_demo_two:active {
        top:7px;
        background-image: linear-gradient(bottom, rgb(100,170,30) 100%, rgb(129,212,51) 0%);
        box-shadow: inset 0px 1px 0px #b2f17f, inset 0px -1px 0px #3d6f0d;
        color: #156785;
        text-shadow: 0px 1px 1px rgba(255,255,255,0.3);
        background: rgb(44,160,202);
    }
    .a_demo_two::before {
        background-color:#072239;
        content:"";
        display:block;
        position:absolute;
        width:100%;
        height:100%;
        padding-left:2px;
        padding-right:2px;
        padding-bottom:4px;
        left:-2px;
        top:5px;
        z-index:-1;
        border-radius: 6px;
        box-shadow: 0px 1px 0px #fff;
    }

    .a_demo_two:active::before {
        top:-2px;
    }
    table
    {
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
    }
    table td, table th
    {
        border: 1px solid #cad9ea;
        color: #666;
        height: 30px;
    }
    table thead th
    {
        background-color: #CCE8EB;
        width: 100px;
    }
    table tr:nth-child(odd)
    {
        background: #fff;
    }
    table tr:nth-child(even)
    {
        background: #F5FAFA;
    }
</style>
<body  style="text-align: center">
<a href="${pageContext.request.contextPath}/app/page.do?page=1&tableid=${sessionScope.get("tableid")}" style="float: left"><input class="a_demo_two" type="button" value="返回"></a>
<div id="all">
    <h1>您点的菜单如下：</h1>
    <div id="menu">
        <!-- 餐车div -->
        <div id="count">
            <div class="cartMain_hd">
                <table  align="center" width="100%" border="1" cellspacing="0">
                    <tr height="40">
                        <td align="center" class="list_con" width="20%">菜名</td>
                        <td align="center" class="list_info" width="20%">单价</td>
                    </tr>
                    <tbody id="showAdd" style="padding-left: 20px" align="center">
                    </tbody>
                    <tr>
                        <td colspan="6" align="right">总计:
                            <span style="font-size:36px;">&yen;</span>
                            <span id="price"></span>
                            <input class="a_demo_two" type="button" value="结账" onclick="upddesk()">
                        </td>
                    </tr>

                </table>

            </div>
            <%--<table align="center" width="100%">--%>
                <%--<tr height="40">--%>
                    <%--<td align="center" width="20%">菜名</td>--%>
                    <%--<td align="center" width="20%">单价</td>--%>
                <%--</tr>--%>
                <%--<tbody id="showAdd" style="padding-left: 20px" align="center">--%>
                <%--</tbody>--%>
                <%--<tr>--%>
                    <%--<td colspan="6" align="right">总计:--%>
                        <%--<span style="font-size:36px;">&yen;</span>--%>
                        <%--<span id="price"></span>--%>
                        <%--<input type="button" value="结账" onclick="upddesk()">--%>
                    <%--</td>--%>
                <%--</tr>--%>

            <%--</table>--%>
        </div>
    </div>

<%--<div id="all">--%>
    <%--<div id="menu">--%>
        <%--<!-- 显示菜品的div -->--%>
        <%--<div id="top">--%>
            <%--<font color="#8b0000">您点的菜单如下：</font>--%>
            <%--<table id="showAdd" style="padding-left: 20px" align="center">--%>

            <%--</table>--%>
            <%--您的消费总额为：<%=session.getAttribute("sum")%>--%>
            <%--<input type="button" value="结账" onclick="jiezhang()">--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
</div>
</body>
</html>
