<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/4
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        var is_remember = false;
    </script>
    <script language='javascript'>
        history.go(1);
    </script>
</head>
<%--<c:if test="${sessionScope.username} == null">
    <c:redirect url="/Login/toLogin"></c:redirect>
</c:if>--%>
<body class="index">
<!-- 顶部开始 -->
<jsp:include page="${pageContext.request.contextPath}/public/topMenu.jsp"></jsp:include>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<jsp:include page="${pageContext.request.contextPath}/public/leftMenu.jsp"></jsp:include>
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/Num/problemDescNum' frameborder="0" scrolling="yes" class="x-iframe">
                    <iframe>

                    </iframe>
                </iframe>
            <%-- &lt;%&ndash;具有管理权限的人欢迎界面&ndash;%&gt;
                 <security:authorize access="hasAuthority('ROLE_LIST_USER')">
                     <iframe src='/Login/toWelcomeAdmin1' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                 </security:authorize>
                 &lt;%&ndash;具有售后权限的人欢迎界面&ndash;%&gt;
                 <security:authorize access="hasAuthority('ROLE_AFTER_SALE')">
                     <iframe src='/Login/toWelcomeSale' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                 </security:authorize>
                 &lt;%&ndash;具有订单管理权限的人欢迎界面&ndash;%&gt;
                 <security:authorize access="hasAuthority('ROLE_ORDER_MANAGE')">
                     <iframe src='/Login/toWelcomeAdmin' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                 </security:authorize>--%>
            </div>
        </div>
        <div id="tab_show">
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<script>//百度统计可去掉
var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();

</script>
</body>

</html>
