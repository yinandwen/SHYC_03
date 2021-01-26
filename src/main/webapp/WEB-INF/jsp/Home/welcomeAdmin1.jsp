<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/5
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>上海营创</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">

    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon"/>
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

</head>


<body>
<div class="container-fluid">
    <!-- 内容头部 -->
    <section class="layui-layer-content">
        <h1>
            上海营创
            <small>首页</small>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
               onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </h1>
        <ol class="breadcrumb">
            <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
        </ol>

    </section>

    <!-- 内容头部 /-->
    <!-- 正文区域 -->
    <section class="content">
        <!-- 统计数值 -->
        <div class="row">
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>${allUnfinishedQuestion}</h3>
                        <p>客户问题反馈总数</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a onclick="parent.xadmin.add_tab('售后问题','/Question/getAllQuestions')" class="small-box-footer">详情<i
                            class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <%-- <h3>53<sup style="font-size: 20px">%</sup></h3>--%>
                        <h3>${allUnfinishedTask}</h3>
                        <p>待完成任务</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a onclick="parent.xadmin.add_tab('任务分配','/Task/AllTask')" class="small-box-footer">详情<i
                            class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <%--所有订单--%>
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>${allUnfinishedQuestion}</h3>
                        <p>订单总数</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a onclick="parent.xadmin.add_tab('售后问题','/Question/getAllQuestions')" class="small-box-footer">详情<i
                            class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <%--所有项目--%>
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3>${allUnfinishedQuestion}</h3>
                        <p>项目总数</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a onclick="parent.xadmin.add_tab('售后问题','/Question/getAllQuestions')" class="small-box-footer">详情<i
                            class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>

        <%--<form method="get" action="/problemDesc/problemDescNum">--%>
        <!-- 待处理问题 -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <i class="fa fa-cube"></i>
                <h3 class="box-title">待处理问题</h3>
            </div>
            <div class="box-body">
                <!-- 数据表格 -->
                <div class="table-box">

                    <!--数据列表-->
                    <table id="dataList1" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th>项目编号</th>
                            <th>问题编号</th>
                            <th>问题描述</th>
                            <th>负责人</th>
                            <th>责任部门</th>
                            <th>备注信息</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>创建人</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${QuestionList }" var="question">
                            <tr>
                                <td>${question.QS_PRJCode}</td>
                                <td>${question.QS_QuestionID}</td>
                                <td>${question.QS_Description}</td>
                                <td>${question.QS_Responer}</td>
                                <td>${question.QS_SupportDept}</td>
                                <td>${question.QS_Note}</td>
                                <td class="td-status" id="status1">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini"
                                          onclick="member_stop(this,'${question.QS_OpenClose}','${question.QS_ID}')">
                                          <c:choose>
                                              <c:when test="${question.QS_OpenClose  == 0 }">
                                                  待处理
                                              </c:when>
                                              <c:otherwise>
                                                  已处理
                                              </c:otherwise>
                                          </c:choose>
                                                  </span>
                                </td>
                                <td>${question.QS_CREATED_TIME}</td>
                                <td>${question.QS_CREATED_BY}</td>

                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="16">${pageNav}</td>
                        </tr>
                        </tbody>
                    </table>
                    <!--数据列表/-->

                </div>
                <!-- 数据表格 /-->

            </div>
            <!-- /.box-body -->
        </div>
        <!-- 待处理订单 /-->
        <%--</form>--%>

        <!-- 待处理游记 -->
        <div class="box box-success">
            <div class="box-header with-border">
                <i class="fa fa-book"></i>
                <h3 class="box-title">待处理任务</h3>
            </div>
            <div class="box-body">
                <!-- 数据表格 -->
                <div class="table-box">
                    <!--数据列表-->
                    <table id="dataList2" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th>项目编号</th>
                            <th>问题编号</th>
                            <th>任务编号</th>
                            <th>负责的部门</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>任务负责人</th>
                            <th>任务状态</th>
                            <th>任务内容</th>
                            <th>创建人</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${Task }" var="task">
                            <tr>
                                    <%-- <td><input type="checkbox" lay-filter="" name="subcheck" id="subcheck"
                                                lay-skin="primary" style="visibility: hidden"/></td>--%>
                                <td>${task.TK_PRJCode}</td>
                                <td>${task.TK_QuestionID}</td>
                                <td>${task.TK_CODE}</td>
                                <td>${task.TK_Department}</td>
                                <td><fmt:formatDate value="${task.TK_START_DATE}"
                                                    pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                                <td><fmt:formatDate value="${task.TK_END_DATE}"
                                                    pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                                <td>${task.TK_RESPONER}</td>
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
                                <td>${task.TK_DETAILS}</td>
                                <td>${task.TK_CREATED_BY}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="12">${pageNav1}</td>
                        </tr>
                        </tbody>
                    </table>
                    <!--数据列表/-->

                </div>
                <!-- 数据表格 /-->

            </div>
            <!-- /.box-body -->

        </div>
        <!-- 待处理游记 /-->

    </section>
    <!-- 正文区域 /-->
</div>
</div>
</body>
</html>