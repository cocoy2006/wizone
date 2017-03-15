function showtotal() {
    $.ajax({
        url: "http://www.wicloud.cc:8081/wicloud/totalinfo/newAndOld/",
        data: "place=test01&time=2014-08-11",
        dataType: "json",
        type: "POST",
        success: function(jsonObj) {
            var new_avg = parseFloat(toDecimal2(100 * jsonObj.new_avg / (jsonObj.new_avg + jsonObj.old_avg)));
            var old_avg = parseFloat(toDecimal2(100 * jsonObj.old_avg / (jsonObj.new_avg + jsonObj.old_avg)));
            Highcharts.setOptions({
                colors: ["#87CEFA", "#4EEE94", "#55BF3B", "#7798BF", ],
                backgroundColor: {
                    linearGradient: [0, 0, 500, 500],
                    stops: [[0, 'rgb(255, 255, 255)'], [1, 'rgb(240, 240, 255)']]
                },
                borderWidth: 2,
                plotBackgroundColor: 'rgba(255, 255, 255, .9)',
                plotShadow: true,
                plotBorderWidth: 1
            });
            $('#container1-1').highcharts({
                title: {
                    text: '近7天入店顾客信息总览',
                    style: {
                        color: '#000',
                        font: 'bold 15px "微软雅黑"'
                    }
                },
                xAxis: {
                    categories: ['2014-08-05', '2014-08-06', '2014-08-07', '2014-08-08', '2014-08-09', '2014-08-10', '2014-08-11', ],
                    labels: {
                        rotation: -15,
                        align: 'right',
                        style: {
                            fontSize: '6px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '',
                        style: {
                            color: '#000',
                            font: 'bold 15px "微软雅黑"'
                        }
                    }
                },
                labels: {
                    items: [{
                        html: '',
                        style: {
                            left: '50px',
                            top: '18px',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                        }
                    }]
                },
                credits: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                },
                series: [{
                    type: 'column',
                    name: '新顾客',
                    data: jsonObj.newdata,
                    dataLabels: {
                        enabled: false,
                        rotation: -90,
                        color: '#000',
                        align: 'right',
                        x: 4,
                        y: -30,
                        style: {
                            fontSize: '12px',
                            fontFamily: 'Verdana, sans-serif',
                            textShadow: '0 0 1px #fff'
                        }
                    }
                },
                {
                    type: 'column',
                    name: '老顾客',
                    data: jsonObj.olddata,
                    dataLabels: {
                        enabled: false,
                        rotation: -90,
                        color: '#000',
                        align: 'right',
                        x: 4,
                        y: -30,
                        style: {
                            fontSize: '12px',
                            fontFamily: 'Verdana, sans-serif',
                            textShadow: '0 0 1px #fff'
                        }
                    }
                },
                {
                    type: 'spline',
                    name: '日流量',
                    data: jsonObj.totaldata,
                    marker: {
                        lineWidth: 3,
                        lineColor: Highcharts.getOptions().colors[3],
                        fillColor: 'white',
                        dataLabels: {
                            enabled: true,
                            color: '#000',
                        }
                    }
                },
                {
                    type: 'pie',
                    name: '近7天平均占比(%)',
                    data: [{
                        name: '新顾客',
                        y: new_avg,
                        color: Highcharts.getOptions().colors[0] // Jane's color
                    },
                    {
                        name: '老顾客',
                        y: old_avg,
                        color: Highcharts.getOptions().colors[1] // John's color
                    }],
                    center: [400, -20],
                    size: 70,
                    showInLegend: false,
                    dataLabels: {
                        enabled: false
                    }
                }]
            });
        }
    });
}