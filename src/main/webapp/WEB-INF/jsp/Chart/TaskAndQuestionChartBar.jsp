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
    <script src="https://cdn.staticfile.org/echarts/4.7.0/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="mainChart" style="width: 600px;height:400px; padding-top: 50px"></div>
<div id="mainChart1" style="width: 600px;height:400px; padding-top: 50px"></div>
<script type="text/javascript">
    $(function () {
        // 初始化

        // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；
        //var myChart = echarts.init($('#mainChart')[0]);

        var myChart = echarts.init(document.getElementById('mainChart'));

        // 配置图标参数
        var options = {
            title: {
                text: '任务详情',
                show: true, // 是否显示标题
                subtext: '任务个数',
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
                data: ['任务详情']
            },
            // X轴
            xAxis: {
                data: [] // 异步请求时,这里要置空
            },
            // Y轴
            yAxis: {},
            series: [{
                name: '任务',
                type: 'bar', // 设置图表类型为柱状图
                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
            }]
        };
        // 给图标设置配置的参数
        myChart.setOption(options);
        myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
        $.ajax({
            url: '${pageContext.request.contextPath}/Chart/bar',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var values = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    values.push(obj.value);
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['任务']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '任务',
                        type: 'bar', // 设置图表类型为柱状图
                        data: values // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        // 初始化

        // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；
        //var myChart = echarts.init($('#mainChart')[0]);

        var myChart = echarts.init(document.getElementById('mainChart1'));

        // 配置图标参数
        var options = {
            title: {
                text: '问题详情',
                show: true, // 是否显示标题
                subtext: '问题个数',
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
                data: ['问题详情']
            },
            // X轴
            xAxis: {
                data: [] // 异步请求时,这里要置空
            },
            // Y轴
            yAxis: {},
            series: [{
                name: '问题',
                type: 'bar', // 设置图表类型为柱状图
                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
            }]
        };
        // 给图标设置配置的参数
        myChart.setOption(options);
        myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
        $.ajax({
            url: '${pageContext.request.contextPath}/Chart/barQuestion',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var values = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    values.push(obj.value);
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['问题']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '问题',
                        type: 'bar', // 设置图表类型为柱状图
                        data: values // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>
</body>
</html>
