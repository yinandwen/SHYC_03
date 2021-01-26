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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="https://cdn.staticfile.org/echarts/4.7.0/echarts.min.js"></script>
</head>
<body>


<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <form class="layui-form layui-col-space5" id="searchForm" lay-filter="searchForm">
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="开始日" name="start" id="start"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="contrller">
                                <option selected disabled>任务状态</option>
                                <option value="PCT">制程任务</option>
                                <option value="PMT">款项任务</option>
                                <option value="AST">售后任务</option>
                                <option value="TBD">其他任务</option>
                            </select>
                        </div>
                        <%--<div class="layui-input-inline layui-show-xs-block">
                            <select name="contrller">
                                <option selected disabled>订单状态</option>
                                <option value="0">待确认</option>
                                <option value="1">已确认</option>
                                <option value="2">已收货</option>
                                <option value="3">已取消</option>
                                <option value="4">已完成</option>
                                <option value="5">已作废</option>
                            </select>
                        </div>--%>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input type="text" id="SearchInput" name="SearchInput" placeholder="请输入订单号"
                                   autocomplete="off"
                                   class="layui-input"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="search">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                        <%--<div class="layui-input-inline layui-show-xs-block">
                            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
                               onclick="location.reload()" title="刷新">
                                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
                        </div>--%>
                    </form>
                </div>
            </div>
        </div>
        <div class="layui-col-md6" id="mainChart"
             style="height:400px; padding-top: 10px ; text-align: center"></div>
    </div>

</div>

<div class="layui-fluid">
    <table id="taskPools" lay-filter="taskPools"></table>
</div>

<%--<!--任务添加和修改的弹出层开始-->--%>
<%--<!--任务添加和修改的弹出层开始-->--%>
<div id="addTaskDiv" style="display: none;padding: 0.3125rem">
    <form method="post" class="layui-form layui-form-pane" lay-filter="taskForm" id="taskForm">
        <div class="layui-form-item">
            <input type="hidden" name="TK_ID" id="TK_ID"/>
            <div class="layui-inline">
                <label class="layui-form-label">项目编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_PRJCode" id="TK_PRJCode" lay-verify="required" autocomplete="off"
                           placeholder="请输入项目编号" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">项目名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_PRJName" id="TK_PRJName" lay-verify="required" autocomplete="off"
                           placeholder="请输入项目名称" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">任务类别</label>
                <div class="layui-input-inline">
                    <select name="TK_TaskType" id="TK_TaskType">
                        <option value="PCT" selected>制程任务</option>
                        <option value="PMT">款项任务</option>
                        <option value="AST">售后任务</option>
                        <option value="TBD">其他任务</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">任务编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_CODE" id="TK_CODE" lay-verify="required" autocomplete="off"
                           placeholder="请输入任务编号" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">任务名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_NAME" id="TK_NAME" lay-verify="required"
                           autocomplete="off" placeholder="请输入任务名称" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">计划开始日</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_START_DATE" id="TK_START_DATE" lay-verify="required"
                           autocomplete="off" placeholder="请输入计划开始日" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">计划完成日</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_END_DATE" id="TK_END_DATE" lay-verify="required"
                           autocomplete="off" placeholder="请输入计划完成日" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">责任人</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_RESPONER" id="TK_RESPONER" lay-verify="required"
                           autocomplete="off" placeholder="请输入责任人" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">实际开始日</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_ACTUAL_STARTDAY" id="TK_ACTUAL_STARTDAY" lay-verify="required"
                           autocomplete="off" placeholder="请输入实际开始日" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">实际完成日</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_ACTUAL_ENDDAY" id="TK_ACTUAL_ENDDAY" lay-verify="required"
                           autocomplete="off" placeholder="请输入实际完成日" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">任务进度</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_PROGRESS" id="TK_PROGRESS" lay-verify="required"
                           autocomplete="off" placeholder="请输入任务进度" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">备注信息</label>
                <div class="layui-input-inline">
                    <input type="text" name="TK_DETAILS" id="TK_DETAILS" lay-verify="required"
                           autocomplete="off" placeholder="请输入备注信息" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center;">
                <a class="layui-btn " lay-submit="" lay-filter="doAddTask"><label
                        class="layui-icon layui-icon-release"></label>提交</a>
                <a class="layui-btn layui-btn-warm" onclick="javascript:$('#taskForm')[0].reset()"
                   lay-filter="data-search-btn"><label class="layui-icon layui-icon-refresh"></label>重置</a>
            </div>
        </div>
    </form>
</div>
<%--<!--任务添加和修改的弹出层结束-->--%>

<%--自定义的头工具栏事件--%>
<%--
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
--%>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="add">添加</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.all.js"></script>
<script>
    layui.use(['laydate', 'table', 'form', 'laypage'],
        function () {
            var laydate = layui.laydate;
            var table = layui.table;
            var form = layui.form;
            var laypage = layui.laypage;


            var tableIns = table.render({
                elem: "#taskPools",
                title: "任务管理表",
                url: "${pageContext.request.contextPath}/TaskPool/QueryTask",
                toolbar: 'default', //  默认的头工具栏事件
                cellMinWidth: 110, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                page: true,
                totalRow: true, //开启合计行
                limit: 10,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'tk_PRJCode', title: '项目号', sort: true},
                    {field: 'tk_PRJName', title: '项目名称', sort: true},
                    {field: 'tk_CODE', title: '任务编号', sort: true, totalRowText: '合计'},
                    {field: 'tk_NAME', title: '任务名称', sort: true},
                    {
                        field: 'tk_START_DATE',
                        title: '计划开始日',
                        sort: true,
                        templet: "<div>{{d.tk_START_DATE == null ? '' : layui.util.toDateString(d.tk_START_DATE, 'yyyy-MM-dd')}}</div>",
                    },
                    {
                        field: 'tk_END_DATE',
                        title: '计划完成日',
                        sort: true,
                        templet: "<div>{{d.tk_END_DATE == null ? '' : layui.util.toDateString(d.tk_END_DATE, 'yyyy-MM-dd')}}</div>",
                    },
                    {field: 'tk_RESPONER', title: '责任人', sort: true, edit: "text"},
                    {
                        field: 'tk_ACTUAL_STARTDAY',
                        title: '实际开始日',
                        sort: true,
                        templet: "<div>{{d.tk_ACTUAL_STARTDAY == null ? '' : layui.util.toDateString(d.tk_ACTUAL_STARTDAY, 'yyyy-MM-dd')}}</div>",
                    },
                    {
                        field: 'tk_ACTUAL_ENDDAY',
                        title: '实际完成日',
                        sort: true,
                        templet: "<div>{{d.tk_ACTUAL_ENDDAY == null ? '' : layui.util.toDateString(d.tk_ACTUAL_ENDDAY, 'yyyy-MM-dd')}}</div>",
                    },
                    {
                        field: 'tk_STATUS',
                        title: '任务状态',
                        sort: true,
                        event:  'change_TK_STATUS',
                        style:'text-align:center',
                        //templet: "<div>{{d.tk_STATUS == 0 ? '未开始' : '已完成'}}</div>"
                        templet: function (data) {
                            if (data.tk_STATUS == 0) {
                                var btn = ' <button type="button" class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius" lay-filter="TK_STATUS">未完成</button>';
                            } else {
                                var btn = ' <button type="button" class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-filter="TK_STATUS">已完成</button>';
                            }
                            return btn
                        }
                    },
                    {field: 'tk_PROGRESS', title: '任务进度', sort: true},
                    {field: 'tk_DETAILS', title: '备注信息', sort: true},
                    {fixed: 'right', title: '操作', width: 230, align: 'center', toolbar: '#barDemo'}
                ]],

            });

            // 监听部门搜索操作
            form.on('submit(search)', function (data) {
                var params = $("#searchForm").serialize();
                //执行搜索重载
                table.reload('taskPools', {
                    page: {
                        curr: 1
                    },
                    url: '${pageContext.request.contextPath}/TaskPool/queryBySearch/' + params
                });
                return false;
            });

            //监听任务状态的点击状态变更

            // 定义全局变量
            var mainIndex;
            var url;

            // 打开添加任务的弹出层
            function openAddTask() {
                mainIndex = layer.open({
                    type: 1,
                    title: '任务分配',
                    content: $("#addTaskDiv"),
                    area: ['60%', '70%'],
                    success: function (index) {
                        url = "${pageContext.request.contextPath}/TaskPool/addTask"
                        /*form.val("taskForm",{
                            "TK_PRJCode":data.tk_PRJCode,
                            "TK_PRJName":data.tk_PRJName
                        });*/
                        $("#taskForm")[0].reset();
                    }
                });
            }

            // 打开修改任务的弹出层
            function openUpdateTask(data) {
                mainIndex = layer.open({
                    type: 1,
                    title: '任务修改',
                    content: $("#addTaskDiv"),
                    area: ['60%', '70%'],
                    success: function (index) {
                        url = "${pageContext.request.contextPath}/TaskPool/updateTask"
                        form.val("taskForm", {
                            "TK_ID": data.tk_ID,
                            "TK_PRJCode": data.tk_PRJCode,
                            "TK_PRJName": data.tk_PRJName,
                            "TK_TaskType": data.tk_TaskType,
                            "TK_CODE": data.tk_CODE,
                            "TK_NAME": data.tk_NAME,
                            "TK_START_DATE": data.tk_START_DATE,
                            "TK_END_DATE": data.tk_END_DATE,
                            "TK_RESPONER": data.tk_RESPONER,
                            "TK_ACTUAL_STARTDAY": data.tk_ACTUAL_STARTDAY,
                            "TK_ACTUAL_ENDDAY": data.tk_ACTUAL_ENDDAY,
                            "TK_PROGRESS": data.tk_PROGRESS,
                            "TK_DETAILS": data.tk_DETAILS,
                        })
                    }
                });
            }

            // 监听添加任务的提交
            form.on("submit(doAddTask)", function (data) {
                let params = $("#taskForm").serialize();
                // 提交数据
                $.post(url, params, function (res) {
                    if (res.code == 0) {
                        layer.msg(res.msg)
                        tableIns.reload();
                    } else {
                        layer.msg(res.msg)
                    }
                    layer.close(mainIndex);
                });
                return false;
            });


            //监听头工具栏事件，默认
            table.on('toolbar(taskPools)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id)
                    , data = checkStatus.data; //获取选中的数据
                switch (obj.event) {
                    case 'add':
                        layer.msg('添加');
                        openAddTask();
                        break;
                    case 'update':
                        if (data.length === 0) {
                            layer.msg('请选择一行');
                        } else if (data.length > 1) {
                            layer.msg('只能同时编辑一个');
                        } else {
                            openUpdateTask(data)
                            form.val("dataForm", data);
                            form.render();
                            layer.alert('编辑 [id]：' + checkStatus.data[0].po_ID);
                            layer.alert(JSON.stringify(data));
                        }
                        break;
                    case 'delete':
                        if (data.length === 0) {
                            layer.msg('请选择一行');
                        } else {
                            layer.msg('删除');
                        }
                        break;
                }
                ;
            });


            //监听行工具事件
            table.on('tool(taskPools)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === 'add') {
                    layer.msg("添加操作")
                    openAddTask();
                } else if (layEvent === 'detail') {
                    layer.msg('查看操作');
                } else if (layEvent === 'del') {
                    layer.confirm('真的删除【' + data.tk_ID + '】这个任务吗？', function (index) {
                        $.post("${pageContext.request.contextPath}/TaskPool/deleteTask", {
                            TK_ID: data.tk_ID
                        }, function (res) {
                            layer.msg(res.msg);
                            obj.del();
                            layer.close(index);
                        })
                    });
                } else if (layEvent === 'edit') {
                    layer.msg('编辑操作');
                    openUpdateTask(data)
                }else if (layEvent === 'change_TK_STATUS'){
                    layer.msg("任务状态变更");
                    layer.confirm('确定【' + data.tk_CODE + '】任务已完成？', function (index) {
                        $.post("${pageContext.request.contextPath}/TaskPool/updateTaskStatus", {
                            TK_ID:data.tk_ID,
                            TK_STATUS:data.tk_STATUS
                        }, function (res) {
                            if(res.code == 0){
                                layer.msg(res.msg,{icon:1},{timeout:3000});
                                tableIns.reload();
                            }else if(res.code == -1){
                                layer.msg(res.msg,{icon:3},{timeout:3000});
                            }
                        })
                    });
                }
            });

            //监听单元格编辑
            table.on('edit(taskPools)', function (obj) {
                var value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field; //得到字段
                layer.msg('[ID: ' + data.po_ID + '] ' + field + ' 字段更改为：' + value);
                openUpdateUser(data);
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            laydate.render({
                elem: '#TK_START_DATE' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            laydate.render({
                elem: '#TK_END_DATE' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            laydate.render({
                elem: '#TK_ACTUAL_STARTDAY' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            laydate.render({
                elem: '#TK_ACTUAL_ENDDAY' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });
            laydate.render({
                elem: '#TK_UPDATED_TIME' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

        });


    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？',
            function (index) {

                if ($(obj).attr('title') == '启用') {

                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用');
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });

                } else {
                    $(obj).attr('title', '启用');
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 5,
                        time: 1000
                    });
                }

            });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？',
            function (index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
    }


    function delAll(argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？' + data,
            function (index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
    }
</script>

<script type="text/javascript">
    $(function () {
        var myChart = echarts.init(document.getElementById('mainChart'));
        // 异步请求加载数据
        $.ajax({
            url: '${pageContext.request.contextPath}/TaskPool/Chart/Bar',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var finish = [];
                var unfinish = [];
                var values = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    finish.push(obj.finish);
                    unfinish.push(obj.unfinish);
                    values.push(obj.value);
                });
                var options = {
                        title: {
                            text: '',
                            show: true, // 是否显示标题
                            subtext: '任务完成情况',
                            textStyle: {
                                fontSize: 18 // 标题文字大小
                            }
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'shadow'
                            }
                        },
                        legend: {
                            data: ['完成', '未完成', '任务总数']
                        },
                        // X轴
                        xAxis: {
                            data: names // 异步请求时,这里要置空
                        },
                        // Y轴
                        yAxis: {},
                        series: [
                            {
                                name: '完成',
                                type: 'bar', // 设置图表类型为柱状图
                                data: finish, // 设置纵坐标的刻度(异步请求时,这里要置空)
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: true,		//开启显示
                                            position: 'top',	//在上方显示
                                            textStyle: {	    //数值样式
                                                color: 'black',
                                                fontSize: 12
                                            }
                                        }
                                    }
                                }  // 设置纵坐标的刻度
                            },
                            {
                                name: '未完成',
                                type: 'bar', // 设置图表类型为柱状图
                                data: unfinish, // 设置纵坐标的刻度(异步请求时,这里要置空)
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: true,		//开启显示
                                            position: 'top',	//在上方显示
                                            textStyle: {	    //数值样式
                                                color: 'black',
                                                fontSize: 12
                                            }
                                        }
                                    }
                                }  // 设置纵坐标的刻度
                            },
                            {
                                name: '任务总数',
                                type: 'line', // 设置图表类型为柱状图
                                data: values, // 设置纵坐标的刻度(异步请求时,这里要置空)
                                symbol: 'circle',
                                symbolSize: 10,
                                // 展示曲线上的点
                                showSymbol: true,
                                // 让曲线更加圆滑
                                smooth: true,
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: true,		//开启显示
                                            position: 'top',	//在上方显示
                                            textStyle: {	    //数值样式
                                                color: 'black',
                                                fontSize: 12
                                            }
                                        }
                                    }
                                }  // 设置纵坐标的刻度
                            }
                        ]
                    }
                ;
                myChart.setOption(options)
            }
        });
    });
</script>

</html>