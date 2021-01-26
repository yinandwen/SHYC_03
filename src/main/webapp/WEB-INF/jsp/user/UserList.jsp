<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="${pageContext.request.contextPath}/User/userInfo">员工管理</a>
            <%--<a href="">演示</a>--%>
            <a><cite>员工展示</cite></a>
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
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="请输入用户名" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除
                    </button>
                    <a class="layui-btn" onclick="xadmin.open('添加用户','/User/toAddUser',600,400)"><i
                            class="layui-icon"></i>添加</a>
                </div>


                <div class="layui-col-xs2">
                    <label style="color: green">部门ID：</label>
                    <div class="layui-inline layui-show-xs-block" style="margin-top: 15px">
                        <input type="text" name="departmentId" placeholder="请输入部门编号" autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block" style="margin-top: 15px">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach"><i
                                class="layui-icon">&#xe615;</i></button>
                    </div>
                    <div id="test13" class="demo-tree-more" style="margin-top: 20px ; margin-left:20px"></div>
                </div>

                <div class="layui-col-xs10">
                    <div class="layui-card-body layui-table-body layui-table-main">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary"
                                           style="visibility: hidden">
                                </th>
                                <th>id</th>
                                <th>用户名</th>
                                <th>真实姓名</th>
                                <th>密码</th>
                                <th>创建时间</th>
                                <th>最后登录时间</th>
                                <th>是否可用</th>
                                <th>是否过期</th>
                                <th>是否锁定</th>
                                <th>证书是否到期</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${userList }" var="user">
                                <tr>
                                    <td><input type="checkbox" lay-filter="" name="" lay-skin="primary"
                                               style="visibility: hidden"></td>
                                    <td>${user.id }</td>
                                    <td>${user.username }</td>
                                    <td>${user.realname }</td>
                                    <td>${user.password }</td>
                                    <td>${user.createDate }</td>
                                    <td>${user.lastLoginTime }</td>
                                    <td>${user.enabled }</td>
                                    <td>${user.accountNonExpired }</td>
                                    <td>${user.accountNonLocked }</td>
                                    <td>${user.credentialsNonExpired }</td>
                                    <td>
                                        <a title="编辑"
                                           onclick="xadmin.open('编辑','/User/toUpdateUser/${user.username}',600,400)"
                                           href="javascript:;">
                                            <i class="layui-icon">&#xe642;</i>
                                        </a>
                                        <a title="删除" href="/User/deleteUser/${user.username}">
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
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use(["tree", "util"], function () {
        var tree = layui.tree
            , layer = layui.layer
            , util = layui.util
            //模拟数据
            , data = [{
                title: '上海营创'
                , id: 1
                , field: 'name1'
                , checked: true
                , spread: true
                , children: [{
                    title: '项目部'
                    , id: 3
                    , field: 'name11'
                    , href: 'https://www.layui.com/'
                    , children: [{
                        title: '三级1-1-3'
                        , id: 23
                        , field: ''
                        , children: [{
                            title: '四级1-1-3-1'
                            , id: 24
                            , field: ''
                            , children: [{
                                title: '五级1-1-3-1-1'
                                , id: 30
                                , field: ''
                            }, {
                                title: '五级1-1-3-1-2'
                                , id: 31
                                , field: ''
                            }]
                        }]
                    }, {
                        title: '三级1-1-1'
                        , id: 7
                        , field: ''
                        , children: [{
                            title: '四级1-1-1-1 可允许跳转'
                            , id: 15
                            , field: ''
                            , href: 'https://www.layui.com/doc/'
                        }]
                    }, {
                        title: '三级1-1-2'
                        , id: 8
                        , field: ''
                        , children: [{
                            title: '四级1-1-2-1'
                            , id: 32
                            , field: ''
                        }]
                    }]
                }, {
                    title: '人事部'
                    , id: 4
                    , spread: false  /* 刷新之后展开就是true */
                    , children: [{
                        title: '三级1-2-1'
                        , id: 9
                        , field: ''
                    }, {
                        title: '三级1-2-2'
                        , id: 10
                        , field: ''
                    }]
                }, {
                    title: 'IT部'
                    , id: 20
                    , field: ''
                    , children: [{
                        title: '三级1-3-1'
                        , id: 21
                        , field: ''
                    }, {
                        title: '三级1-3-2'
                        , id: 22
                        , field: ''
                    }]
                }, {
                    title: '财务部'
                    , id: 20
                    , field: ''
                    , children: [{
                        title: '三级1-3-1'
                        , id: 21
                        , field: ''
                    }, {
                        title: '三级1-3-2'
                        , id: 22
                        , field: ''
                    }]
                }, {
                    title: '市场部'
                    , id: 20
                    , field: ''
                    , children: [{
                        title: '三级1-3-1'
                        , id: 21
                        , field: ''
                    }, {
                        title: '三级1-3-2'
                        , id: 22
                        , field: ''
                    }]
                }, {
                    title: '研发部'
                    , id: 20
                    , field: ''
                    , children: [{
                        title: '加工'
                        , id: 21
                        , field: ''
                    }, {
                        title: '装配'
                        , id: 22
                        , field: ''
                    }, {
                        title: '设计'
                        , id: 23
                        , field: ''
                    }]
                }]
            }];

        //基本演示
        tree.render({
            elem: '#test13'
            , data: data
            , showCheckbox: false  //是否显示复选框
            , id: 'demoId1'
            , isJump: true //是否允许点击节点时弹出新窗口跳转
            , onlyIconControl: true  //是否仅允许节点左侧图标控制展开收缩
            /*,click: function(obj){
                var data = obj.data;  //获取当前点击的节点数据
                layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
            }*/
        });

        //按钮事件
        util.event('lay-demo', {
            getChecked: function (othis) {
                var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据

                layer.alert(JSON.stringify(checkedData), {shade: 0});
                console.log(checkedData);
            }
            , setChecked: function () {
                tree.setChecked('demoId1', [12, 16]); //勾选指定节点
            }
            , reload: function () {
                //重载实例
                tree.reload('demoId1', {});

            }
        });

    });
</script>
</body>
</html>
