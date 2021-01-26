<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/28
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
<link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
<html>
<head>
    <title>上海营创</title>
</head>
<body>
<table  id="employee" lay-filter="employee"></table>


<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


</body>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>

<script type="text/javascript">
    layui.use(["table","form"],function(){
        var table = layui.table;
        table.render({
            elem: "#employee",
            title: "员工管理",
            url: "${pageContext.request.contextPath}/User/LayuiTable",
            toolbar: '#toolbarDemo' ,
            cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            page : true ,


            cols : [[
                {type:'checkbox' },
                {field : 'id'  , title : 'id' , sort:true},
                {field : 'username' , title : 'username' , sort:true},
                {field : 'realname' ,  title : 'realname' , sort:true},
                {field : 'password' ,  title : 'password' , sort:true},
                {field : 'createDate' , title : 'createDate' , sort:true},
                {field : 'lastLoginTime' ,  title : 'lastLoginTime' , sort:true},
                {field : 'enabled' ,  title : 'enabled' , sort:true},
                {field : 'accountNonExpired' ,  title : 'accountNonExpired' , sort:true},
                {field : 'accountNonLocked' ,  title : 'accountNonLocked' , sort:true},
                {field : 'credentialNonExpired' ,  title : 'credentialNonExpired' , sort:true},
                {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });


        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(employee)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });


</script>


</html>
