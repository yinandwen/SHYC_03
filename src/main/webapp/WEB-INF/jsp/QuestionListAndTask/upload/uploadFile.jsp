<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/17
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avatar.png" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>
<div class="layui-upload">
    <div class="layui-upload-list">
        <table class="layui-table">
            <thead>
            <tr>
                <th>文件名</th>
                <th>大小</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="demoList"></tbody>
        </table>
    </div>
    <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" id="testList"><i
            class="layui-icon layui-icon-add-1"></i>选择多文件
    </button>
    <button type="button" class="layui-btn layui-btn-radius " id="testListAction"><i
            class="layui-icon layui-icon-upload"></i>开始上传
    </button>

    <hr>

    <form method="get" action="/DownLoad/downLoadFile">
        <input type="file" value="filename" name="filename" class="layui-btn layui-btn-radius ">
        <input type="submit" value="下载" class="layui-btn layui-btn-radius ">
    </form>

</div>
<hr>
<script>

    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
        //多文件列表示例
        var demoListView = $('#demoList')
            , uploadListIns = upload.render({
            elem: '#testList'
            , url: '${pageContext.request.contextPath}/UploadFile/uploadDocs'
            , accept: 'file'
            , method: 'post'
            , multiple: true
            , auto: false
            , bindAction: '#testListAction'
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function (index, file, result) {
                    var tr = $(['<tr id="upload-' + index + '">'
                        , '<td>' + file.name + '</td>'
                        , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                        , '<td>等待上传</td>'
                        , '<td>'
                        , '<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        , '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        , '<button class="layui-btn layui-btn-xs layui-btn-warm demo-download">下载</button>'
                        , '</td>'
                        , '</tr>'].join(''));
                    //单个重传
                    tr.find('.demo-reload').on('click', function () {
                        obj.upload(index, file);
                    });
                    //删除
                    tr.find('.demo-delete').on('click', function () {
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });
                    demoListView.append(tr);
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) { //上传成功
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
                console.log(res);//服务器响应信息
                console.log(index);//当前文件的索引
                console.log(upload);//重新上传的方法
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                console.log(index);//当前文件的索引
                console.log(upload);//重新上传的方法
            }
        });
    });
</script>
</body>
</html>


