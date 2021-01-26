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
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>

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

<div class="layui-fluid">
    <table class="layui-table">
        <thead>
        <tr>
            <th>任务ID</th>
            <th>负责部门</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>任务负责人</th>
            <th>任务内容</th>
            <th>任务状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${Task }" var="task">
            <tr>
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
                <td class="td-manage">
                        <%-- <a title="去审批"
                             &lt;%&ndash;href="/problemDesc/problemDescInfo"&ndash;%&gt;
                            onclick="parent.xadmin.add_tab('审批','/Task/toQuestion/${task.TK_ID}')">
                             <i class="layui-icon layui-icon-auz"></i>
                         </a>--%>
                    <a title="编辑"
                       onclick="xadmin.open('编辑','/Task/toUpdateTask/${task.TK_ID}',500,700)"
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
            <td colspan="8">${pageNav}</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
