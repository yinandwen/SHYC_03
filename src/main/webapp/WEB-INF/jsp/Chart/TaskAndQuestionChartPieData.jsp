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
<div id="mainChart" style="width: 800px;height:600px; background: grey"></div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        var myChart = echarts.init($('#mainChart')[0]);
        $.ajax({
            url: '${pageContext.request.contextPath}/Chart/PieTask',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var values = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    //alert(JSON.stringify(obj.name))
                    values.push({name: obj.name, value: obj.value});
                    //alert(JSON.stringify(values))
                })

                var option = {
                    title: {
                        text: '任务数据详情',
                        subtext: '任务数据测试',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b}: {c} ({d}%)'
                    },
                    legend: {
                        bottom: 2,
                        left: 'center',
                        data: names
                    },
                    series: [
                        {
                            name: '任务',
                            type: 'pie',
                            selectedMode: 'single',
                            radius: [0, '60%'],
                            label: {
                                position: 'inner',
                                fontSize: 15,
                            },
                            labelLine: {
                                show: true
                            }
                        },
                        {
                            name: '任务',
                            type: 'pie',
                            radius: ['50%', '60%'],
                            labelLine: {
                                length: 40,
                            },
                            label: {
                                formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                                backgroundColor: '#F6F8FC',
                                borderColor: '#8C8D8E',
                                borderWidth: 1,
                                borderRadius: 4,

                                rich: {
                                    a: {
                                        color: '#6E7079',
                                        lineHeight: 22,
                                        align: 'center'
                                    },
                                    hr: {
                                        borderColor: '#8C8D8E',
                                        width: '100%',
                                        borderWidth: 1,
                                        height: 0
                                    },
                                    b: {
                                        color: '#4C5058',
                                        fontSize: 14,
                                        fontWeight: 'bold',
                                        lineHeight: 33
                                    },
                                    per: {
                                        color: '#fff',
                                        backgroundColor: '#4C5058',
                                        padding: [3, 4],
                                        borderRadius: 4
                                    }
                                }
                            },
                            data: values
                        }]
                };
                myChart.setOption(option, true);
            }
        });
    });
</script>
</body>
</html>

