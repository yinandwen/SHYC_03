<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/4
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".pic").click(function () {
                var _this = $(this);//将当前的pimg元素作为_this传入函数
                imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
            });
        });

        function imgShow(outerdiv, innerdiv, bigimg, _this) {
            var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
            $(bigimg).attr("src", src);//设置#bigimg元素的src属性
            /*获取当前点击图片的真实大小，并显示弹出层及大图*/
            $("<img/>").attr("src", src).load(function () {
                var windowW = $(window).width();//获取当前窗口宽度
                var windowH = $(window).height();//获取当前窗口高度
                var realWidth = this.width;//获取图片真实宽度
                var realHeight = this.height;//获取图片真实高度
                var imgWidth, imgHeight;
                var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
                if (realHeight > windowH * scale) {//判断图片高度
                    imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放
                    imgWidth = imgHeight / realHeight * realWidth;//等比例缩放宽度
                    if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度
                        imgWidth = windowW * scale;//再对宽度进行缩放
                    }
                } else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度
                    imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放
                    imgHeight = imgWidth / realWidth * realHeight;//等比例缩放高度
                } else {//如果图片真实高度和宽度都符合要求，高宽不变
                    imgWidth = realWidth;
                    imgHeight = realHeight;
                }
                $(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放
                var w = (windowW - imgWidth) / 2;//计算图片与窗口左边距
                var h = (windowH - imgHeight) / 2;//计算图片与窗口上边距
                $(innerdiv).css({"top": h, "left": w});//设置#innerdiv的top和left属性
                $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
            });
            $(outerdiv).click(function () {//再次点击淡出消失弹出层
                $(this).fadeOut("fast");
            });
        }
    </script>
</head>
<body>
<%--展示问题开始--%>
<div class="layui-card-body layui-table-body layui-table-main layui-col-lg12">
    <div class="layui-inline">
        <h4 style="color: red">问题基础信息：</h4>
    </div>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>

    <hr/>
    <div class="layui-col-lg12" style="background: #d3d3d3">
        <div class=" layui-col-xs2"><span>责任部门：</span>
            <td>${question.QS_SupportDept}</td>
        </div>
        <div class=" layui-col-xs2"><span>责任人：</span>
            <td>${question.QS_Responer}</td>
        </div>
        <div class=" layui-col-xs2">
            <td>
                <span <c:if
                        test="${question.QS_ReasonType != '' || quesiton.QS_ReasonType != null}">>原因类型：${question.QS_ReasonType}</c:if></span>
            </td>
        </div>
        <div class=" layui-col-xs2">
            <td>
                <span <c:if
                        test="${question.QS_ActionType != '' || quesiton.QS_ActionType != null}">>措施类型：${question.QS_ActionType}</c:if></span>
            </td>
        </div>
        <div class=" layui-col-xs2"><span>问题状态：</span>
            <td class="td-status" id="status">
                <c:choose>
                    <c:when test="${question.QS_OpenClose  == 0 }">
                        <span style="color: red">待处理</span>
                    </c:when>
                    <c:otherwise>
                        <span style="color: green">已处理</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </div>
        <div class=" layui-col-xs2"><span>创建时间：</span>
            <td>${question.QS_CREATED_TIME}</td>
        </div>
        <div class=" layui-col-xs4">
            <td>
                <span <c:if
                        test="${question.QS_Reason != '' || quesiton.QS_Reason != null}">>原因描述：${question.QS_Reason}</c:if></span>
            </td>
        </div>

        <div class=" layui-col-xs4">
            <td>
                <span <c:if
                        test="${question.QS_Action != '' || quesiton.QS_Action != null}">>措施描述：${question.QS_Action}</c:if></span>
            </td>
        </div>
        <div class=" layui-col-xs4">
            <td>
                <span <c:if
                        test="${question.QS_Note != '' || quesiton.QS_Note != null}">>备注信息：${question.QS_Note}</c:if></span>
            </td>
        </div>
    </div>
</div>
<hr style="border: 1px solid"/>
<div class=" layui-col-lg12">
    <h4 style="color: red ; padding-left: 15px"><span class="layui-col-xs8">具体的问题描述：</span><span class="layui-col-xs4">图片描述：</span>
    </h4>
    <div class="layui-col-xs8" style="padding-left: 15px;">
        <div class="layui-inline"><span>问题描述：</span>
            <td>
                ${question.QS_Description}xs
            </td>
        </div>
    </div>
    <div class="layui-col-xs4" style="padding-left: 20px">
        <div class="layui-inline">
            <td>
                <c:if test="${question.QS_AddressInfo !=null }">
                    <c:forEach items="${imageList}" var="image">
                        <img id="images" alt="图片" src="/upload/${image}" class="pic layui-col-xs2">
                    </c:forEach>
                </c:if>
            </td>
        </div>
    </div>
</div>
<%--展示问题结束--%>

<hr style="border: 1px solid"/>

<%--
添加任务开始
--%>
<div class="layui-fluid layui-col-lg12" >
    <div class="box-header with-border layui-col-lg12">
        <i class="fa fa-cube"></i>
        <h3 class="box-title" style="color: red">添加任务</h3>
    </div>
    <div class="layui-row layui-col-lg12" style="padding-top: 10px">
        <form class="layui-form" action="/Task/addTask" method="post">
            <div class="layui-col-xs3">
                <label for="TK_PRJCode" class="layui-form-label">
                    <span class="x-red">*</span>项目编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_PRJCode" name="TK_PRJCode" required="" lay-verify="TK_PRJCode"
                           autocomplete="off"
                           class="layui-input" value="${TK_PRJCode}"></div>
            </div>

            <div class="layui-col-xs3">
                <label for="TK_QuestionID" class="layui-form-label">
                    <span class="x-red">*</span>问题编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_QuestionID" name="TK_QuestionID" required=""
                           lay-verify="TK_QuestionID"
                           autocomplete="off"
                           class="layui-input" value="${TK_QuestionID}"></div>
            </div>

            <div class="layui-col-xs3">
                <label for="TK_CODE" class="layui-form-label">
                    <span class="x-red">*</span>任务编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_CODE" name="TK_CODE" required="" lay-verify="TK_CODE"
                           autocomplete="off"
                           class="layui-input" placeholder="建议格式为:T-0001(表示任务1)"></div>
            </div>

            <div class="layui-col-xs3">
                <label for="TK_RESPONER" class="layui-form-label">
                    <span class="x-red">*</span>任务负责人</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_RESPONER" name="TK_RESPONER" required="" lay-verify="TK_RESPONER"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>


            <div class="layui-col-xs3" style="margin-top: 5px">
                <label for="TK_Department" class="layui-form-label">
                    <span class="x-red">*</span>负责的部门</label>
                <%--<div class="layui-input-inline">
                    <select name="TK_Department" id="TK_Department" lay-verify="TK_Department"
                            value="${task.TK_Department}">
                        <option selected="selected" disabled>请选择部门--</option>
                        <option>项目部</option>
                        <option>人事部</option>
                        <option>IT部</option>
                        <option>市场部</option>
                        <option>财务部</option>
                    </select>
                </div>--%>
                <div class="layui-input-inline layui-show-xs-block">
                    <select name="TK_Department" id="TK_Department" lay-verify="TK_Department"
                            value="${task.TK_Department}">
                        <option selected="selected" disabled>请选择部门--</option>
                        <option>项目部</option>
                        <option>人事部</option>
                        <option>IT部</option>
                        <option>市场部</option>
                        <option>财务部</option>
                    </select>
                </div>

            </div>

            <div class="layui-col-xs3" style="margin-top: 5px">
                <label for="TK_START_DATE" class="layui-form-label">
                    <span class="x-red">*</span>任务开始</label>
                <div class="layui-input-inline">
                    <input class="layui-input"
                           value="<fmt:formatDate value="${task.TK_START_DATE}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                           autocomplete="off"
                           name="TK_START_DATE" id="TK_START_DATE" lay-verify="TK_START_DATE" required="">
                </div>
            </div>

            <div class="layui-col-xs3" style="margin-top: 5px">
                <label for="TK_END_DATE" class="layui-form-label">
                    <span class="x-red">*</span>任务结束</label>
                <div class="layui-input-inline">
                    <input class="layui-input"
                           value="<fmt:formatDate value="${task.TK_END_DATE}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                           autocomplete="off"
                           name="TK_END_DATE" id="TK_END_DATE" lay-verify="TK_END_DATE" required="">
                </div>
            </div>

            <div class="layui-col-xs3" style="margin-top: 5px">
                <label for="TK_CREATED_BY" class="layui-form-label">
                    <span class="x-red">*</span>创建人</label>
                <div class="layui-input-inline">
                    <input type="text" id="TK_CREATED_BY" name="TK_CREATED_BY" required=""
                           lay-verify="TK_CREATED_BY"
                           autocomplete="off"
                           class="layui-input" value="${username}"></div>
            </div>

            <div class="layui-col-xs11" style="margin-top: 5px">
                <label for="TK_DETAILS" class="layui-form-label">
                    <span class="x-red">*</span>任务内容</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="TK_DETAILS" lay-verify="TK_DETAILS" required=""
                              id="TK_DETAILS"></textarea>
                </div>
            </div>


            <div class="layui-form-item layui-input-inline" style="padding-left: 600px;margin-top: 5px">
                <input class="layui-btn" type="submit" value="添加"<%-- onclick="xadmin.close()"--%>/></div>
            <div class="layui-form-item layui-input-inline" style="margin-left: 10px;margin-top: 5px">
                <input class="layui-btn" type="reset" value="重置"<%-- onclick="xadmin.close()"--%>/></div>
        </form>
    </div>
</div>
<%--
    添加任务结束
--%>
<hr style="border: 1px solid"/>

<%--展示任务开始--%>

<div class="layui-fluid layui-col-lg12" style=" margin-top: 10px">
    <div class="box-header with-border">
        <i class="fa fa-cube"></i>
        <h3 class="box-title" style="color: red">任务展示</h3>
    </div>
    <iframe src='/Task/AllTaskQuestion' frameborder="0" scrolling="auto" class="x-iframe layui-col-xs12" height="100%"
            style="overflow-x:scroll">
    </iframe>
</div>
<%--展示任务结束--%>

<%--图片的放大缩小功能--%>
<div id="outerdiv"
     style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
    <div id="innerdiv" style="position:absolute;">
        <img id="bigimg" style="border:5px solid #fff;" src=""/>
    </div>
</div>
</body>
</html>
<script>
    layui.use(['laydate','form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

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
        form.render();
    });
</script>
