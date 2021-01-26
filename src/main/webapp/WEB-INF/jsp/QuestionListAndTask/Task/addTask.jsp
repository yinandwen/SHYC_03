<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/5
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
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
        <form class="layui-form" action="/Task/addTask" method="post">
            <div class="layui-form-item">
                <label for="TK_PRJCode" class="layui-form-label">
                    <span class="x-red">*</span>项目编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_PRJCode" name="TK_PRJCode" required="" lay-verify="TK_PRJCode"
                           autocomplete="off"
                           class="layui-input" value="${TK_PRJCode}"></div>
            </div>

            <div class="layui-form-item">
                <label for="TK_QuestionID" class="layui-form-label">
                    <span class="x-red">*</span>问题编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_QuestionID" name="TK_QuestionID" required="" lay-verify="TK_QuestionID"
                           autocomplete="off"
                           class="layui-input" value="${TK_QuestionID}"></div>
            </div>

            <div class="layui-form-item">
                <label for="TK_CODE" class="layui-form-label">
                    <span class="x-red">*</span>任务编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_CODE" name="TK_CODE" required="" lay-verify="TK_CODE"
                           autocomplete="off"
                           class="layui-input" placeholder="建议格式为:T-0001(表示任务1)"></div>
            </div>

            <div class="layui-form-item">
                <label for="TK_NAME" class="layui-form-label">
                    <span class="x-red">*</span>任务名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_NAME" name="TK_NAME" required="" lay-verify="TK_NAME"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="TK_Department" class="layui-form-label">
                    <span class="x-red">*</span>负责的部门</label>
                <div class="layui-input-inline">
                    <select name="TK_Department" id="TK_Department" lay-verify="TK_Department" required>
                        <option selected="selected" disabled="disabled">请选择--</option>
                        <option>项目部</option>
                        <option>人事部</option>
                        <option>IT部</option>
                        <option>市场部</option>
                        <option>财务部</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="TK_START_DATE" class="layui-form-label">
                    <span class="x-red">*</span>任务开始</label>
                <div class="layui-input-inline">
                    <input class="layui-input"
                           value="<fmt:formatDate value="${task.TK_START_DATE}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                           autocomplete="off"
                           name="TK_START_DATE" id="TK_START_DATE" lay-verify="TK_START_DATE"  required="">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="TK_END_DATE" class="layui-form-label">
                    <span class="x-red">*</span>任务结束</label>
                <div class="layui-input-inline">
                    <input class="layui-input"
                           value="<fmt:formatDate value="${task.TK_END_DATE}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                           autocomplete="off"
                           name="TK_END_DATE" id="TK_END_DATE" lay-verify="TK_END_DATE"  required="">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="TK_RESPONER" class="layui-form-label">
                    <span class="x-red">*</span>任务负责人</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_RESPONER" name="TK_RESPONER" required="" lay-verify="TK_RESPONER"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>


            <div class="layui-form-item">
                <label for="TK_DETAILS" class="layui-form-label">
                    <span class="x-red">*</span>任务内容</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="TK_DETAILS" lay-verify="TK_DETAILS"  required=""
                              id="TK_DETAILS"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="TK_CREATED_BY" class="layui-form-label">
                    <span class="x-red">*</span>创建人</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_CREATED_BY" name="TK_CREATED_BY" required="" lay-verify="TK_CREATED_BY"
                           autocomplete="off"
                           class="layui-input" value="${username}"></div>
            </div>

            <div class="layui-form-item layui-input-inline" style="padding-left: 130px;">
                <input class="layui-btn" type="submit" value="添加"<%-- onclick="xadmin.close()"--%>/></div>
            <div class="layui-form-item layui-input-inline" style="margin-left: 40px">
                <input class="layui-btn" type="reset" value="重置"<%-- onclick="xadmin.close()"--%>/></div>
        </form>
    </div>
</div>
</body>
</html>
<script>
    layui.use(['laydate'], function () {
        var laydate = layui.laydate;

        //选中后的回调
        laydate.render({
            elem: '#TK_START_DATE'
            , done: function (value, date) {
                /*layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));*/
            }
            , theme: "molv"
        });

        laydate.render({
            elem: '#TK_END_DATE'
            , done: function (value, date) {
                /*layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));*/
            }
            , theme: "molv"
        });

    });
</script>


