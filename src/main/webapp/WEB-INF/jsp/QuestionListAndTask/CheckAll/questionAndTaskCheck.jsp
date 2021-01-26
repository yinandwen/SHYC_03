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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <%--<!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->--%>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <style>
        .layui-card-body span {
            color: red;
            font-size: 15px;
            float: left;
        }
    </style>
</head>
<body>

<div class="layui-card-body layui-table-body layui-table-main">
    <table class="layui-table layui-form">
        <tr>
            <th>项目号</th>
            <th>问题编号</th>
            <th>项目责任人</th>
            <th>纠正措施</th>
            <th>项目责任部门</th>
            <th>该问题的状态</th>
            <th>任务部门</th>
            <th>计划开始时间</th>
            <th>计划结束时间</th>
            <th>执行进度</th>
            <th>任务内容</th>
            <th>任务状态</th>
        </tr>

        <c:forEach items="${CheckList }" var="Check">
            <tr>
                <td>${Check.QS_PRJCode}</td>
                <td>${Check.QS_QuestionID}</td>
                <td>${Check.QS_Responer}</td>
                <td>${Check.QS_Action}</td>
                <td>${Check.QS_SupportDept}</td>
                <td><c:choose>
                    <c:when test="${Check.QS_OpenClose  == 0 || Check.QS_OpenClose == null}">
                        <span style="color: red"/>待处理
                    </c:when>
                    <c:otherwise>
                        <span style="color: green"/>已处理
                    </c:otherwise>
                </c:choose></td>
                <td>${Check.TK_Department}</td>
                <td><fmt:formatDate value="${Check.TK_START_DATE}"
                                    pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                <td><fmt:formatDate value="${Check.TK_END_DATE}"
                                    pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                <td>${Check.TK_PROGRESS}</td>
                <td>${Check.TK_DETAILS}</td>
                <td><c:choose>
                    <c:when test="${Check.TK_STATUS  == 0 || Check.TK_STATUS == null}">
                        <span style="color: red"/>待处理
                    </c:when>
                    <c:otherwise>
                        <span style="color: green"/>已处理
                    </c:otherwise>
                </c:choose></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
