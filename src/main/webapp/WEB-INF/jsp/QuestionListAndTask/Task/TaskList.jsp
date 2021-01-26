<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <%--<!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->--%>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#exportDescInfo").click(function () {
                window.location.href = "${pageContext.request.contextPath}/Excel/Task";
            });
        });

        $(function () {
            if ("${sessionScope.addTask}" > 0) {
                var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                parent.layer.close(index);
                parent.location.reload();
            }
            <% session.removeAttribute("addTask");%>

            if ("${sessionScope.updateTask}" > 0) {
                var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                parent.layer.close(index);
                parent.location.reload();
            }
            <% session.removeAttribute("updateTask");%>
        });


        $(function () {
            $('#queryBtn').click(function () {
                let input = $("#input").val();
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/Task/toSreach",
                    data: {
                        inputMsg: input
                    },
                    success: function (data) {
                        if (data.success) {
                            window.location.href = '${pageContext.request.contextPath}/Task/query';
                        } else {
                            layer.msg("没有找到此项目，请重新输入");
                        }
                    }
                });
            });
        });


        $(function () {
            for (let i = 0; i < ${Task.size()}; i++) {
                let msg = $(".td-status span")[i].innerText;
                let result = "已处理";
                if (msg == result) {
                    $(".td-status span").eq(i).addClass('layui-btn-disabled');
                }
            }
        })
        ;

        function member_stop(obj, index, id) {
            layer.confirm('您确定已完成吗?', {btn: ['确定', '取消'], title: "提示"}, function () {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/Task/toUpdateStatus",
                    data: {
                        TK_STATUS: index,
                        TK_ID: id
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            if (index == 1) {
                                layer.msg('已完成，请勿重复点击！', {icon: 7, time: 2000});
                            } else {
                                layer.msg("修改成功", {icon: 1, time: 3000});
                                window.setTimeout("window.location.href = '${pageContext.request.contextPath}/Task/updateStatus'", 500);
                            }
                        } else {
                            layer.msg('修改失败', {icon: 2});
                        }
                    }
                });
            });
        }

    </script>
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="${pageContext.request.contextPath}/Question/getAllQuestions">售后</a>
            <a><cite>任务分配</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <%--<div class="layui-inline layui-show-xs-block">
                            <input class="layui-input test-item" autocomplete="off" placeholder="开始日" name="start"
                                   id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input test-item" autocomplete="off" placeholder="截止日" name="end"
                                   id="end">
                        </div>--%>
                        <div class="layui-inline layui-show-xs-block">
                            <input id="input" type="text" name="input" placeholder="请输入" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="sreach" id="queryBtn"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>

                    </form>
                    <div style="padding-top: 10px">
                        <button type="button" id="exportDescInfo" value="导出Excel表"
                                class="layui-btn  layui-btn-radius layui-btn-warm">
                            <i class="layui-icon  layui-icon-export"></i>导出到Excel表
                        </button>
                    </div>
                </div>
                <div class="layui-col-xs1">
                    <%--<label style="color: green">部门ID：</label>
                    <div class="layui-inline layui-show-xs-block" style="margin-top: 15px">
                        <input type="text" name="departmentId" placeholder="请输入部门编号" autocomplete="off"
                               class="layui-input">
                    </div>--%>
                    <%--<div class="layui-inline layui-show-xs-block" style="margin-top: 15px">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach"><i
                                class="layui-icon">&#xe615;</i></button>
                    </div>--%>
                    <div id="test13" class="demo-tree-more" style="margin-top: 20px "></div>
                </div>
                <div class="layui-col-xs11">
                    <div class="layui-card-body layui-table-body layui-table-main">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <%-- <th>
                                     <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary"
                                            style="visibility: hidden"/>
                                 </th>--%>
                                <th>项目编号</th>
                                <th>问题编号</th>
                                <th>任务编号</th>
                                <th>负责的部门</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>任务负责人</th>
                                <th>任务内容</th>
                                <th>任务状态</th>
                                <th>创建人</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${Task }" var="task">
                                <tr>
                                        <%-- <td><input type="checkbox" lay-filter="" name="subcheck" id="subcheck"
                                                    lay-skin="primary" style="visibility: hidden"/></td>--%>
                                    <td>${task.TK_PRJCode}</td>
                                    <td>${task.TK_QuestionID}</td>
                                    <td>${task.TK_CODE}</td>
                                    <td>${task.TK_Department}</td>
                                    <td><fmt:formatDate value="${task.TK_START_DATE}"
                                                        pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                                    <td><fmt:formatDate value="${task.TK_END_DATE}"
                                                        pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                                    <td>${task.TK_RESPONER}</td>
                                    <td>${task.TK_DETAILS}</td>
                                    <td class="td-status" id="status">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini"
                                          onclick="member_stop(this,'${task.TK_STATUS}','${task.TK_ID}')">
                                        <c:choose>
                                            <c:when test="${task.TK_STATUS  == 0 }">
                                                待处理
                                            </c:when>
                                            <c:otherwise>
                                                已处理
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    </td>
                                    <td>${task.TK_CREATED_BY}</td>
                                    <td class="td-manage">
                                        <a title="去审批"
                                            <%--href="/problemDesc/problemDescInfo"--%>
                                           onclick="parent.xadmin.add_tab('审批','/Task/toQuestion/${task.TK_ID}')">
                                            <i class="layui-icon layui-icon-auz"></i>
                                        </a>
                                        <a title="编辑"
                                           onclick="xadmin.open('编辑','/Task/toUpdateTask/${task.TK_ID}',460,738)"
                                           href="javascript:;">
                                            <i class="layui-icon">&#xe642;</i>
                                        </a>
                                        <a title="删除" href="/Task/deleteTask/${task.TK_ID}"
                                           onclick="return window.confirm('确定要删除吗？')">
                                            <i class="layui-icon">&#xe640;</i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="12">${pageNav}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(["tree", "util", "jquery", "form", "laydate"], function () {
        var tree = layui.tree
            , layer = layui.layer
            , util = layui.util
            , $ = layui.jquery
            , form = layui.form
            , laydate = layui.laydate
            //模拟数据
            , data = [{
                title: '上海营创'
                /*, id: 1*/
                , field: ''
                , checked: true
                , spread: true
                , disabled: true
                , children: [{
                    title: '项目部'
                    , id: 1
                    , field: '项目部'
                    , href: ''
                }, {
                    title: '人事部'
                    , id: 2
                    , spread: false  /* 刷新之后展开就是true */
                    , field: '人事部'
                }, {
                    title: 'IT部'
                    , id: 3
                    , field: 'IT部'
                }, {
                    title: '财务部'
                    , id: 4
                    , field: '财务部'
                }, {
                    title: '市场部'
                    , id: 5
                    , field: '市场部'
                }, {
                    title: '研发部'
                    , id: 6
                    , field: '研发部'
                }]
            }];

        //基本演示
        tree.render({
            elem: '#test13'
            , data: data
            , showCheckbox: false  //是否显示复选框
            , id: 'SHYC'
            , isJump: true //是否允许点击节点时弹出新窗口跳转
            , onlyIconControl: true  //是否仅允许节点左侧图标控制展开收缩
            /*,edit: ['add', 'update', 'del'] //开启操作节点数据的图标*/
            , click: function (obj) {
                var nodeData = obj.data;  //获取当前点击的节点数据
                /*layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(nodeData));*/
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/Task/toDepartment",
                    data: {
                        department: nodeData.field
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            window.location.href = "${pageContext.request.contextPath}/Task/queryByDepartment"
                        } else {
                            layer.msg("该部门没有分配任务，请重新输入！");
                        }
                    }
                });
                return false;
            }
        });


        //按钮事件
        util.event('lay-demo', {
            getChecked: function (othis) {
                var checkedData = tree.getChecked('SHYC'); //获取选中节点的数据
                layer.alert(JSON.stringify(checkedData), {shade: 0});
                console.log(checkedData);
            }
            /* , setChecked: function () {
                 tree.setChecked('SHYC', [12, 16]); //勾选指定节点
             }*/
            /*, reload: function () {
                //重载实例
                tree.reload('SHYC', {});

            }*/
        });
    });
</script>
</body>
</html>
