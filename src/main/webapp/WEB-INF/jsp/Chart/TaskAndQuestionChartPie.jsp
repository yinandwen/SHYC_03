<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/7
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="mainChart" style="width: 600px;height:400px;" class="layui-inline"></div>
<div id="mainChart2" style="width: 600px;height:400px ;margin-left: 20px; background: grey" class="layui-inline"></div>
<%--<div id="mainChart2" style="width: 600px;height:400px ;margin-top: 20px; background: grey" ></div>--%>
<script type="text/javascript">
    $.ajax({
        method: 'post',
        url: '${pageContext.request.contextPath}/Chart/pie',
        dataType: 'json',
        success: function (data) {//data格式:[{name:启用用户,value:60},{name:未启用用户,value:30}]
            initChat(data);
        }
    });

    function initChat(data) {
        var myChart = echarts.init(document.getElementById('mainChart'));
        option = {
            backgroundColor: '#cccccc',
            color: ["#D53A35", "#296294"],
            title: {
                text: '任务详情',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: formatData(data).xAxData
            },
            series: [{
                name: '任务比例',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                color: ['#ffff00', '#ff00ff'],
                data: formatData(data).serData,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }]
        };
        myChart.setOption(option, true);
    };

    function formatData(data) {
        var xAxData = [];//任务完成/任务未完成
        var serData = [];//数值

        for (var i = 0; i < data.length; i++) {
            xAxData.push(data[i].name || "");
            serData.push({
                name: data[i].name,
                value: data[i].value || 0
            });
        }
        return {
            xAxData: xAxData,
            serData: serData
        };
    };
</script>

<script type="text/javascript">
    //基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mainChart1'));
    var names = [];
    var values = [];
    $.ajax({
        method: 'get',
        url: '${pageContext.request.contextPath}/Chart/PieQuestion',
        dataType: 'json',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                names.push(data[i].name);
                values[i] = {value: data[i].value, name: data[i].name};
            }
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '问题详情',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    bottom: 2,
                    left: 'center',
                    data: names,
                },
                series: [
                    {
                        name: '问题',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '50%'],
                        data: values,
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option, true);
        }
    });
</script>

<script type="text/javascript">
    //基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mainChart2'));
    var names = [];
    var values = [];
    $.ajax({
        method: 'get',
        url: '${pageContext.request.contextPath}/Chart/PieQuestion1',
        dataType: 'json',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                names.push(data[i].name);
                values[i] = {value: data[i].value, name: data[i].name};
            }
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '问题详情',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    bottom: 2,
                    left: 'center',
                    data: names,
                },
                series: [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius: ['40%', '70%'],
                        avoidLabelOverlap: false,
                        itemStyle: {
                            borderRadius: 10,
                            borderColor: '#fff',
                            borderWidth: 2
                        },
                        label: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            label: {
                                show: true,
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        },
                        labelLine: {
                            show: false
                        },
                        data: values,
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option, true);
        }
    });
</script>
</body>
</html>
