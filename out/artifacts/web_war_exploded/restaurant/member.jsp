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
    <!-- 课程列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">会员管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">

                    <div class="form-group">
                        <%--@declare id="coursename"--%><label for="courseName">会员身份证号</label>
                        <input type="text" class="form-control" id="id" value="" name="id" style="width: 200px ;height: 30px">

                            <input type="submit" id="xxs" class="btn btn-primary" value="查询" />
                    </div>


                <table id="xs" class="table table-bordered table-striped" style="display: none">
                    <thead>
                    <tr>
                        <th>身份证号</th>
                        <th>姓名</th>
                        <th>号码</th>
                        <th>性别</th>
                    <tbody id="tbody1">
                    </tbody>
                    </tr>
                    </thead>

                </table>



            </div>
        </div>
        <%--<a  class="btn btn-primary" data-toggle="modal" data-target="#newPostDialog" >添加新会员</a>--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">会员信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>身份证号</th>
                            <th>姓名</th>
                            <th>号码</th>
                            <th>性别</th>
                            <th>操作</th>

                        </tr>
                        </thead>
                        <tbody id="tbody">
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                      <ul class="pagination">
                          <li id="pageFirst"><a>首页 </a></li>
                          <li id="pageload"><a>上一页 </a></li>
                          <li class="active"><a id="currentPage"></a></li>
                          <li id="pageNext"><a>下一页</a></li>
                          <li id="pagelast"><a>尾页</a></li>


                      </ul>

                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 课程列表查询部分  end-->
</div>
<!-- 创建会员模态框 -->
<div class="modal fade" id="newPostDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <a aria-hidden="true">×</a>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建会员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  method="post" onsubmit="return add(this)">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            身份证号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="身份证号" name="id" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="姓名" name="memberName">
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
                        <label  class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <td><input type="radio"   name="gender" value="男" />男 <input
                                    type="radio"   name="gender" value="女" />女</td>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset"  class="btn btn-default" value="重置" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <input type="submit" class="btn btn-primary" value="保存添加">

                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- 修改会员模态框 -->

<div class="modal fade" id="courseEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModal">修改课程信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  method="post"  onsubmit="return upd(this)">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            身份证号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="身份证号" name="id" id="memberId" value="" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  placeholder="姓名" name="memberName">
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
                        <label  class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <td><input type="radio"    name="gender" value="男" />男 <input
                                    type="radio"    name="gender" value="女" />女</td>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset"  class="btn btn-default" value="重置" />

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
<!-- 编写js代码 -->
<script type="text/javascript">
    $(function(){

        load();
        // $("span").click(function ( ) {
        //     var val=$(this).next().val();
        //     alert(val);
        //     $("#memberId").val(val);
        // });
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

    function edit(obj) {
        var id =$(obj).next().val();
        $("#memberId").val(id);
    }
    //清空新建课程窗口中的数据

    function load() {
        var url="list.member";
        var args={"time":new Date()};
        $.get(url,args,function (data) {
            var  json=eval(data);
            var str="";
             currentPage=1;
           var totalPage=0;
            $.each(json,function (index,obj) {
                totalPage++;
                // str+= "<tr>" + "<td>" + obj.id + "</td>" + "<td>" + obj.memberName + "</td>" + "<td>"
                //     + obj.phone + "</td>" + "<td>" + obj.gender + "</td>" +"</tr>";
                if (totalPage>((currentPage-1)*5) && totalPage<=currentPage*5 ){
                    str+= "<tr>" + "<td>" + obj.id + "</td>" + "<td>" + obj.memberName + "</td>" + "<td>"
                        + obj.phone + "</td>" + "<td>" + obj.gender + "</td>" +

                        "<td><a href=\"javascript:void(0);\" class=\'btn btn-danger btn-xs\' onclick='doDel("
                        + obj.id + ",this)'>删除</a>"+ "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+
                        "<span  class='btn btn-primary btn-xs' data-toggle='modal' data-target='#courseEditDialog' onclick='edit(this)' >修改</span>"+
                        "<input type='hidden'  value="+obj.id+ ">"
                        +"</td>"
                        + "</tr>";
                }
            });
            $("#pageNext").click(function () {
                currentPage++;
                if(currentPage>(Math.ceil(totalPage/5))){
                     currentPage=Math.ceil(totalPage/5);
                }
                showpage();
            });
            $("#pageload").click(function () {
                 currentPage--;
                if(currentPage<1){
                    currentPage=1
                }

                showpage();
            });
            $("#pagelast").click(function () {
                currentPage=Math.ceil(totalPage/5);
                showpage();
            });
            $("#pageFirst").click(function () {
                currentPage=1;
               showpage();
            });
            $("#currentPage").html(currentPage);
            $("#tbody").empty();
            $("#tbody").append(str);

        },"json")

    }
    function showpage() {
        var url="list.member";
        var args={"time":new Date()};
        $.get(url,args,function (data) {
            var  json=eval(data);
            var str="";
            var totalPage=0;
            $.each(json,function (index,obj) {
                totalPage++;
                // str+= "<tr>" + "<td>" + obj.id + "</td>" + "<td>" + obj.memberName + "</td>" + "<td>"
                //     + obj.phone + "</td>" + "<td>" + obj.gender + "</td>" +"</tr>";
                if (totalPage>((currentPage-1)*5) && totalPage<=currentPage*5 ){
                    str+= "<tr>" + "<td>" + obj.id + "</td>" + "<td>" + obj.memberName + "</td>" + "<td>"
                        + obj.phone + "</td>" + "<td>" + obj.gender + "</td>" +

                        "<td><a href=\"javascript:void(0);\" class=\'btn btn-danger btn-xs\' onclick='doDel("
                        + obj.id + ",this)'>删除</a>"+ "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+
                        "<span  class='btn btn-primary btn-xs' data-toggle='modal' data-target='#courseEditDialog' onclick='edit(this)' >修改</span>"+
                        "<input type='hidden'  value="+obj.id+ ">"
                        +"</td>"
                        + "</tr>";
                }
            });
            $("#currentPage").html(currentPage);
            $("#tbody").empty();
            $("#tbody").append(str);

        },"json")

    }

    //添加
    function add(form) {
        $.ajax({
            url:"add.member",
            type:"POST",
            data:$(form).serialize(),
            dataType:"json",
            success:function (data) {

                if(data>0){
                    alert("添加成功");
                    $(form).find(":reset").trigger("click");
                    window.location.reload();
                }else {
                    alert("添加失败或已存在该用户");
                    window.location.reload();
                }

            }
            });
          return false;

    }


    //修改
    function upd(form) {
        $.ajax({
            url:"upd.member",
            type:"POST",
            data:$(form).serialize(),
            dataType:"text",
            success:function (data) {
                
                if(data>0){
                    alert("修改成功");
                    $(form).find(":reset").trigger("click");
                    window.location.reload();
                }
                else {
                    alert("修改失败");
                    window.location.reload();
                }

            }
        });
        return false;

    }
//删除
    function doDel(id,cell) {
        if(confirm("确定删除吗?")){
            // alert("执行了删除");
            //请求服务器
            var url="del.member";
            var args={"id":id};
            //传递学号给服务器，服务器通过学号去数据库删除数据
            $.post(url,args,function(data){

                //说明服务器返回的影响函数为大于1
                if(data>0){
                    alert("删除成功！");
                    //单元格所对应的行要删除
                    $(cell).parent().parent().remove();
                    load();
                }
                else {
                    alert("删除失败！");
                }
            },"json");
        }

    }
//用id查找
    function findByid(id) {
        var url="find.member";
        //为了去除缓存
        var args={"id":id};

        $.post(url,args,function(data){
         if(data==null){
             alert("查询用户不存在！")
         }
            //说明服务器返回的影响函数为大于1
            // var json=eval(data);//函数可计算某个字符串，并执行其中的的 JavaScript 代码。
            // alert(json)
            var str="";
            str+= "<tr>" + "<td>" + data.id + "</td>" + "<td>" + data.memberName + "</td>" + "<td>"
                + data.phone + "</td>" + "<td>" + data.gender + "</td>" +"</tr>";
            $("#xs").show();
            $("#tbody1").empty();
            $("#tbody1").append(str);

        },"json");
        return false;
    }

</script>
</div>
</body></html>
