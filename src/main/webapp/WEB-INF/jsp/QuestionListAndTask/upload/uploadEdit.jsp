<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/5
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<textarea id="text" style="display: none">请输入文本</textarea>
</body>
<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        //layedit.set要放在build的上面
        layedit.set({
            uploadImage: {
                url: '/upload/uploadFile' //接口url
                , type: 'post' //默认post
            }
        });
        var text = layedit.build('text', {
            height: 700
        });
    });
</script>
</html>


