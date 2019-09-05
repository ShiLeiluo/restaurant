<%@ page import="entity.Member" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/23
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>瑞莱斯特后台管理系统（S-M-M） v2.0</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="style/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="style/css/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="style/css/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="style/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="style/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="style/css/boot-crm.css" rel="stylesheet" type="text/css">
    <style>

        .panel-heading{background-color: #337ab7;border-color: #2e6da4;font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
        .panel-heading span{position:absolute;right:10px;top:12px;}


    </style>
    <script src="style/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="style/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="style/js/metisMenu.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="style/js/jquery.dataTables.min.js"></script>
    <script src="style/js/dataTables.bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="style/js/sb-admin-2.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".panel-heading").click(function(e){
                /*切换折叠指示图标*/
                $(this).find("span").toggleClass("fa-chevron-down");
                $(this).find("span").toggleClass("fa-chevron-up");
            });
        });
    </script>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">瑞莱斯特后台管理系统（S-M-M） v2.0</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">


            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">

                    <li>
                        <a href="/app/index.jsp">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul> <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <!-- 咨询管理  折叠的分组列表 -->
                <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab">
                    <h4 class="panel-title">
                        瑞莱斯特后台管理 <span class="fa fa-chevron-up right"></span>
                    </h4>
                </div>
                <div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="member.jsp">
                                <i class="fa fa-paste fa-fw"></i> 会员管理
                            </a></li>

                        <li class="list-group-item">
                            <a href="staff.jsp">
                                <i class="fa fa-lightbulb-o fa-fw"></i> 员工管理
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="menu.jsp">
                                <i class="fa fa-paste fa-fw"></i> 菜单管理
                            </a></li>
                    </ul>
                </div>

            </div>
        </div><!-- 左侧显示列表部分 end-->
    </nav>
</div>
</body></html>
