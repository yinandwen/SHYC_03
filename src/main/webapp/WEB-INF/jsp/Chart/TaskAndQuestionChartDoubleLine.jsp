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
        // 初始化

        // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

        var myChart = echarts.init(document.getElementById('mainChart'));

        // 配置图标参数
        var options = {
            title: {
                text: '任务/问题',
                show: true, // 是否显示标题
                subtext: '',
                textStyle: {
                    fontSize: 18 // 标题文字大小
                }
            },
            tooltip: {
                trigger: 'axis',
            },
            // X轴
            xAxis: {
               data:[] // 异步请求时,这里要置空
            },
            // Y轴
            yAxis: {
            },
            series: [{
                name: '任务和问题对比',
                type: 'line', // 设置图表类型为柱状图
                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
            }]
        };
        // 给图标设置配置的参数
        myChart.setOption(options);
        myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
        $.ajax({
            url: '${pageContext.request.contextPath}/Chart/DoubleLine',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                let names = [];     //已完成和未完成任务
                let values = [];    //已完成和未完成的个数
                let questions = []; //已完成和未完成问题
                let numbers = [];   //已完成和未完成个数

                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    values.push(obj.value);
                    questions.push(obj.question);
                    numbers.push(obj.number);
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['任务','问题']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '任务',
                        type: 'line', // 设置图表类型为柱状图
                        areaStyle: {normal: {}},
                        smooth: true,
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
                        }  // 设置纵坐标的刻度
                    },{
                        name: '问题',
                        type: 'line', // 设置图表类型为柱状图
                        areaStyle: {normal: {}},
                        smooth: true,
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
                        }  // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>
</body>
</html>
