<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/24
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
<script src="${pageContext.request.contextPath}/app/style/js/jquery-3.2.1.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        showTable();
    });
    function showTable() {
        var url="${pageContext.request.contextPath}/desk.do";
        var str="";
        $.get(url,function(data){
            // alert(data);
            var json=eval(data);
            $.each(json, function (index, obj) {
                str+="<li>"+"<a href=\"page.do?page=1&tableid="+obj.id+"\">"+"<img src=\"/app/style/css/img/table.gif\"/>"+"<span>"+obj.id+"</span>"+"</a>"+"</li>";
            });
            $("#desk").empty();
            $("#desk").append(str);
            $("#desk").show();
        },"json");
    }
</script>
<style type="text/css">
    #show{
        width:900px;
        height:477px;
    }
    #show ul li{
        list-style:none;
        float:left;
        width:200px;
        height:225px;
        margin-left:20px;
        margin-top:8px;
        text-align:center;
        padding-top:5px;
    }
</style>
<body bgcolor="#a9a9a9" style="text-align: center; background-image: url(${pageContext.request.contextPath}/app/style/images/lgback2.jpg)">
<div id="all">
        <p>当前空闲的桌子如下,请选择你要入座的位置:</p>
    <div id="show">
        <ul id="desk" style="align-content: center; display: none">
        </ul>
    </div>
</div>
</body>
</html>