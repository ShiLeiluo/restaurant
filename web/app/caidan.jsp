<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/23
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entity.Food" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>瑞莱斯特点餐平台</title>
    <link href="${pageContext.request.contextPath }/app/style/css/index.css" rel="stylesheet" type="text/css" />
</head>

<script src="${pageContext.request.contextPath}/app/style/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        addCai();
    });
    function addCai() {
        $("p").click(function () {
            var foodName=$(this).html();
            var foodPrice=$(this).next().html();
            var args={"foodName":foodName,"foodPrice":foodPrice};
            var url="${pageContext.request.contextPath}/add.do";
            $.post(url,args,function () {
                showAdd();
            });

        });
    }
    <%--function showAdd() {--%>
        <%--var url="${pageContext.request.contextPath}/orders.do";--%>
        <%--var args={"time":new Date()};--%>
        <%--var str="";--%>
        <%--$.get(url,args,function(data){--%>
            <%--var json=eval(data);--%>
            <%--$.each(json, function (index, obj) {--%>
                <%--str += "<tr>" + "<td>" + obj.foodName + "</td>" + "<td>" + obj.foodPrice + "</td>" + "</tr>";--%>
            <%--});--%>
            <%--$("#showAdd").empty();--%>
            <%--$("#showAdd").append(str);--%>
            <%--$("#showAdd").show();--%>
        <%--},"json");--%>
    <%--}--%>
</script>
<style type="text/css">
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
</style>
<body bgcolor="#a9a9a9" style="text-align: center">
<div id="all">
    <h2>您当前的桌号是：${sessionScope.get("tableid")}</h2>
    &nbsp;&nbsp;&nbsp;&nbsp;
    请点击菜名将您要的菜加入菜单！！！
    <div id="menu">
        <!-- 显示菜品的div -->
        <div id="top">
            <ul id="tbody" style="text-align: center;">
                    <%
                        List<Food> list = (List<Food>) request.getAttribute("list");
                        if (list == null || list.size() < 1) {
                            out.print("<tr><td colspan='5'>点击首页出信息！</td></tr>");
                        } else {
                            // 遍历图书集合中的数据
                            for (Food food : list) {
                    %>
                <li align="center">
                    <img style="width: 240px; height: 180px" src="<%=food.getImg()%>">
                    <p id="addCaiName" name="foodName"><%=food.getFoodName()%></p>
                    <span id="addCaiPrice" name="foodPrice"><%=food.getPrice()%></span>
                </li>
                    <%
                            }
                        }
                    %>
            </ul>
        </div>

        <!-- 底部分页导航条div -->
        <div id="foot">
            <div id="btn">
                <c:choose>
                    <c:when test="${requestScope.get('page')==1}">
                        首页&nbsp;
                        上一页
                    </c:when>
                    <c:otherwise>
                        <a href="page.do?page=1&tableid=${sessionScope.get("tableid")}"><input type="button" id="first" value="首页"></a>
                        <a href="page.do?page=${(page-1)}&tableid=${sessionScope.get("tableid")}"><input id="pre" type="button"value="上一页"></a>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${requestScope.get('page')==requestScope.get('totalpages')}">
                        末页&nbsp;
                        下一页
                    </c:when>
                    <c:otherwise>
                        <a href="page.do?page=${(page+1)}&tableid=${sessionScope.get("tableid")}"><input type="button" id="next" value="下一页"></a>
                        <a href="page.do?page=${totalpages}&tableid=${sessionScope.get("tableid")}"><input id="last" type="button"value="末页"></a>
                    </c:otherwise>
                </c:choose>

            </div>
            <%--<span style="float:right; line-height:53px; margin-right:10px; "><a href="#" style=" text-decoration:none;color:#000000; font-weight:bold">阿斯大四多</a></span>--%>
        </div>
    </div>
    <!-- 右边菜系列表，菜品搜索框  -->
            <ul style="align-content: center;">
                   <%--<font color="#8b0000">您点的菜单如下：</font>--%>
                <%--<table id="showAdd" style="padding-left: 20px" align="center">--%>

                <%--</table>--%>
                <a href="/app/jiezhang.jsp"><input class="a_demo_two" type="button" value="查看清单"></a>
            </ul>

</div>
</div>
</body>
</html>