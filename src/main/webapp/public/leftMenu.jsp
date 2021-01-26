<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/18
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <head>
        <meta charset="UTF-8">
        <title>上海营创</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
        <meta http-equiv="Cache-Control" content="no-siteapp"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon"/>
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
        <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
        <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
    </head>
</head>
<body>
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a onclick="xadmin.add_tab('首页','/Num/problemDescNum',true)">
                    <i class="layui-icon layui-icon-home" lay-tips="首页"></i>
                    <cite>首页</cite>
                </a>
            </li>
            <security:authorize access="hasAuthority('ROLE_LIST_USER')">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont left-nav-li" lay-tips="人员管理">&#xe6b8;</i>
                        <cite>人员管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                    <ul class="sub-menu">
                        <li>
                            <a onclick="xadmin.add_tab('管理员展示','/User/userInfo')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>显示所有管理员</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('员工展示','/User/userInfo')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>显示所有员工</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('员工展示','/User/toLayuiTable')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>显示所有员工1</cite></a>
                        </li>
                            <%-- <security:authorize access="hasAnyRole('admin','management')">
                                 <li>
                                     <a onclick="xadmin.add_tab('员工展示','/Admin/userInfo')">
                                         <i class="iconfont">&#xe6a7;</i>
                                         <cite>显示所有员工</cite></a>
                                 </li>
                             </security:authorize>--%>
                        <li>
                            <a onclick="xadmin.add_tab('会员列表(静态表格)','member-list.html')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>会员列表(静态表格)</cite></a>
                        </li>
                        <li>
                            <a onclick="xadmin.add_tab('会员列表(动态表格)','member-list1.html',true)">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>会员列表(动态表格)</cite></a>
                        </li>
                        <li>
                            <a onclick="xadmin.add_tab('会员删除','member-del.html')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>会员删除</cite></a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe70b;</i>
                                <cite>会员管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <ul class="sub-menu">
                                <li>
                                    <a onclick="xadmin.add_tab('会员删除','member-del.html')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>会员删除</cite></a>
                                </li>
                                <li>
                                    <a onclick="xadmin.add_tab('等级管理','member-list1.html')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>等级管理</cite></a>
                                </li>
                            </ul>
                        </li>
                            <%--员工管理的二级菜单栏--%>
                    </ul>
                </li>
            </security:authorize>



            <%--订单管理开始--%>
            <security:authorize access="hasAuthority('ROLE_TASK_MANAGER')">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont layui-icon">&#xe63c;</i>
                        <cite>订单管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                    <ul class="sub-menu">
                        <li>
                            <a onclick="parent.xadmin.add_tab('订单列表','/Orders/toQueryOrders',true)">
                                <i class="layui-icon">&#xe621;</i>
                                <cite>订单列表</cite>
                            </a>
                        </li>
                    </ul>
                </li>
            </security:authorize>
            <%--订单管理结束--%>

            <%--项目管理开始--%>
            <security:authorize access="hasAuthority('ROLE_TASK_MANAGER')">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont layui-icon">&#xe63c;</i>
                        <cite>项目管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                    <ul class="sub-menu">
                        <li>
                            <a onclick="parent.xadmin.add_tab('项目列表','/Project/toQueryProject',true)">
                                <i class="layui-icon">&#xe621;</i>
                                <cite>项目列表</cite></a>
                        </li>
                    </ul>
                </li>
            </security:authorize>
            <%--项目管理结束--%>

            <%--任务管理开始--%>
            <security:authorize access="hasAuthority('ROLE_TASK_MANAGER')">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont layui-icon">&#xe63c;</i>
                        <cite>任务管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                    <ul class="sub-menu">
                        <li>
                            <a onclick="parent.xadmin.add_tab('任务列表','/TaskPool/toQueryTask',true)">
                                <i class="layui-icon">&#xe621;</i>
                                <cite>任务列表</cite></a>
                        </li>


                        <li>
                            <a onclick="xadmin.add_tab('新增任务','')">
                                <cite>新增任务</cite></a>
                        </li>
                    </ul>
                </li>
            </security:authorize>
            <%--任务管理开始--%>
            <%--            <li>--%>
            <%--                <a href="javascript:;">--%>
            <%--                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>--%>
            <%--                    <cite>订单管理</cite>--%>
            <%--                    <i class="iconfont nav_right">&#xe697;</i></a>--%>
            <%--                <ul class="sub-menu">--%>
            <%--                    <li>--%>
            <%--                        <a onclick="xadmin.add_tab('订单列表','order-list.html')">--%>
            <%--                            <i class="iconfont">&#xe6a7;</i>--%>
            <%--                            <cite>订单列表</cite></a>--%>
            <%--                    </li>--%>
            <%--                    <li>--%>
            <%--                        <a onclick="xadmin.add_tab('订单列表1','order-list1.html')">--%>
            <%--                            <i class="iconfont">&#xe6a7;</i>--%>
            <%--                            <cite>订单列表1</cite></a>--%>
            <%--                    </li>--%>
            <%--                </ul>--%>
            <%--<security:authorize access="hasAnyRole('marketing')">
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('订单列表','order-list.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('订单列表1','order-list1.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表1</cite></a>
                    </li>
                </ul>
            </security:authorize>--%>
            <%--            </li>--%>

            <%--<li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="分类管理">&#xe723;</i>
                    <cite>分类管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('多级分类','cate.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>多级分类</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="城市联动">&#xe723;</i>
                    <cite>城市联动</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('三级地区联动','city.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>三级地区联动</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('管理员列表','admin-list.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('角色管理','admin-role.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>角色管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('权限分类','admin-cate.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限分类</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('权限管理','admin-rule.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限管理</cite></a>
                    </li>
                </ul>
            </li>--%>

            <%-- <li>
                 <a href="javascript:;">
                     <i class="iconfont left-nav-li" lay-tips="售后">&#xe6a2;</i>
                     <cite>售后</cite>
                     <i class="iconfont nav_right">&#xe697;</i></a>
                 <ul class="sub-menu">
                     <li>
                         <a onclick="xadmin.add_tab('问题描述','/Desc/problemDescInfo')">
                             <i class="iconfont">&#xe6a4;</i>
                             <cite>问题描述</cite></a>
                     </li>
                 </ul>
                &lt;%&ndash; <security:authorize access="hasRole('project')">
                     <a href="javascript:;">
                         <i class="iconfont left-nav-li" lay-tips="售后">&#xe6a2;</i>
                         <cite>售后</cite>
                         <i class="iconfont nav_right">&#xe697;</i></a>
                     <ul class="sub-menu">
                         <li>
                             <a onclick="xadmin.add_tab('问题描述','/Desc/problemDescInfo')">
                                 <i class="iconfont">&#xe6a4;</i>
                                 <cite>问题描述</cite></a>
                         </li>
                     </ul>
                 </security:authorize>&ndash;%&gt;
             </li>--%>

            <security:authorize access="hasAuthority('ROLE_AFTER_SALE')">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont left-nav-li" lay-tips="售后">&#xe6a2;</i>
                        <cite>售后</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                    <ul class="sub-menu">
                            <%--<li>
                                <a onclick="xadmin.add_tab('问题描述','/Desc/problemDescInfo',true)">
                                    <i class="iconfont">&#xe6a4;</i>
                                    <cite>问题描述</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('问题解决','/Solu/problemSoluInfo',true)">
                                    <i class="iconfont">&#xe82a;</i>
                                    <cite>问题解决</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('问题描述2','/problemDesc/problemDescInfo',true)">
                                    <i class="iconfont">&#xe82a;</i>
                                    <cite>问题描述2</cite></a>
                            </li>--%>
                        <li>
                            <a onclick="xadmin.add_tab('售后问题','/Question/getAllQuestions',true)">
                                <i class="layui-icon layui-icon-survey"></i>
                                <cite>问题列表</cite></a>
                        </li>
                        <li>
                            <a onclick="xadmin.add_tab('任务分配','/Task/AllTask',true)">
                                <i class="layui-icon layui-icon-release"></i>
                                <cite>任务列表</cite></a>
                        </li>
                        <li>
                            <a onclick="xadmin.add_tab('文件上传','/UploadFile/toUploadFile',true)">
                                <i class="layui-icon">&#xe67c;</i>
                                <cite>文件上传</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('饼状图','/Chart/toChartList1',true)">
                                <i class="layui-icon layui-icon-picture-fine"></i>
                                <cite>饼状图</cite></a>
                        </li>


                        <li>
                            <a onclick="xadmin.add_tab('柱状图','/Chart/toChartList2',true)">
                                <i class="layui-icon layui-icon-picture-fine"></i>
                                <cite>柱状图</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('线状图','/Chart/toChartList3',true)">
                                <i class="layui-icon layui-icon-picture-fine"></i>
                                <cite>线状图</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('线状对比图','/Chart/toChartList4',true)">
                                <i class="layui-icon layui-icon-picture-fine"></i>
                                <cite>线状对比图</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('显示数据饼状图','/Chart/toChartList5',true)">
                                <i class="layui-icon layui-icon-picture-fine"></i>
                                <cite>显示数据饼状图</cite></a>
                        </li>

                        <li>
                            <a onclick="xadmin.add_tab('柱状对比图','/Chart/toChartList6',true)">
                                <i class="layui-icon layui-icon-picture-fine"></i>
                                <cite>柱状对比图</cite></a>
                        </li>
                            <%--<a title="查看" onclick="xadmin.open('编辑','order-view.html')" href="javascript:;">
                                <i class="layui-icon">&#xe63c;</i></a>
                            <cite>问题解决情况</cite></a>--%>
                    </ul>
                </li>
            </security:authorize>

            <%--多余导航栏--%>
            <%--<li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>
                    <cite>系统统计</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('拆线图','echarts1.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>拆线图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('拆线图','echarts2.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>拆线图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('地图','echarts3.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>地图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('饼图','echarts4.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>饼图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('雷达图','echarts5.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>雷达图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('k线图','echarts6.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>k线图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('热力图','echarts7.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>热力图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('仪表图','echarts8.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>仪表图</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="图标字体">&#xe6b4;</i>
                    <cite>图标字体</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('图标对应字体','unicode.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>图标对应字体</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>
                    <cite>其它页面</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="login.html" target="_blank">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>登录页面</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('错误页面','error.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>错误页面</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('示例页面','demo.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>示例页面</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('更新日志','log.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>更新日志</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="第三方组件">&#xe6b4;</i>
                    <cite>layui第三方组件</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('滑块验证','https://fly.layui.com/extend/sliderVerify/')" target="">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>滑块验证</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('富文本编辑器','https://fly.layui.com/extend/layedit/')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>富文本编辑器</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('eleTree 树组件','https://fly.layui.com/extend/eleTree/')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>eleTree 树组件</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('图片截取','https://fly.layui.com/extend/croppers/')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>图片截取</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('formSelects 4.x 多选框','https://fly.layui.com/extend/formSelects/')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>formSelects 4.x 多选框</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('Magnifier 放大镜','https://fly.layui.com/extend/Magnifier/')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>Magnifier 放大镜</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('notice 通知控件','https://fly.layui.com/extend/notice/')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>notice 通知控件</cite></a>
                    </li>
                </ul>
            </li>--%>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
</body>
</html>
