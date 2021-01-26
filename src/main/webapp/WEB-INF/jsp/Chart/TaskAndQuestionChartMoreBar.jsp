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
<script type="text/javascript">
    $(function () {
        var myChart = echarts.init(document.getElementById('mainChart'));

// 异步请求加载数据
        $.ajax({
            url: '${pageContext.request.contextPath}/Chart/DoubleBar',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var values = [];
                var numbers = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    values.push(obj.value);
                    numbers.push(obj.number);
                });
                var options = {
                    title: {
                        text: '任务/问题',
                        show: true, // 是否显示标题
                        subtext: '任务问题对比图',
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
                        data: ['任务', '问题']
                    },
                    // X轴
                    xAxis: {
                        data: names // 异步请求时,这里要置空
                    },
                    // Y轴
                    yAxis: {},
                    series: [{
                        name: '任务',
                        type: 'bar', // 设置图表类型为柱状图
                        data: values, // 设置纵坐标的刻度(异步请求时,这里要置空)
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
                        }
                    }, {
                        name: '问题',
                        type: 'bar', // 设置图表类型为柱状图
                        data: numbers, // 设置纵坐标的刻度(异步请求时,这里要置空)
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
                        } // 设置纵坐标的刻度(异步请求时,这里要置空)
                    }],
                };
                myChart.setOption(options)
            }
        });
    });
</script>
</body>
</html>
