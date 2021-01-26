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
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon"/>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <%--<!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".pic").click(function () {
                var _this = $(this);//将当前的pimg元素作为_this传入函数
                imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
            });
        });

        $(function () {
            $("#exportDescInfo").click(function () {
                window.location.href = "${pageContext.request.contextPath}/Excel/Question";
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
    <script type="text/javascript">
        $(function () {
            $('#queryBtn').click(function () {
                let input = $("#input").val();
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/Question/toSreach",
                    data: {
                        inputMsg: input
                    },
                    success: function (data) {
                        if (data.success) {
                            window.location.href = '${pageContext.request.contextPath}/Question/query';
                        } else {
                            layer.msg("没有找到此项目，请重新输入");
                        }
                    }
                });
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            /*let elementById = document.getElementById("status");*/
            for (let i = 0; i < ${QuestionList.size()}; i++) {
                let msg = $(".td-status span")[i].innerText;
                let result = "已处理";

                if (msg == result) {
                    /*alert(1)*/
                    $(".td-status span").eq(i).addClass('layui-btn-disabled');
                }
            }
        })
        ;

        function member_stop(obj, index, id) {
            layer.confirm('您确定已完成吗?', {btn: ['确定', '取消'], title: "提示"}, function () {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/Question/toUpdateStatus",
                    data: {
                        QS_OpenClose: index,
                        QS_ID: id
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            if (index == 1) {
                                layer.msg('已完成，请勿重复点击！', {icon: 7, time: 2000});
                            } else {
                                layer.msg("修改成功", {icon: 1, time: 3000});
                                window.setTimeout("window.location.href = '${pageContext.request.contextPath}/Question/updateStatus'", 500);
                            }
                        } else {
                            layer.msg('修改失败', {icon: 2});
                        }
                    }
                });
            });
        }
    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            if ("${sessionScope.addQuestion}" > 0) {
                var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                parent.layer.close(index);
                parent.location.reload();
            }
            <% session.removeAttribute("addQuestion");%>

            if ("${sessionScope.updateQuestion}" > 0) {
                var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                parent.layer.close(index);
                parent.location.reload();
            }
            <% session.removeAttribute("updateQuestion");%>
        });
    </script>


</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="${pageContext.request.contextPath}/Question/getAllQuestions">售后</a>
            <a><cite>售后问题</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>



<div class="layui-fluid" style="padding-top: 10px">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-lg12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <input id="input" type="text" name="input" placeholder="请输入项目ID" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="sreach" id="queryBtn"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <a class="layui-btn  layui-btn-radius"
                       onclick="xadmin.open('添加售后问题','/Question/toAddQuestion',window.outerWidth*0.5,window.outerHeight*0.5)"><i
                            class="layui-icon"></i>添加</a>

                    <button type="button" id="exportDescInfo" value="导出Excel表"
                            class="layui-btn  layui-btn-radius layui-btn-warm">
                        <i class="layui-icon  layui-icon-export"></i>导出到Excel表
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>项目编号</th>
                            <th>问题编号</th>
                            <%--<th>问题描述</th>--%>
                            <th>责任人</th>
                            <th>责任部门</th>
                            <th>图片补充描述</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>创建人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${QuestionList }" var="question">
                            <tr>
                                    <%-- <td><input type="checkbox" lay-filter="" name="subcheck" id="subcheck"
                                                lay-skin="primary" style="visibility: hidden"/></td>--%>
                                <td>${question.QS_PRJCode}</td>
                                <td>${question.QS_QuestionID}</td>
                               <%-- <td>${question.QS_Description}</td>--%>
                                <td>${question.QS_Responer}</td>
                                <td>${question.QS_SupportDept}</td>
                                <td>
                                    <c:if test="${question.QS_AddressInfo !=null }">
                                        <img id="images" alt="图片" src="/upload/${question.QS_AddressInfo}"
                                             class="pic">
                                    </c:if>
                                </td>
                                <td class="td-status" id="status">
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
                                <td class=" td-manage">
                                    <a onclick="parent.xadmin.add_tab('委派任务','/Task/toAddTask/${question.QS_ID}',true)"><i
                                            class="layui-icon" title="分配任务"></i></a>
                                    </a>
                                    <a title="查看"
                                       onclick="parent.xadmin.add_tab('查看详细信息','/QusetionAndTask/Check/${question.QS_ID}')"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe63c;</i></a>
                                    <a title="编辑"
                                       onclick="xadmin.open('编辑','/Question/toUpdateQuestion/${question.QS_ID}',673,870)"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="删除" href="/Question/deleteQuestion/${question.QS_ID}"
                                       onclick="return window.confirm('确定要删除吗？')">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="16">${pageNav}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="outerdiv"
     style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
    <div id="innerdiv" style="position:absolute;">
        <img id="bigimg" style="border:5px solid #fff;" src=""/>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;
        /*// 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });*/

        //选中后的回调
        laydate.render({
            elem: '#start'
            , done: function (value, date) {
                //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
            , theme: "molv"
        });


        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
            , done: function (value, date) {
                //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
            , theme: "molv"
        });

        function batchDeletes() {
            //判断至少写了一项
            var checkedNum = $("input[name='subcheck']:checked").length;
            if (checkedNum == 0) {
                alert("请至少选择一项!");
                return false;
            }
            if (confirm("确定删除所选项目?")) {
                var checkedList = new Array();
                $("input[name='subcheck']:checked").each(function () {
                    checkedList.push($(this).val());
                });
                $.ajax({
                    type: "POST",
                    url: "web/user/batchDeletes.action",
                    data: {"delitems": checkedList.toString()},
                    datatype: "html",
                    success: function (data) {
                        $(":checkbox").attr("checked", false);
                        art.dialog.tips('删除成功!');
                        setTimeout("location.reload()", 1000);//页面刷新
                    },
                    error: function (data) {
                        art.dialog.tips('删除失败!');
                    }
                });
            }
        }
    });
</script>
</html>
