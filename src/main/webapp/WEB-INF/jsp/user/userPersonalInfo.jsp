<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/22
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
</head>
<body>
<div class="layui-card-body layui-table-body layui-table-main">
    <table class="layui-table layui-form">
        <%--<label>ID: ${user.id}</label><br/>--%>
        <label>用户名:${user.username}</label><br/>
        <label>真实姓名:${user.realname}</label><br/>
        <label>密码:${user.password}</label><br/>
        <label>创建日期:${user.createDate}</label><br/>
        <label>最后登录日期:${user.lastLoginTime}</label><br/>
        <label>是否可用:${user.enabled}</label><br/>
        <label>是否过期:${user.accountNonExpired}</label><br/>
        <label>是否锁定:${user.accountNonLocked}</label><br/>
        <label>证书是否过期:${user.credentialsNonExpired}</label><br/>
    </table>
</div>
</body>
</html>
