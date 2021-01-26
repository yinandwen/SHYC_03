<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/5
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form class="layui-form" action="/Question/addQuestion" method="post" enctype="multipart/form-data">
            <div class="layui-form-item layui-inline">
                <label for="QS_PRJCode" class="layui-form-label">
                    <span class="x-red">*</span>项目编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="QS_PRJCode" name="QS_PRJCode" required="" lay-verify="QS_PRJCode"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>

            <div class="layui-form-item layui-inline">
                <label for="QS_QuestionID" class="layui-form-label">
                    <span class="x-red">*</span>问题编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="QS_QuestionID" name="QS_QuestionID" required="" lay-verify="QS_QuestionID"
                           autocomplete="off"
                           class="layui-input" placeholder="建议格式为:Q-0001(表示问题1)"></div>
            </div>

            <div class="layui-form-item layui-inline">
                <label for="QS_Responer" class="layui-form-label">
                    <span class="x-red">*</span>负责人</label>
                <div class="layui-input-inline">
                    <input type="text" id="QS_Responer" name="QS_Responer" required="" lay-verify="QS_Responer"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>

            <div class="layui-form-item layui-inline">
                <label for="QS_SupportDept" class="layui-form-label">
                    <span class="x-red">*</span>负责部门</label>
                <div class="layui-input-inline">
                    <select name="QS_SupportDept" id="QS_SupportDept" required="" lay-verify="QS_SupportDept">
                        <option disabled="disabled" selected>请选择--</option>
                        <option>项目部</option>
                        <option>人事部</option>
                        <option>IT部</option>
                        <option>市场部</option>
                        <option>财务部</option>
                    </select>
                </div>
            </div>



            <div class="layui-form-item layui-inline">
                <label for="QS_ReasonType" class="layui-form-label">
                    <span class="x-red"></span>原因类型</label>
                <div class="layui-input-inline">
                    <input type="text" id="QS_ReasonType" name="QS_ReasonType"  lay-verify="QS_ReasonType"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>

            <div class="layui-form-item layui-inline">
                <label for="QS_ActionType" class="layui-form-label">
                    <span class="x-red"></span>措施类型</label>
                <div class="layui-input-inline">
                    <input type="text" id="QS_ActionType" name="QS_ActionType"  lay-verify="QS_ActionType"
                           autocomplete="off"
                           class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="QS_Description" class="layui-form-label">
                    <span class="x-red">*</span>问题描述</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="QS_Description" required lay-verify="QS_Description" id="QS_Description"></textarea></div>
            </div>

            <div class="layui-form-item">
                <label for="QS_Reason" class="layui-form-label">
                    <span class="x-red"></span>原因描述</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="QS_Reason" lay-verify="QS_Reason" id="QS_Reason"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="QS_Action" class="layui-form-label">
                    <span class="x-red"></span>措施描述</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="QS_Action" lay-verify="QS_Action" id="QS_Action"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="QS_AddressInfo" class="layui-form-label">
                    <span class="x-red"></span>图片补充描述</label>
                <div class="layui-input-block">
                    <input type="file" id="QS_AddressInfo" name="file"  lay-verify="file" autocomplete="off"
                           class="layui-input" multiple="multiple"></div>
            </div>
            <div class="layui-form-item">
                <label for="QS_Note" class="layui-form-label">
                    <span class="x-red"></span>备注信息</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="QS_Note" lay-verify="QS_Note" id="QS_Note"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="QS_CREATED_BY" class="layui-form-label">
                    <span class="x-red">*</span>创建人</label>
                <div class="layui-input-block">
                    <input type="text" id="QS_CREATED_BY" name="QS_CREATED_BY" lay-verify="QS_CREATED_BY"
                           autocomplete="off"
                           class="layui-input" value="${username}"></div>
            </div>

            <div class="layui-form-item layui-input-inline" style="padding-left: 300px;">
                <input class="layui-btn" type="submit" value="添加"<%-- onclick="xadmin.close()"--%>/></div>
            <div class="layui-form-item layui-input-inline" style="margin-left: 20px">
                <input class="layui-btn" type="reset" value="重置"<%-- onclick="xadmin.close()"--%>/></div>
        </form>
    </div>
</div>
</body>
</html>
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
                    {field: 'po_ID', title: '订单编号', sort: true , totalRowText:'合计'},
                    {field: 'po_CUSTOMER', title: '用户名称', sort: true},
                    {field: 'po_FullNameCustomer', title: '用户全称', sort: true},
                    {field: 'po_NAME', title: '订单名称', sort: true},
                    {field: 'po_PRJCODE', title: '项目号', sort: true, edit: "text"},
                    {field: 'po_PROTYPE', title: '产品类型', sort: true},
                    {field: 'po_Details', title: '制作内容', sort: true},
                    {field: 'po_ShipTo', title: '交付地址', sort: true},
                    {field: 'po_SALESMAN', title: '销售员', sort: true},
                    {field: 'po_SUMS', title: '合同金额', sort: true,totalRow:true},
                    {field: 'po_ARRIVED_SUMS', title: '回款金额', sort: true,totalRow:true},
                    {field: 'po_PAYMENT_TIMES', title: '应收期数', sort: true},
                    {field: 'po_ARRIVED_TIMES', title: '已付期数', sort: true},
                    {field: 'po_AmountOutTax', title: '净值金额', sort: true,totalRow:true},
                    {field: 'po_Digou', title: '代购设备', sort: true},
                    {field: 'po_NOTE', title: '订单备注', sort: true},
                    {
                        field: 'po_CREATED_TIME',
                        title: '签订时间',
                        templet: "<div>{{layui.util.toDateString(d.po_CREATED_TIME, 'yyyy-MM-dd')}}</div>",
                        sort: true
                    },
                    {fixed: 'right', width: 220, align: 'center', toolbar: '#barDemo'}
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

            form.render();
        });
</script>





