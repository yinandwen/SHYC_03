<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            background: url('/images/112.jpg');
            repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            -moz-background-size: cover;
            -webkit-background-size: cover;
        }

    </style>
</head>
<body>
<%--<div class="layui-carousel" id="test1" lay-filter="test1">--%>
<%--    <div carousel-item="">--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--        <div><img src="images/8d6e3d93-98cf-4370-8e6b-5187b4381713QQ图片20201127125028.jpg"/></div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div>
    <img src="images/112.jpg" width="100%" height="90%">
</div>--%>
<div style="padding-left: 50%; padding-top: 40%">
    <button class="layui-btn layui-btn-radius"><a href="/Login/toLogin">登录</a></button>
</div>
</body>

</html>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(["carousel", "form"], function () {
        var carousel = layui.carousel
            , form = layui.form;
        //图片轮播
        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
            ,width: "100%"
            ,height: "50%"
            ,interval: 3000
        });
    });
</script>