<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/5
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" action="/Admin/updateUser" method="post">
            <%--<div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>用户名</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="username" required="" lay-verify="username" autocomplete="off" class="layui-input"></div>
            </div>--%>
                <input type="hidden" name="username" value="${user.username }"/><br/>
            <div class="layui-form-item">
                <label for="L_password" class="layui-form-label">
                    <span class="x-red">*</span>密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_password" name="password" required="" lay-verify="password" autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="L_realname" class="layui-form-label">
                    <span class="x-red">*</span>真实姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_realname" name="realname" required="" lay-verify="realname" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_mobile" class="layui-form-label">
                    <span class="x-red">*</span>电话号码</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_mobile" name="mobile" required="" lay-verify="mobile" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_age" class="layui-form-label">
                    <span class="x-red">*</span>年龄</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_age" name="age" required="" lay-verify="age" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_dept_id" class="layui-form-label">
                    <span class="x-red">*</span>部门id</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_dept_id" name="dept_id" required="" lay-verify="dept_id" autocomplete="off" class="layui-input"></div>
            </div>
                <div class="layui-form-item">
                    <input class="layui-btn"  type="submit" value="编辑"/></div>
        </form>
    </div>
</div>
</body>
</html>
