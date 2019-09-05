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
    <!-- 部门列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">后厨管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <%--                <form class="form-inline" method="get" >--%>
                <div class="form-inline">
                    <div class="form-group">
                        <label for="foodName">菜品名称</label>
                        <input type="text" class="form-control" id="foodName">
                    </div>
                    <button id="selectButton" class="btn btn-primary">查询</button>
                </div><br>

                <%--                </form>--%>

                <table id="selectTable" class="table table-bordered table-striped" style="display: none;">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>菜品名称</th>
                        <th>库存</th>
                        <th>普通价格</th>
                        <th>会员价格</th>
                        <th>参考图片</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center;" id="tbodySelect">
                    <%--菜品详情显示区域--%>
                    </tbody>
                </table>
            </div>
        </div>
        <p>
            <a class="btn btn-primary" data-toggle="modal" data-target="#newFoodDialog" onclick="clearAddFood()">添加</a>
        </p>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">菜单信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>菜品名称</th>
                            <th>库存</th>
                            <th>普通价格</th>
                            <th>会员价格</th>
                            <th>参考图片</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody style="text-align: center;" id="tbody">
                        <%--菜品详情显示区域--%>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <nav>
                            <ul class="pagination">
                                <li id="firstPage"><a>首页 </a></li>
                                <li id="prePage"><a>上一页 </a></li>
                                <li class="disabled"><a id="currentPage"></a></li>
                                <li id="nextPage"><a>下一页</a></li>
                                <li id="lastPage"><a>尾页</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 部门列表查询部分  end-->
</div>
<!-- 创建部门模态框 -->
<div class="modal fade" id="newFoodDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <p aria-hidden="true">×</p>
                </button>
                <h4 class="modal-title">新建菜品信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_food_form" enctype="multipart/form-data">
                    <!--菜品名称-->
                    <div class="form-group">
                        <label for="new_foodName" class="col-sm-2 control-label">
                            菜品名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_foodName" placeholder="菜品名称" name="new_foodName">
                        </div>
                    </div>
                    <!--库存-->
                    <div class="form-group">
                        <label for="new_inventory" class="col-sm-2 control-label">
                            库存
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_inventory" placeholder="库存" name="new_inventory">
                        </div>
                    </div>
                    <!--普通价格-->
                    <div class="form-group">
                        <label for="new_price" class="col-sm-2 control-label">
                            普通价格
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_price" placeholder="普通价格" name="new_price">
                        </div>
                    </div>
                    <!--会员价格-->
                    <div class="form-group">
                        <label for="new_mPrice" class="col-sm-2 control-label">
                            会员价格
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_mPrice" placeholder="会员价格" name="new_mPrice">
                        </div>
                    </div>
                    <!--参考图片-->
                    <div class="form-group">
                        <label for="new_img" class="col-sm-2 control-label">
                            参考图片
                        </label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="new_img" placeholder="参考图片" name="file">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="addFood">创建菜品</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改部门模态框 -->
<div class="modal fade" id="foodEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <p aria-hidden="true">×</p>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改菜品信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_food_form">
                    <!--菜品名称-->
                    <div class="form-group">
                        <label for="edit_foodId" class="col-sm-2 control-label">
                            菜品编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_foodId" placeholder="菜品编号" name="edit_foodId" readonly>
                        </div>
                    </div>
                    <!--菜品名称-->
                    <div class="form-group">
                        <label for="edit_foodName" class="col-sm-2 control-label">
                            菜品名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_foodName" placeholder="菜品名称" name="edit_foodName">
                        </div>
                    </div>
                    <!--库存-->
                    <div class="form-group">
                        <label for="edit_inventory" class="col-sm-2 control-label">
                            库存
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_inventory" placeholder="库存" name="edit_inventory">
                        </div>
                    </div>
                    <!--普通价格-->
                    <div class="form-group">
                        <label for="edit_normalPrice" class="col-sm-2 control-label">
                            普通价格
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_normalPrice" placeholder="普通价格" name="edit_normalPrice">
                        </div>
                    </div>
                    <!--会员价格-->
                    <div class="form-group">
                        <label for="edit_memberPrice" class="col-sm-2 control-label">
                            会员价格
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_memberPrice" placeholder="会员价格" name="edit_memberPrice">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatefood()">保存修改</button>
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
        $(".panel-heading").click(function(e){
            /*切换折叠指示图标*/
            $(this).find("span").toggleClass("fa-chevron-down");
            $(this).find("span").toggleClass("fa-chevron-up");
        });
        showAllFood();
        addFood();
    });
    //加载菜单列表
    function showAllFood() {
        var url="showAllFood.kitchen";
        //为了去除缓存
        var args={"time":new Date()};
        $.get(url,args,function (data) {
            var json=eval(data);//函数可计算某个字符串，并执行其中的的 JavaScript 代码。
            var currentPage=1;
            var totalPage=0;
            var str="";
            $.each(json,function (index,obj) {
                totalPage++;
                if (totalPage <= (currentPage*5) && totalPage > ((currentPage-1)*5)) {
                    str+= "<tr>"+"<td style=\"padding-top: 46px;\">"+obj.id+"</td>"+"<td style=\"padding-top: 46px;\">"+obj.foodName+"</td>"+
                        " <td style=\"padding-top: 46px;\">"+obj.remainFood+"</td>"+" <td style=\"padding-top: 46px;\">"+obj.price+"</td>"+
                        " <td style=\"padding-top: 46px;\">"+obj.mprice+"</td>"+"<td><img style=\"width: 100px;height: 100px;\" src=\""+obj.img+"\"></td>"+
                        "<td style=\"padding-top: 46px;\">\n" +
                        "<span  class=\"btn btn-primary btn-xs\" data-toggle=\"modal\" data-target=\"#foodEditDialog\" onclick='editfood(this)' >"+"修改"+"</span>"+"&ensp;"+
                        "<input type=\"hidden\" value="+obj.id+">"+
                        "<input type='hidden' value='"+obj.foodName+"'>"+
                        "<input type=\"hidden\" value=\""+obj.remainFood+"\">"+
                        "<input type=\"hidden\" value=\""+obj.price+"\">"+
                        "<input type=\"hidden\" value=\""+obj.mprice+"\">"+
                        "<a  class=\"btn btn-danger btn-xs\" onclick=\"deleteFood("+obj.id+")\">"+"删除"+"</a>\n" +
                        "</td>\n" +
                        "</tr>";
                }
            });
            $("#currentPage").html(currentPage);
            $("#tbody").empty();
            $("#tbody").append(str);




            $("#firstPage").click(function () {
                currentPage=1;
                showPaging();
            });
            $("#prePage").click(function () {
                if(currentPage>1){
                    currentPage--;
                }
                showPaging();
            });
            $("#nextPage").click(function () {
                if (currentPage<(Math.ceil(totalPage/5))) {
                    currentPage++;
                }
                showPaging();
            });
            $("#lastPage").click(function () {
                currentPage=Math.ceil(totalPage/5);
                showPaging();
            });



            function showPaging() {
                var str="";
                var totalPage=0;
                $.each(json,function (index,obj) {
                    totalPage++;
                    if (totalPage <= (currentPage*5) && totalPage > ((currentPage-1)*5)) {
                        str+= "<tr>"+"<td style=\"padding-top: 46px;\">"+obj.id+"</td>"+"<td style=\"padding-top: 46px;\">"+obj.foodName+"</td>"+
                            " <td style=\"padding-top: 46px;\">"+obj.remainFood+"</td>"+" <td style=\"padding-top: 46px;\">"+obj.price+"</td>"+
                            " <td style=\"padding-top: 46px;\">"+obj.mprice+"</td>"+"<td><img style=\"width: 100px;height: 100px;\" src=\""+obj.img+"\"></td>"+
                            "<td style=\"padding-top: 46px;\">\n" +
                            "<span href=\"#\" class=\"btn btn-primary btn-xs\" data-toggle=\"modal\" data-target=\"#foodEditDialog\" onclick='editfood(this)' >"+"修改"+"</span>"+"&ensp;"+
                            "<input type=\"hidden\" value=\""+obj.id+"\">"+
                            "<input type=\"hidden\" value=\""+obj.foodName+"\">"+
                            "<input type=\"hidden\" value=\""+obj.remainFood+"\">"+
                            "<input type=\"hidden\" value=\""+obj.price+"\">"+
                            "<input type=\"hidden\" value=\""+obj.mprice+"\">"+
                            "<a  class=\"btn btn-danger btn-xs\" onclick=\"deleteFood("+obj.id+")\">"+"删除"+"</a>\n" +
                            "</td>\n" +
                            "</tr>";
                    }
                    $("#currentPage").html(currentPage);
                    $("#tbody").empty();
                    $("#tbody").append(str);
                });
            }





            //查询
            $("#selectButton").click(function () {
                str="";
                var foodName=$("#foodName").val();
                $.each(json,function (index,obj) {
                    if (foodName==obj.foodName) {
                        str = "<tr>"+"<td style=\"padding-top: 46px;\">"+obj.id+"</td>"+"<td style=\"padding-top: 46px;\">"+obj.foodName+"</td>"+
                            " <td style=\"padding-top: 46px;\">"+obj.remainFood+"</td>"+" <td style=\"padding-top: 46px;\">"+obj.price+"</td>"+
                            " <td style=\"padding-top: 46px;\">"+obj.mprice+"</td>"+"<td><img style=\"width: 100px;height: 100px;\" src=\""+obj.img+"\"></td>"+
                            "<td style=\"padding-top: 46px;\">\n" +
                            "<span  class=\"btn btn-primary btn-xs\" data-toggle=\"modal\" data-target=\"#foodEditDialog\" onclick='editfood(this)' >"+"修改"+"</span>"+"&ensp;"+
                            "<input type=\"hidden\" value="+obj.id+">"+
                            "<input type='hidden' value='"+obj.foodName+"'>"+
                            "<input type=\"hidden\" value=\""+obj.remainFood+"\">"+
                            "<input type=\"hidden\" value=\""+obj.price+"\">"+
                            "<input type=\"hidden\" value=\""+obj.mprice+"\">"+
                            "<a class=\"btn btn-danger btn-xs\" onclick=\"deleteFood("+obj.id+")\">"+"删除"+"</a>\n" +
                            "</td>\n" +
                            "</tr>";
                    }
                });
                $("#tbodySelect").empty();
                $("#tbodySelect").append(str);
                if (str!=""){
                    $("#selectTable").show();
                }else {
                    $("#selectTable").hide();
                }
            });
        },"json");
    }

    //清空新建窗口中的数据
    function clearAddFood() {
        $("#new_foodName").val("");
        $("#new_inventory").val("");
        $("#new_price").val("");
        $("#new_mPrice").val("");
        $("#new_img").val("");
    }
    // 创建
    function addFood() {
        $("#addFood").click(function () {
            var formData = new FormData($('#new_food_form')[0]);
            $.ajax({
                type : "POST",
                url : "addFood.kitchen",
                data : formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success : function(msg) {
                    if(msg){
                        alert('提交成功！');
                        window.location.reload();
                    }else {
                        alert('提交失败！');
                        window.location.reload();
                    }
                }
            });
        });

    }


    // 通过id获取修改的信息
    function editfood(obj) {
        var id=$(obj).next().val();
        // var id=obj.nextSibling.value;
        var name=$(obj).next().next().val();
        // alert(id);
        var remain=$(obj).next().next().next().val();
        var price=$(obj).next().next().next().next().val();
        var mprice=$(obj).next().next().next().next().next().val();
        $("#edit_foodId").val(id);
        $("#edit_foodName").val(name);
        $("#edit_inventory").val(remain);
        $("#edit_normalPrice").val(price);
        $("#edit_memberPrice").val(mprice);
    }
    // 执行修改操作
    function updatefood() {
        var url="updateFood.kitchen";
        var args=$("#edit_food_form").serialize();
        $.get(url,args,function (data) {
            if (data>0){
                alert('提交成功！');
                window.location.reload();
            } else {
                alert('提交失败！');
                window.location.reload();
            }
        });
    }




    // 删除部门
    function deleteFood(id) {
        if(confirm('确实要删除该道菜吗?')) {
            var url="deleteFood.kitchen";
            var args={"id":id};
            $.get(url,args, function(data){
                if(data =="OK"){
                    alert("删除成功！");
                    window.location.reload();
                }else{
                    alert("删除失败！");
                    window.location.reload();
                }
            });
        }
    }
</script>
</div>
</body></html>
