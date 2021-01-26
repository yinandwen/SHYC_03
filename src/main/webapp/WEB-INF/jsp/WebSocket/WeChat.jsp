<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="/lib/layui/css/layui.css"></script>
<script src="/lib/layui/layui.js"></script>
<body>
<div style="margin-left: 10px">
    <h1>聊天室</h1>
    <textarea id="txtArea" rows="10" cols="100">

		</textarea>
    <br />
    <input id="txtInput" type="text" /> <button id="sendBtn">发送消息</button>

</div>

<script>
    layui.use('layim', function(layim){
        //先来个客服模式压压精
        layim.config({
            brief: true //是否简约模式（如果true则不显示主面板）
        }).chat({
            name: '客服姐姐'
            ,type: 'friend'
            ,avatar: 'http://tp1.sinaimg.cn/5619439268/180/40030060651/1'
            ,id: -2
        });
    });
</script>
</body>
</html>