var chart;
var columnData= [];
var timeDivisionData= [];
var ydPrice;
var meanArr = [];
var datamap = {};
var alldatamap = {};
var ymaxV = 0;
var yminV = 0;
var intervalArr = [], series = new Object, h_yAxis = new Object, h_chart = new Object, timeDivisionData = [], //格式化好的数据放到这里来
columnData = [];//交易量数据

var minStockChart = function(divID, data, isShowMean) {
	
	var rt_zs = data.ydclosingprice;;
	var rt_transactionprice = data.data[data.data.length -1].transactionprice;
	var rt_transactioncount = data.data[data.data.length -1].transactioncount;
	var rt_mean = data.data[data.data.length -1].mean;
	var rt_time = new Date(data.data[data.data.length -1].date);
	var rt_t_m = rt_time.getMinutes();
	if(rt_t_m.toString().length < 2){
		rt_t_m = "0"+""+rt_t_m;
	}
	
	var resetTip = '<table class="tipTab"><tr><td>时间：<span style="color:#000;">'
		+ rt_time.getHours() + ":" + rt_t_m
		+ '</span></td>';
	if (rt_transactionprice > rt_zs) {
		resetTip  += '<td>当前人流量：<span style="color: #DD2200;">' + rt_transactionprice
				+ ' </span></td>';
	} else {
		resetTip  += '<td>当前人流量：<span style="color: #33AA11;">' + rt_transactionprice
				+ ' </span></td>';
	}
	resetTip  += '<td>总流量：<span style="color:#000;">' + rt_transactioncount + '</span></td>';
	$(".tipMess").html(resetTip);
	
	columnData= [];
	timeDivisionData= [];
	meanArr = [];
	datamap = {};
	alldatamap = {};
	ymaxV = 0;
	yminV = 0;
	intervalArr = [];
	series = new Object;
	h_yAxis = new Object;
	h_chart = new Object;
	timeDivisionData = [];
	
	var mindata = data.data;
	ydPrice = data.ydclosingprice;
	for (var h = 0; h < mindata.length; h++) {
		var datetime = new Date();
		datetime.setTime(mindata[h].date);
		dateUTC = Number(Date.UTC(datetime.getUTCFullYear(),
				datetime.getUTCMonth(), datetime.getUTCDate(),
				datetime.getUTCHours(), datetime.getUTCMinutes()));
		var priceArr = [];
		priceArr[0] = priceArr[1] = Number(mindata[h].pricechangeratio);
		priceArr[2] = Number(data.ydclosingprice)
		priceArr[3] = Number(mindata[h].transactionprice);
		priceArr[4] = Number(mindata[h].transactioncount);
		priceArr[5] = Number(mindata[h].mean);
		//交易量数据
		var columnColor = "#ff0000";
		if (h > 0) {
			if (timeDivisionData.slice(-1)[0].y- priceArr[3] > 0) {
				columnColor = "#00a800"
			}
		}
		columnData.push({
			x : dateUTC,
			y : priceArr[4],
			color : columnColor
		});
		

		timeDivisionData.push({
			x : dateUTC,
			y : priceArr[3]
		});
		
		if(isShowMean) 
		{
			meanArr.push({
				x : dateUTC,
				y : Number(priceArr[5])
			});
		}
		datamap[dateUTC] = mindata[h];
	}

	
	Highcharts.setOptions({
		lang : {
			shortMonths : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月',
					'九月', '十月', '十一', '十二' ],
		},
	
	global : {
			useUTC : false
		}
	});
	
	$("#" + divID).mousemove(move);
	
	return chart = new Highcharts.StockChart(
			{
				credits:{
					enabled: false
//					text:'@epianhong.com',               // 显示的文字
//					href:'http://www.epianhong.com',   // 链接地址
//					position:{                          // 位置设置
//						align: 'left',
//						x: 10,
//						verticalAlign: 'bottom',
//						y: -20
//					},
//					style: {                            // 样式设置
//						cursor: 'pointer',
//						fontSize: '10px'
//					}
				},
				
				//去掉日期选择
				rangeSelector : {
					enabled:false,
				    selected: 4,
				    buttonTheme: {
				        visibility: 'hidden'
				    },
				    labelStyle: {
				        visibility: 'hidden'
				    },
					inputEnabled : false,
					inputDateFormat : '%Y-%m-%d' // 设置右上角的日期格式
				},

				chart : {
					plotBorderColor: '#C0D0E0',
		            plotBorderWidth: 1,
					renderTo : divID,
					events : {
						load : function(chart) {
							h_yAxis = this.axes[1];
							h_chart = this;
							//分时数据中的最大振幅
							var maxAmplitude = Math.max(Math.abs(h_yAxis.dataMax - ydPrice),Math.abs(h_yAxis.dataMin - ydPrice))
							maxAmplitude = Math.round(maxAmplitude*100)/100;//四舍五入保留两位小数
							h_yAxis.max = ydPrice+(maxAmplitude);
							h_yAxis.min = ydPrice-(maxAmplitude);


						}
					},
				},

				yAxis : [{
							showFirstLabel: true,
							showLastLabel: true,
							labels : { //行情左
//								align : 'left', //文字的左右对齐，左对齐的时候，数值会放到y轴右侧
								x : -2,
								y: 1,
								useHTML : true,
								formatter : function() {
									var percentVal = (Math.abs(Math.round((this.value - ydPrice)/ ydPrice* 10000) / 100)).toFixed(2);
									//var offsetx = 960 - percentVal.toString().length * 7;
									var offsetx = ($(window).width()*0.9) - percentVal.toString().length *2;
									
									if(this.value > ydPrice) {
										return '<span style="color: #DD2200;">' + (this.value).toFixed(2) + '</span><span style="position: absolute;left: ' + offsetx + 'px;color: #DD2200;">' + percentVal + '%</span>';
									} else if(this.value < ydPrice) {
										return '<span style="color: #33AA11;">' + (this.value).toFixed(2) + '</span><span style="position: absolute;left: ' + offsetx + 'px;color: #33AA11;">' + percentVal + '%</span>';
									}
									
									return '<span style="color: #000;">' + this.value + '</span><span style="position: absolute;left: ' + offsetx + 'px;color: #000;">' + percentVal + '%</span>';;
								}
							},
							height : '60%',
							lineWidth : 1,
							opposite : false,//是否把它显示到另一边（右边）
							lineWidth : 1,// Y轴边缘线条粗细
							gridLineColor : '#346691',
							gridLineWidth : 0.1,
							tickColor : "#ff000",
							tickWidth : 2,
							tickPositioner : function() { //手动计算主刻度线的位置
								var middleLine = ydPrice;
								var maxAmplitude = Math.floor(Math.max(Math.abs(this.dataMax - middleLine),Math.abs(this.dataMin - middleLine))*100)/100 * 1.05;//四舍五入保留两位小数
								positions = [];
								yminV = (middleLine - maxAmplitude);
								ymaxV = (middleLine + maxAmplitude);
								positions.push(yminV);
								positions.push(fixValue(middleLine - maxAmplitude / 2));
								positions.push(middleLine);
								positions.push(fixValue(middleLine + maxAmplitude / 2));
								positions.push(ymaxV);
								return positions;
							},
						},
						{
							labels : { //交易量
//								align : 'left',
								x : -3,
								y : 8,
								formatter : function() {
									if (this.value == 0) {
										return 0
									} else if (this.value >= 10000)
										return (this.value / 10000).toFixed(1) + "万"
									else if (this.value >= 100000000)
										return (this.value / 100000000).toFixed(1) + "亿"
									return this.value
								},
								style : {
									fontSize : '12px',
									color : '#aaaaaa',
								}
							},
							top : '70%',
							height : '30%',
							offset : 0,
							showLastLabel : true,
							lineWidth : 2,
							opposite : false,
							tickPositioner : function() {
								var dataMaxBits = Math.pow(10,
										(String(this.dataMax).length - 1)), axisMax = this.dataMax > 10 ? Math
										.ceil(this.dataMax / dataMaxBits)
										* dataMaxBits
										: 10, positions = [ 0, axisMax / 2,
										this.dataMax ];

								return positions
							}
						} ],

				xAxis : { //
					endOnTick : false,
					minorTickInterval : 'auto',//设置是否出现小的纵向网格线（此标尺显示在图标数据区）
					minorGridLineColor : '#f0f0f0', //上面参数的线的颜色
					tickPixelInterval : 150,//设置横坐标刻度线的密度（包括网格线的横向密度）
					showFirstLabel : true,

					events : {
						afterSetExtremes : function(e) {
							//e.max = Date.UTC(2014,11,5,19,0)
						}
					},
					offset: -136,
				},


				tooltip : {
					style:{
						visibility: 'hidden'
					},
					//数据提示框的格式化
					formatter : function() {
						
						var zs = ydPrice;
						var transactionprice = datamap[this.points[0].point.x].transactionprice;
						var pricechangeratio = Math.round(datamap[this.points[0].point.x].pricechangeratio / zs * 10000) / 100 + "%";
						var transactioncount = datamap[this.points[0].point.x].transactioncount;
						var mean = datamap[this.points[0].point.x].mean;
						
						var rstime = '时间：<span style="color:#000;">'
							+ Highcharts.dateFormat('%H:%M', datamap[this.points[0].point.x].date)
							+ '</span>';
						if (transactionprice > zs) {
							var rprice = '当前人流量：<span style="color: #DD2200;">' + transactionprice
									+ ' </span>';
						} else {
							var rprice = '当前人流量：<span style="color: #33AA11;">' + transactionprice
									+ ' </span>';
						}
						var dcount = '总流量：<span style="color:#000;">' + transactioncount + '</span>';
						$(".tipMess").html('<table class="tipTab"><tr>'
								+'<td>' + rstime + ' </td>'
								+'<td>' + rprice + '</td>'
								+'<td>' + dcount + '</td>'
								+'</tr>'
								+'</table>');
						return '';
					}
				},

				scrollbar : {
					enabled : false
				//隐藏滚动条
				},

				navigator : {
					enabled : false
				//隐藏全局数据条
				},

				series : [
				{
					name : '价格',
					data : timeDivisionData,
					tooltip : {
						valueDecimals : 2
					//小数数量
					},
					dataGrouping : { //把数据合并，比如纵向的位置显示不了所有数据了，会把其中一些数据点合并成一个，数值可以计算为两个数据的平均值，也可以计算为两个数据之和
						enabled : false,
						forced : true
					}
				}, {
					type : 'column',
					name : '交易量',
					data : columnData,
					yAxis : 1,
					tooltip : {
						valueDecimals : 0,
						valueSuffix : "手"
					},
					dataGrouping : {
						enabled : false,
						forced : true
					}
				}
				]
	});
}

//纵坐标指示
function move(event) {
	var y = event.pageY, path = [ 'M', chart.plotLeft, y, 'L',
			chart.plotLeft + chart.plotWidth, y, ];

	var yvalue = chart.yAxis[0].toValue(y);
	if(yvalue <= ymaxV && yvalue >= yminV)
	{
		if (chart.crossLines) {
			// update lines
			chart.crossLines.attr({
				d : path
			});
		} else {
			// draw lines
			chart.crossLines = chart.renderer.path(path).attr({
				'stroke-width' : 0.4,
				stroke : 'black',
				zIndex : 10
			}).add();
		}

		if (chart.crossLabel) {
			// update label
			chart.crossLabel.attr({
				y : y + 10,
				text : fixValue(yvalue)
			});
		} else {
			// draw label
			chart.crossLabel = chart.renderer.text(
					fixValue(yvalue),
					chart.plotLeft, y + 10).add();
		}
	}
}

