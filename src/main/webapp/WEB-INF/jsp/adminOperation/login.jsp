<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/4
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon"/>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-bg" style="background-image: url('/images/112.jpg')">

<div class="login layui-anim layui-anim-up">
    <div class="message">上海营创</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" id="loginForm">
        <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button" id="loginBtn">
        <hr class="hr20">
    </form>
</div>
<%--<script>
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            //监听提交
            form.on('submit(login)', function(data){
                // alert(888)
                layer.msg(JSON.stringify(data.field),function(){
                    location.href='index.html'
                });
                return false;
            });
        });
    })
</script>
<!-- 底部结束 -->
<script>
    //百度统计可去掉
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>--%>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#loginBtn").click(function () {
            $.post("${pageContext.request.contextPath}/Login/login", $("#loginForm").serialize(), function (data) {
                if (data.success) {
                    window.location.href = "${pageContext.request.contextPath}/Login/toIndex";
                } else {
                    alert("用户名或者密码错误");
                }
            }, "json");
        });
    });


    /*if(window !=top){
        top.location.href=location.href;
    }*/
    /* *登陆判断是否是子页面跳转到登录页,如果是子页面,则定位到顶层父级页面登录*/
    if (window.top != null && window.top.document.URL != document.URL) {
        window.top.location = document.URL;
    }
</script>
