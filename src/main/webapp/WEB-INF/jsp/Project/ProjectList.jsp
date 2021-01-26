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
    <script src="https://cdn.staticfile.org/echarts/4.7.0/echarts.min.js"></script>
</head>
<body>


<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" id="searchForm" lay-filter="searchForm">
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="开始日" name="start" id="start"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="TreeSearchBySelect">
                                <option selected disabled>项目状态</option>
                                <option value="待立项">待立项</option>
                                <option value="待启动">待启动</option>
                                <option value="已交付">已交付</option>
                                <option value="暂停">暂停</option>
                                <option value="进行中">进行中</option>
                                <option value="已终验">已终验</option>
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
                <%--<div id="mainChart" style="width: 600px;height:400px; padding-top: 50px ; text-align: center"></div>--%>
            </div>
        </div>
    </div>
</div>
<div id="test13" class="demo-tree-more" style="margin-top: 20px "></div>
<div class="layui-fluid">
    <table id="projects" lay-filter="projects"></table>
</div>
<script type="text/html" id="ProjectSituationStyle">
    {{#  if(d.prj_SITUATION === '待启动'){ }}
    <span style="color: #F581B1;">{{ d.prj_SITUATION}}</span>
    {{#  } else if(d.prj_SITUATION === '已终验'){ }}
    <span style="color: green;">{{ d.prj_SITUATION}}</span>
    {{#  } }}
    {{#  if(d.prj_SITUATION === '进行中'){ }}
    <span style="color: red;">{{ d.prj_SITUATION}}</span>
    {{#  } else { }}
    {{#  } }}
</script>

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
            <%--<div class="layui-inline">
                <label class="layui-form-label">序号</label>
                <div class="layui-input-inline">
                    <input type="text" name="PRJ_ID" id="PRJ_ID" lay-verify="required" autocomplete="off"
                           placeholder="请输入项目编号" class="layui-input">
                </div>
            </div>--%>
            <input type="hidden" id="PRJ_ID" name="PRJ_ID"/>
            <div class="layui-inline">
                <label class="layui-form-label">项目编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="PRJ_CODE" id="PRJ_CODE" lay-verify="required" autocomplete="off"
                           placeholder="请输入项目编号" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">项目名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_NAME" id="PO_NAME" lay-verify="required"
                           autocomplete="off" placeholder="请输入项目名称" class="layui-input" readonly>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">产品类型</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_PROTYPE" id="PO_PROTYPE" lay-verify="required" readonly
                           autocomplete="off" placeholder="请输入产品类型" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">项目经理</label>
                <div class="layui-input-inline">
                    <input type="text" name="PRJ_MANAGER_ID" id="PRJ_MANAGER_ID" lay-verify="required"
                           autocomplete="off" placeholder="请输入项目经理" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">启动日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="PRJ_START_DATE" id="PRJ_START_DATE" lay-verify="PRJ_START_DATE"
                           autocomplete="off" placeholder="请输入启动日期" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">完成日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="PRJ_DELIVERY_DATE" id="PRJ_DELIVERY_DATE" lay-verify="PRJ_DELIVERY_DATE"
                           autocomplete="off" placeholder="请输入完成日期" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">项目状态</label>
                <div class="layui-input-inline">
                    <select name="PRJ_SITUATION" id="PRJ_SITUATION" required>
                        <option disabled>项目状态</option>
                        <option value="待启动" selected>待启动</option>
                        <option value="已交付">已交付</option>
                        <option value="暂停">暂停</option>
                        <option value="进行中">进行中</option>
                        <option value="已终验">已终验</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">任务数量</label>
                <div class="layui-input-inline">
                    <input type="text" name="PRJ_ALL_TASKS" id="PRJ_ALL_TASKS" lay-verify="number"
                           autocomplete="off" placeholder="请输入任务数量" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">项目内容</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_Details" id="PO_Details" lay-verify="required" readonly
                           autocomplete="off" placeholder="请输入项目内容" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_CUSTOMER" id="PO_CUSTOMER" lay-verify="required" readonly
                           autocomplete="off" placeholder="请输入客户名称" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">销售人员</label>
                <div class="layui-input-inline">
                    <input type="text" name="PO_SALESMAN" id="PO_SALESMAN" lay-verify="required" readonly
                           autocomplete="off" placeholder="请输入销售人员" class="layui-input">
                </div>
            </div>

        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">订单备注</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入订单备注" name="PO_NOTE" class="layui-textarea" readonly></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">订单编号</label>
            <div class="layui-input-inline">
                <input type="text" name="PO_ID" id="PO_ID" lay-verify="number" readonly
                       autocomplete="off" placeholder="请输入订单编号" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">订单编号</label>
            <div class="layui-input-inline">
                <input type="text" name="PRJ_FINISH_RATE" id="PRJ_FINISH_RATE" lay-verify="number" readonly
                       autocomplete="off" placeholder="请输入订单编号" class="layui-input">
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

<%--<!--任务添加和修改的弹出层开始-->--%>
<div id="addTaskDiv" style="display: none;padding: 0.3125rem">
    <form method="post" class="layui-form layui-form-pane" lay-filter="taskForm" id="taskForm">
        <div class="layui-form-item">
            <%--<input type="hidden" name="TK_ID" id="TK_ID"/>--%>
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
                <div class="layui-input-inline ">
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
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="add">立项</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-radius layui-btn-xs" lay-event="addTask">任务</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.all.js"></script>
<script>
    layui.use(['laydate', 'table', 'form', 'laypage', 'tree', 'element'],
        function () {
            var laydate = layui.laydate;
            var table = layui.table;
            var form = layui.form;
            var laypage = layui.laypage;
            var element = layui.element;


            var tableIns = table.render({
                elem: "#projects",
                title: "项目管理表",
                url: "${pageContext.request.contextPath}/Project/QueryProject",
                toolbar: 'default', //  默认的头工具栏事件
                cellMinWidth: 110, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                page: true,
                /*request:{
                  pageName:'PageIndex',
                  limitName:'PageSize'
                },*/
                //totalRow: true, //开启合计行
                limit: 10,
                cols: [[
                    {type: 'checkbox'},
                    //{field: 'prj_ID', title: '序号', sort: true},
                    {field: 'prj_CODE', title: '项目编号', sort: true, totalRowText: '合计'},
                    {field: 'po_NAME', title: '项目名称', sort: true},
                    {field: 'po_PROTYPE', title: '产品类型', sort: true},
                    {field: 'prj_MANAGER_ID', title: '项目经理', sort: true},
                    {
                        field: 'prj_START_DATE',
                        title: '启动日期',
                        sort: true,
                        templet: "<div>{{d.prj_START_DATE == null ? '' : layui.util.toDateString(d.prj_START_DATE, 'yyyy-MM-dd')}}</div>",
                        edit: "text"
                    },
                    {
                        field: 'prj_DELIVERY_DATE',
                        title: '完成日期',
                        templet: "<div>{{d.prj_DELIVERY_DATE == null ? '' : layui.util.toDateString(d.prj_DELIVERY_DATE, 'yyyy-MM-dd')}}</div>",
                        sort: true
                    },
                    {
                        field: 'prj_SITUATION',
                        title: '项目状态',
                        sort: true,
                        style:'text-align:center',
                        templet: '#ProjectSituationStyle'
                    },
                    {field: 'prj_ALL_TASKS', title: '任务数量', sort: true},
                    {field: 'po_Details', title: '项目内容', sort: true},
                    {field: 'po_CUSTOMER', title: '客户名称', sort: true, totalRow: true},
                    {field: 'po_SALESMAN', title: '销售人员', sort: true, totalRow: true},
                    {field: 'po_NOTE', title: '订单备注', sort: true},
                    {field: 'po_ID', title: '订单编号', sort: true},
                    {
                        field: 'prj_FINISH_RATE',
                        title: '项目进度',
                        sort: true,
                       /* templet: function(data){
                            var ys = '';
                            if(30<data.prj_FINISH_RATE && data.prj_FINISH_RATE<100){
                                ys='layui-bg-primary'
                            }else if(0<=data.prj_FINISH_RATE && data.prj_FINISH_RATE<=30){
                                ys='layui-bg-red'
                            }
                            var html = '<div class="layui-progress layui-progress-big" lay-showpercent="true">';
                            html += '<div class="layui-progress-bar '+ys+'" lay-percent="' + data.prj_FINISH_RATE + '%"></div>';
                            html += '</div>';
                            return html ;
                        }*/
                        templet: function (d) {
                            var ys = '';
                            if(30<d.prj_FINISH_RATE && d.prj_FINISH_RATE<100){
                                ys='layui-bg-primary'
                            }else if(0<=d.prj_FINISH_RATE && d.prj_FINISH_RATE<=30){
                                ys='layui-bg-red'
                            }
                            return '<div class="layui-progress layui-progress-big" lay-showpercent="true"><div class="layui-progress-bar '+ys+'" lay-percent="'+d.prj_FINISH_RATE+'%"></div></div><br>'
                        }
                    },
                    {fixed: 'right', title: '操作', width: 290, align: 'center', toolbar: '#barDemo'}
                ]],
                done: function () {
                    element.render();
                }
            });

            // 监听部门搜索操作
            form.on('submit(search)', function (data) {
                var params = $("#searchForm").serialize();
                //执行搜索重载
                table.reload('projects', {
                    page: {
                        curr: 1
                    },
                    url: '${pageContext.request.contextPath}/Project/queryBySearch/' + params
                });

                return false;
            });


            // 定义全局变量
            var mainIndex;
            var url;

            // 打开添加用户弹出层
            function openAddUser(data) {
                mainIndex = layer.open({
                    type: 1,
                    title: '项目立项',
                    content: $("#addOrUpdateDiv"),
                    area: ['60%', '80%'],
                    success: function (index) {
                        // 显示提示信息
                        /* layer.tips("登陆用户名无需之编写，也可修改!!!", "#loginname", {tipsMore: true});

                         layer.tips("点击此处选中相应的部门哦!!!!", "#doDataFromSelectDept", {tipsMore: true});*/
                        // 设置跳转地址
                        url = "${pageContext.request.contextPath}/Project/addProject";
                        console.log(JSON.stringify(data))
                        form.val("dataForm", {
                            "PO_NAME": data.po_NAME
                            ,
                            "PRJ_START_DATE": data.prj_START_DATE == null || data.prj_START_DATE == "" ? '' : layui.util.toDateString(data.prj_START_DATE, "yyyy-MM-dd")
                            ,
                            "PRJ_DELIVERY_DATE": data.prj_DELIVERY_DATE == null || data.prj_DELIVERY_DATE == "" ? '' : layui.util.toDateString(data.prj_DELIVERY_DATE, "yyyy-MM-dd")
                            ,
                            "PO_PROTYPE": data.po_PROTYPE
                            ,
                            "PO_Details": data.po_Details
                            ,
                            "PO_CUSTOMER": data.po_CUSTOMER
                            ,
                            "PO_SALESMAN": data.po_SALESMAN
                            ,
                            "PO_NOTE": data.po_NOTE
                            ,
                            "PO_ID": data.po_ID
                        });
                        // 重置表单
                        //$("#dataForm")[0].reset();
                    }
                });
            }

            // 打开修改用户的弹出层
            function openUpdateUser(data) {
                mainIndex = layer.open({
                    type: 1,
                    title: data.prj_CODE == null || data.prj_CODE == "" ? '修改【' + data.po_ID + '】号订单' : '修改【' + data.prj_CODE + '】号项目',
                    content: $("#addOrUpdateDiv"),
                    area: ['60%', '80%'],
                    success: function (index) {
                        url = "${pageContext.request.contextPath}/Project/updateProject";
                        //装载数据表格
                        //layer.alert(JSON.stringify(data))
                        //$('#po_SUMS').val(data.po_SUMS);
                        console.log(JSON.stringify(data))
                        form.val("dataForm", {
                            "PRJ_ID": data.prj_ID

                            , "PRJ_CODE": data.prj_CODE
                            ,
                            "PO_NAME": data.po_NAME
                            ,
                            "PO_PROTYPE": data.po_PROTYPE
                            ,
                            "PO_Details": data.po_Details
                            ,
                            "PRJ_MANAGER_ID": data.prj_MANAGER_ID
                            ,
                            "PRJ_START_DATE": data.prj_START_DATE == null || data.prj_START_DATE == "" ? '' : layui.util.toDateString(data.prj_START_DATE, "yyyy-MM-dd")
                            ,
                            "PRJ_DELIVERY_DATE": data.prj_DELIVERY_DATE == null || data.prj_DELIVERY_DATE == "" ? '' : layui.util.toDateString(data.prj_DELIVERY_DATE, "yyyy-MM-dd")
                            ,
                            "PRJ_SITUATION": data.prj_SITUATION
                            ,
                            "PRJ_ALL_TASKS": data.prj_ALL_TASKS
                            ,
                            "PO_Details": data.po_Details
                            ,
                            "PO_CUSTOMER": data.po_CUSTOMER
                            ,
                            "PO_SALESMAN": data.po_SALESMAN
                            ,
                            "PO_NOTE": data.po_NOTE
                            ,
                            "PO_ID": data.po_ID
                        });
                    }
                });
            }

            // 打开添加任务的弹出层
            function openAddTask(data) {
                mainIndex = layer.open({
                    type: 1,
                    title: '任务分配',
                    content: $("#addTaskDiv"),
                    area: ['60%', '80%'],
                    success: function (index) {
                        url = "${pageContext.request.contextPath}/TaskPool/addTask"
                        //装载数据表格
                        //layer.alert(JSON.stringify(data))
                        //$('#po_SUMS').val(data.po_SUMS);
                        //console.log(JSON.stringify(data))
                        form.val("taskForm", {
                            "TK_PRJCode": data.prj_CODE

                            , "TK_PRJName": data.po_NAME
                        });
                    }
                });
            }

            // 监听 添加和修改的提交
            form.on("submit(doSubmit)", function (data) {
                let params = $("#dataForm").serialize();
                console.log(params);
                //layer.msg(JSON.stringify(params),{icon:6},{timeout:3000});
                // 提交数据
                $.post(url, params, function (res) {
                    //layer.msg(JSON.stringify(res))
                    if (res.code == 0) {
                        layer.msg(res.msg);
                        tableIns.reload();
                    } else {
                        layer.msg(res.msg);
                    }
                    layer.close(mainIndex);
                })
                return false;
            });

            // 监听添加任务的提交
            form.on("submit(doAddTask)", function (data) {
                let params = $("#taskForm").serialize();
                // 提交数据
                $.post(url, params, function (res) {
                    if (res.code == 0) {
                        layer.msg(res.msg);
                        tableIns.reload();
                    } else {
                        layer.msg(res.msg)
                    }
                    layer.close(mainIndex);
                });
                return false;
            });


            //监听头工具栏事件，默认
            /*table.on('toolbar(projects)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id)
                    , data = checkStatus.data; //获取选中的数据
                switch (obj.event) {
                    case 'add':
                        //layer.msg('添加');
                        openAddUser(data);
                        //layer.msg("添加成功", {icon: 1, time: 3000});
                        break;
                    case 'update':
                        if (data.length === 0) {
                            layer.msg('请选择一行');
                        } else if (data.length > 1) {
                            layer.msg('只能同时编辑一个');
                        } else {
                            openUpdateUser(data);
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
            });*/


            //监听行工具事件
            table.on('tool(projects)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === 'add') {
                    //layer.msg("添加操作")
                    if (data.prj_CODE != null) {
                        layer.msg("已立项，请勿重复点击", {icon: 7}, {timeout: 3000})
                    } else {
                        //layer.msg(JSON.stringify(data))
                        openAddUser(data);
                    }
                } else if (layEvent === 'detail') {
                    layer.msg('查看操作');
                } else if (layEvent === 'del') {
                    layer.confirm('真的删除【' + data.po_ID + '】这个订单吗？', function (index) {
                        $.post("${pageContext.request.contextPath}/Orders/deleteOrder", {
                            PRJ_ID: data.prj_ID
                        }, function (res) {
                            layer.msg(res.msg);
                            obj.del();
                            layer.close(index);
                        })
                    });
                } else if (layEvent === 'edit') {
                    if (data.prj_CODE == null) {
                        layer.msg('项目还没有立项，如果想要修改，请移步到订单页面', {icon: 6}, {timeout: 3000})
                    } else {
                        layer.msg('编辑操作');
                        openUpdateUser(data);
                    }
                } else if (layEvent === 'addTask') {
                    openAddTask(data);
                }
            });

            //监听单元格编辑
            table.on('edit(projects)', function (obj) {
                var value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field; //得到字段
                layer.msg('[ID: ' + data.po_ID + '] ' + field + ' 字段更改为：' + value);
                openUpdateUser(data);
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#PRJ_START_DATE' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#PRJ_DELIVERY_DATE' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });
            laydate.render({
                elem: '#start' //指定元素
                , theme: '#000000'
                , done: function (value, date) {
                    //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });
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

</html>