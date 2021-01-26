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
                <div class="layui-card-body layui-col-md8">
                    <form class="layui-form layui-col-space5" id="searchForm" lay-filter="searchForm">
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="开始日" name="start" id="start"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="contrller">
                                <option selected disabled>支付方式</option>
                                <option>支付宝</option>
                                <option>微信</option>
                                <option>货到付款</option>
                            </select>
                        </div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="contrller">
                                <option selected disabled>订单状态</option>
                                <option value="0">待确认</option>
                                <option value="1">已确认</option>
                                <option value="2">已收货</option>
                                <option value="3">已取消</option>
                                <option value="4">已完成</option>
                                <option value="5">已作废</option>
                            </select>
                        </div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input type="text" id="SearchInput" name="SearchInput" placeholder="请输入订单号"
                                   autocomplete="off"
                                   class="layui-input"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="search">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-col-md4" id="mainChart"
                     style="height:400px; padding-top: 50px ; text-align: center"></div>
            </div>
        </div>
    </div>
</div>
<div class="layui-fluid">
    <table id="orders" lay-filter="orders"></table>
</div>


<%--<!--添加和修改的弹出层开始-->--%>
<div id="addOrUpdateDiv" style="display: none;padding: 0.3125rem">
    <form method="post" class="layui-form layui-form-pane" lay-filter="dataForm" id="dataForm">
        <%--<div class="layui-form-item" id="div_pid">
            <label class="layui-form-label">所属部门</label>
            <div class="layui-input-inline">
               &lt;%&ndash; <!-- 存储部门id 修改等操作 -->&ndash;%&gt;
                <input type="hidden" name="deptid" id="deptid" />
                <input type="text" id="deptid_name" readonly="readonly" autocomplete="off"
                       placeholder="请选择所属部门" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <a class="layui-btn layui-btn-warm" id="doDataFromSelectDept"><label
                        class="layui-icon layui-icon-male"></label>选择</a>
            </div>
        </div>--%>
        <div class="layui-form-item">
            <input type="hidden" name="PO_ID" id="PO_ID"/>
            <div class="layui-inline">
                <label class="layui-form-label">客户简称</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_CUSTOMER" id="PO_CUSTOMER" lay-verify="required" autocomplete="off"
                           placeholder="请输入客户简称" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户全称</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_FullNameCustomer" id="PO_FullNameCustomer" lay-verify="required"
                           autocomplete="off" placeholder="请输入客户全称" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">订单名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_NAME" id="PO_NAME" lay-verify="required"
                           autocomplete="off" placeholder="请输入订单名称" class="layui-input">
                </div>
            </div>

            <%--            <div class="layui-inline">--%>
            <%--                <label class="layui-form-label">项目号</label>--%>
            <%--                <div class="layui-input-inline">--%>
            <%--                    <input type="text" name="PO_PRJCODE" id="PO_PRJCODE" lay-verify="required"--%>
            <%--                           autocomplete="off" placeholder="请输入项目号" class="layui-input">--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <div class="layui-inline">
                <label class="layui-form-label">产品类型</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_PROTYPE" id="PO_PROTYPE" lay-verify="required"
                           autocomplete="off" placeholder="请输入产品类型" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">销售人员</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_SALESMAN" id="PO_SALESMAN" lay-verify="required"
                           autocomplete="off" placeholder="请输入销售人员姓名" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">交货日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_DeliveyA" id="PO_DeliveyA" lay-verify="required"
                           autocomplete="off" placeholder="请输入交货日期" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_SUMS" id="PO_SUMS" lay-verify="number"
                           autocomplete="off" placeholder="请输入合同金额" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">回款金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_ARRIVED_SUMS" id="PO_ARRIVED_SUMS" lay-verify="number"
                           autocomplete="off" placeholder="请输入回款金额" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">应收期数</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_PAYMENT_TIMES" id="PO_PAYMENT_TIMES" lay-verify="number"
                           autocomplete="off" placeholder="请输入应收期数" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">已付期数</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_ARRIVED_TIMES" id="PO_ARRIVED_TIMES" lay-verify="number"
                           autocomplete="off" placeholder="请输入已付期数" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">净值金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_AmountOutTax" id="PO_AmountOutTax" lay-verify="number"
                           autocomplete="off" placeholder="请输入净值金额" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">代购设备</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_Digou" id="PO_Digou" lay-verify="required"
                           autocomplete="off" placeholder="请输入代购设备" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">交货地址</label>
            <div class="layui-input-block">
                <input type="text" name="PO_ShipTo" autocomplete="off" placeholder="请输入交货地址"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">制作内容</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入制作内容" name="PO_Details" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单备注</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入订单备注" name="PO_NOTE" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">签订日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_CREATED_TIME" id="PO_CREATED_TIME" lay-verify="required"
                           autocomplete="off" placeholder="请选择签订日期" class="layui-input">
                </div>
            </div>
        </div>
        <%-- <div class="layui-form-item">
             <div class="layui-inline">
                 <label class="layui-form-label">用户性别</label>
                 <div class="layui-input-inline">
                     <input type="radio" name="sex" value="1" title="男" checked="checked"
                            class="layui-input">
                     <input type="radio" name="sex" value="0" title="女" class="layui-input">
                 </div>
             </div>
         </div>--%>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center;">
                <a class="layui-btn " lay-submit="" lay-filter="doSubmit"><label
                        class="layui-icon layui-icon-release"></label>提交</a>
                <a class="layui-btn layui-btn-warm" onclick="javascript:$('#dataForm')[0].reset()"
                   lay-filter="data-search-btn"><label class="layui-icon layui-icon-refresh"></label>重置</a>
            </div>
        </div>
    </form>
</div>
<%--<!--添加和修改的弹出层结束-->--%>

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
                elem: "#orders",
                title: "订单管理表",
                url: "${pageContext.request.contextPath}/Orders/QueryOrders",
                toolbar: 'default', //  默认的头工具栏事件
                cellMinWidth: 110, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                page: true,
                totalRow: true, //开启合计行
                limit: 10,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'po_ID', title: '订单编号', sort: true, totalRowText: '合计'},
                    {field: 'po_CUSTOMER', title: '用户名称', sort: true},
                    {field: 'po_FullNameCustomer', title: '用户全称', sort: true},
                    {field: 'po_NAME', title: '订单名称', sort: true},
                    {field: 'po_PRJCODE', title: '项目号', sort: true, edit: "text"},
                    {field: 'po_PROTYPE', title: '产品类型', sort: true},
                    {field: 'po_Details', title: '制作内容', sort: true},
                    {
                        field: 'po_DeliveyA',
                        title: '交付时间',
                        templet: "<div>{{d.po_DeliveyA == null ? '' : layui.util.toDateString(d.po_DeliveyA, 'yyyy-MM-dd')}}</div>",
                        sort: true,
                    },
                    {field: 'po_ShipTo', title: '交付地址', sort: true},
                    {field: 'po_SALESMAN', title: '销售员', sort: true},
                    {field: 'po_SUMS', title: '合同金额', sort: true, totalRow: true},
                    {field: 'po_ARRIVED_SUMS', title: '回款金额', sort: true, totalRow: true},
                    {field: 'po_PAYMENT_TIMES', title: '应收期数', sort: true},
                    {field: 'po_ARRIVED_TIMES', title: '已付期数', sort: true},
                    {field: 'po_AmountOutTax', title: '净值金额', sort: true, totalRow: true},
                    {field: 'po_Digou', title: '代购设备', sort: true},
                    {field: 'po_NOTE', title: '订单备注', sort: true},
                    {
                        field: 'po_CREATED_TIME',
                        title: '签订时间',
                        templet: "<div>{{d.po_CREATED_TIME == null ? '' : layui.util.toDateString(d.po_CREATED_TIME, 'yyyy-MM-dd')}}</div>",
                        sort: true
                    },
                    {fixed: 'right', title: '操作', width: 220, align: 'center', toolbar: '#barDemo'}
                ]],
                /* response: {
                     statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
                 }
                 , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                     return {
                         "code": res.code, //解析接口状态
                         "msg": res.message, //解析提示文本
                         "count": res.total, //解析数据长度
                         "data": res.data //解析数据列表
                     };
                 }
 */
            });

            // 监听部门搜索操作
            form.on('submit(search)', function (data) {
                var params = $("#searchForm").serialize();
                //执行搜索重载
                table.reload('orders', {
                    page: {
                        curr: 1
                    },
                    url: '${pageContext.request.contextPath}/Orders/queryBySearch/' + params
                });

                return false;
            });


            //头工具栏事件，自定义
            /*table.on('toolbar(orders)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选' : '未全选');
                        break;

                    //自定义头工具栏右侧图标 - 提示
                    case 'LAYTABLE_TIPS':
                        layer.alert('这是工具栏右侧自定义的一个图标按钮');
                        break;
                }
                ;
            });*/

            // 定义全局变量
            var mainIndex;
            var url;

            // 打开添加用户弹出层
            function openAddUser() {
                mainIndex = layer.open({
                    type: 1.,
                    title: '添加订单',
                    content: $("#addOrUpdateDiv"),
                    area: ['60%', '80%'],
                    success: function (index) {
                        // 显示提示信息
                        layer.tips("登陆用户名无需之编写，也可修改!!!", "#loginname", {tipsMore: true});

                        layer.tips("点击此处选中相应的部门哦!!!!", "#doDataFromSelectDept", {tipsMore: true});

                        // 设置跳转地址
                        url = "${pageContext.request.contextPath}/Orders/addOrder";
                        // 重置表单
                        $("#dataForm")[0].reset();
                        /* // 查询最大排序码
                         $.get("
                        ${pageContext.request.contextPath}/user/queryUserMaxOrderNum", function (res) {
                            $("#ordernum").val(res.data);
                        })*/
                    }
                });
            }

            // 打开修改用户的弹出层
            function openUpdateUser(data) {
                mainIndex = layer.open({
                    type: 1,
                    title: '修改【' + data.po_ID + '】号订单',
                    content: $("#addOrUpdateDiv"),
                    area: ['60%', '80%'],
                    success: function (index) {
                        url = "${pageContext.request.contextPath}/Orders/updateOrder";
                        //装载数据表格
                        //layer.alert(JSON.stringify(data))
                        //$('#po_SUMS').val(data.po_SUMS);
                        console.log(JSON.stringify(data))
                        form.val("dataForm", {
                            "PO_ID": data.po_ID
                            , "PO_CUSTOMER": data.po_CUSTOMER
                            , "PO_FullNameCustomer": data.po_FullNameCustomer
                            , "PO_NAME": data.po_NAME
                            , "PO_PRJCODE": data.po_PRJCODE
                            , "PO_PROTYPE": data.po_PROTYPE
                            , "PO_Details": data.po_Details
                            , "PO_DeliveyA": layui.util.toDateString(data.po_DeliveyA, "yyyy-MM-dd")
                            , "PO_ShipTo": data.po_ShipTo
                            , "PO_SALESMAN": data.po_SALESMAN
                            , "PO_SUMS": data.po_SUMS
                            , "PO_ARRIVED_SUMS": data.po_ARRIVED_SUMS
                            , "PO_PAYMENT_TIMES": data.po_PAYMENT_TIMES
                            , "PO_ARRIVED_TIMES": data.po_ARRIVED_TIMES
                            , "PO_AmountOutTax": data.po_AmountOutTax
                            , "PO_Digou": data.po_Digou
                            , "PO_NOTE": data.po_NOTE
                            , "PO_CREATED_TIME": layui.util.toDateString(data.po_CREATED_TIME, "yyyy-MM-dd")
                        });
                        //根据部门ID查询部门名称
                        /* $.get("
                        ${pageContext.request.contextPath}/dept/getDeptById", {
                            id: data.deptid
                        }, function (res) {
                            console.log(res)
                            $("#deptid_name").val(res.data.title);
                        });*/
                    }
                });
            }

            // 监听 添加和修改的提交
            form.on("submit(doSubmit)", function (data) {
                var params = $("#dataForm").serialize();
                console.log(JSON.stringify(params))
                // 提交数据
                $.post(url, params, function (res) {
                    /*layer.msg(JSON.stringify(res))*/
                    if (res.code == 0) {
                        layer.msg(res.msg);
                        tableIns.reload();
                    }
                    layer.close(mainIndex);
                })
                return false;
            });


            //监听头工具栏事件，默认
            table.on('toolbar(orders)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id)
                    , data = checkStatus.data; //获取选中的数据
                switch (obj.event) {
                    case 'add':
                        layer.msg('添加');
                        openAddUser();
                        break;
                    case 'update':
                        if (data.length === 0) {
                            layer.msg('请选择一行');
                        } else if (data.length > 1) {
                            layer.msg('只能同时编辑一个');
                        } else {
                            openUpdateUser(data);
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
            table.on('tool(orders)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === 'add') {
                    layer.msg("添加操作")
                    openAddUser();
                } else if (layEvent === 'detail') {
                    layer.msg('查看操作');
                } else if (layEvent === 'del') {
                    layer.confirm('真的删除【' + data.po_ID + '】这个订单吗？', function (index) {
                        $.post("${pageContext.request.contextPath}/Orders/deleteOrder", {
                            PO_ID: data.po_ID
                        }, function (res) {
                            layer.msg(res.msg);
                            obj.del();
                            layer.close(index);
                        })
                    });
                } else if (layEvent === 'edit') {
                    layer.msg('编辑操作');
                    openUpdateUser(data);
                }
            });

            //监听单元格编辑
            table.on('edit(orders)', function (obj) {
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
                elem: '#PO_CREATED_TIME'
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            laydate.render({
                elem: '#PO_DeliveyA'
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
            url: '${pageContext.request.contextPath}/Orders/Chart/Line',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var values = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    values.push(obj.value);
                });
                var options = {
                    title: {
                        text: '',
                        show: true, // 是否显示标题
                        subtext: '订单情况',
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
                        data: ['订单']
                    },
                    // X轴
                    xAxis: {
                        data: names // 异步请求时,这里要置空
                    },
                    // Y轴
                    yAxis: {},
                    series: [{
                        name: '订单',
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
                    }],
                };
                myChart.setOption(options)
            }
        });
    });
</script>

</html>