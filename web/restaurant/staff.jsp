<%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 2019/7/25
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Staff" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.text.SimpleAttributeSet" %>
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
                        <a href="/app/index.jsp">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <!-- 左侧显示列表部分 start-->
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
    <!-- 员工列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">员工管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">

                <div class="form-group">
                    <%--@declare id="coursename"--%>
                    <label for="courseName">员工编号</label>
                    <input type="text" class="form-control" id="id" value="" name="id" style="width: 200px ;height: 30px">
                    <input type="submit" id="xxs" class="btn btn-primary" value="查询" />
                </div>
                <table id="xs" class="table table-bordered table-striped" style="display: none">
                    <thead>
                    <tr>
                        <th class="sortTable">员工编号</th>
                        <th>姓名</th>
                        <th>联系方式</th>
                        <th>性别</th>
                        <th>职务</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
            </div>
        </div>

        <a href="course/list.action#" class="btn btn-primary" data-toggle="modal" data-target="#newPostDialog" onclick="clearPost()">招聘新员工</a>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align: center;font-size: 20px;font-weight: bold;text-align: center">员&ensp;工&ensp;信&ensp;息&ensp;列&ensp;表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>员工编号</th>
                            <th>姓名</th>
                            <th>联系方式</th>
                            <th>性别</th>
                            <th>职务</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <%
                            // 获取会员信息集合
                            List<Staff> list = (List<Staff>) request.getAttribute("list");
                            // 判断集合是否有效
                            if (list == null || list.size() < 1) {
                                out.print("<tr><td colspan='5'style='text-align: center;color: red;font-size: 20px;font-weight: bold;'>暂无员工！</td></tr>");
                                request.getRequestDispatcher("page.staff").forward(request, response);

                            } else {
                                // 遍历图书集合中的数据
                                for (Staff staff : list) {
                        %>
                        <tr align="center">
                            <td><%=staff.getId()%></td>
                            <td><%=staff.getsName()%></td>
                            <td><%=staff.getPhone()%></td>
                            <td><%=staff.getGender()%></td>
                            <td><%=staff.getPost()%></td>
                            <td>
                                <span  class="btn btn-primary btn-xs" data-toggle="modal" data-target="#courseEditDialog" >修改</span>
                                <input type="hidden"  value="<%=staff.getId()%>">
                                <input type="hidden"  value="<%=staff.getsName()%>">
                                <input type="hidden"  value="<%=staff.getPhone()%>">
                                <a  class="btn btn-danger btn-xs" href="del.staff?id=<%=staff.getId()%> ">删除</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                    <div class="col-md-12 text-right">
                        <nav><ul class="pagination"><li ><a href="page.staff?page=1">首页 </a>
                        </li><li ><a href="page.staff?page=${page-1}">上一页</a></li>
                            <li class="active"><a ><%=request.getAttribute("bar")%></a></li>
                            <li class=><a href="page.staff?page=${page+1}">下一页</a></li>
                            <li class=><a href="page.staff?page=${totalpages}">尾页</a></li></ul></nav></div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 员工列表查询部分  end-->
</div>
<!-- 创建员工信息模态框 -->
<div class="modal fade" id="newPostDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <p aria-hidden="true">×</p>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="add.staff" method="post" >
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            员工编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="员工编号" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="姓名" name="sName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            联系方式
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="联系方式" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <td><input type="radio" value="男" name="gender">男&ensp;&ensp;
                                <input type="radio" value="女" name="gender">女</td>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            职务
                        </label>
                        <div class="col-sm-10">
                            <td><select name="post">
                                <option>--请选择--</option>
                                <option>服务员</option>
                                <option>厨师</option>
                                <option>前台</option>
                                <option>总经理</option>
                            </select></td>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <input type="submit" class="btn btn-primary" value="保存添加">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 修改员工信息模态框 -->
<div class="modal fade" id="courseEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <p aria-hidden="true">×</p>
                </button>
                <h4 class="modal-title" id="myModal">修改员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="upd.staff" method="post" >
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            员工编号
                        </label>
                        <div class="col-sm-10">

                            <input type="text" class="form-control"  placeholder="员工编号" id="staff" name="staffid"  readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="姓名" id="staffname" name="sName" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            联系方式
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="联系方式" id="staffphone" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <td><input type="radio" value="男" name="gender">男&ensp;&ensp;
                                <input type="radio" value="女" name="gender">女</td>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            职务
                        </label>
                        <div class="col-sm-10">
                            <td><select name="post">
                                <option >--请选择--</option>
                                <option>服务员</option>
                                <option>厨师</option>
                                <option>前台</option>
                                <option>总经理</option>
                            </select></td>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <input type="submit" class="btn btn-primary" value="保存修改">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script type="text/javascript" src="style/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="style/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script type="text/javascript" src="style/js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script type="text/javascript" src="style/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="style/js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="style/js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    $(function(){
        // load();<script type="text/javascript">
            $("span").click(function () {
                var val=$(this).next().val();
                var name=$(this).next().next().val();
                var phone=$(this).next().next().next().val();
                $("#staff").val(val);
                $("#staffname").val(name);
                $("#staffphone").val(phone);
            });

        $("#xxs").click(function () {

            var id=$("#id").val();
            findByid(id);
        });

        $(".panel-heading").click(function(e){
            /*切换折叠指示图标*/
            $(this).find("span").toggleClass("fa-chevron-down");
            $(this).find("span").toggleClass("fa-chevron-up");
        });
    });
    //清空新建课程窗口中的数据
    function clearPost() {
        $("#new_courseName").val("");
        $("#new_lessoncost").val("");
        $("#new_total").val("");
        $("#new_remark").val("");
    }
    function findByid(id) {
        var url="find.staff";
        //为了去除缓存
        var args={"id":id};

        $.post(url,args,function(data){
            if(data==null){
                alert("查询员工不存在！")
            }
            //说明服务器返回的影响函数为大于1
            // var json=eval(data);//函数可计算某个字符串，并执行其中的的 JavaScript 代码。
            // alert(json)
            var str="";
            str+= "<tr>" + "<td>" + data.id + "</td>" + "<td>" + data.sName + "</td>" + "<td>"
                + data.phone + "</td>" + "<td>" + data.gender + "</td>" + "<td>" + data.post + "</td>" + "</tr>";
            $("#xs").show();
            $("#tbody").empty();
            $("#tbody").append(str);

        },"json");
        return false;
    }
</script>
</body>
</html>