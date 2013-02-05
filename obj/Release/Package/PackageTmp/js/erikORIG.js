var EMTdash = {
/*
========Line Graph Module===========================
*/ 
    generateLineGraph: function (divId, date, title, hoverLabel, topColor, bottomColor, chartData) {
        var requestDate = new Date(date);
        /*DATE Subtraction ERROR!!*/
        var chart_in_days = new Date().setDate(requestDate.getDate() - (chartData.length + 1));
        var chart;
        $(document).ready(function () {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: divId,
                    zoomType: 'x',
                    backgroundColor: 'none',
                    zoomType: 'xy',
                    spacingRight: 20
                },
                credits: { enabled: false },
                exporting: { enabled: false },
                tooltip: { shared: true },
                legend: { enabled: false },
                title: {
                    text: title,
                    align: 'left'
                },
                xAxis: {
                    type: 'datetime',
                    maxZoom: 14 * 24 * 3600000, /* fourteen days*/
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    maxPadding: 0.005,
                    title: {
                        text: null
                    },
                    //min: 0.6,
                    startOnTick: false,
                    showFirstLabel: false
                },
                plotOptions: {
                    area: {
                        fillColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [
                                [0, topColor],
                                [1, bottomColor]
                                ]
                        },
                        lineWidth: 1,
                        marker: {
                            enabled: false,
                            states: {
                                hover: {
                                    enabled: true,
                                    radius: 5
                                }
                            }
                        },
                        shadow: false,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        }
                    }
                },
                series: [{
                    type: 'area',
                    name: hoverLabel,
                    pointInterval: 24 * 3600 * 1000,
                    pointStart: chart_in_days, //Date.UTC(2012, 3, 05),
                    data: chartData
                }]
            });

        });
    },
/*
========Basic Stock Module===========================
*/ 
    generateStockChart: function(divId, title, chartData) {
        window.chart = new Highcharts.StockChart({
            chart : {
                renderTo: divId,
                marginTop: 10,
                backgroundColor: ''
            },
            rangeSelector : {
                selected : 1
            },
            title : {
                text: title,
                fontFamily: 'Arial'
            },
        
            series : [{
                name : 'AAPL',
                data: chartData,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    },
    value1: "thompson",
    method1: function (myName) { alert(myName + " at the end"); },
/*
========Gauge Module===========================
*/
    generateSmallGauge: function (divId) {
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: divId,
                type: 'gauge',
                marginTop: 22,
                backgroundColor: ''
            },
            credits: { enabled: false },
            exporting: { enabled: false },
            title: {
                text: 'RealTouch'
            },

            pane: {
                startAngle: -120,
                endAngle: 120
            },
            yAxis: {
                min: 0,
                max: 6000,
                tickWidth: 1,
                tickPosition: 'inside',
                tickLength: 15,
                tickColor: '#666',
                plotBands: [{
                    from: 0,
                    to: 1000,
                    color: '#DF5353', // red
                    innerRadius: '25%',
                    outerRadius: '100%'
                }, {
                    from: 1000,
                    to: 4000,
                    color: '#DDDF0D' // yellow
                }//, {
                 //   from: 4000,
                 //   to: 6000,
                 //   color: '#55BF3B' // green
                //}
                ]
            },
            plotOptions: {
                gauge: {
                    dial: {
                        backgroundColor: 'red'
                    }
                }
            },
           series: [{data: [2300] }]

        });
   },
/*
========Extra Small Gauge Module===========================
*/
    generateExtraSmallGauge: function (divId) {
    var lowVal = 1500;
    var midVal = 3300;
    var highVal = 5000;
    var chart = new Highcharts.Chart({
    
        chart: {
            renderTo: divId,
            type: 'gauge',
            //plotBorderWidth: 1,
            // marginBottom: 0,
            backgroundColor: '',
            height: 80
        },
        credits: {enabled : false}, 
        exporting: {enabled : false}, 
        title: {text: null},
        
        pane: [
            {
            startAngle: -45,
            endAngle: 45,
            background: null,
            center: ['50%', '155%'],
            size: 160
            }
              ],  
       yAxis: {
            min: 0,
            max: highVal,
            plotBands: [
                {from: 0,
                to: lowVal,
                color: '#C02316',
                innerRadius: '90%',
                outerRadius: '100%'},
                {from: lowVal,
                to: midVal,
                color: 'yellow',
                innerRadius: '95%',
                outerRadius: '100%'}//,
                //{from: midVal,
               // to: highVal,
                //color: 'green',
                //innerRadius: '98%',
               // outerRadius: '100%'}
           ]
        },
        plotOptions: {
           
            gauge: {
                dial: {
                    radius: '90%',
                    backgroundColor: 'red',
                    borderColor: '#666',
                    borderWidth: 1,
                    baseWidth: 3,
                    topWidth: 1,
                },
                pivot: {
                radius:37,
                backgroundColor: '#666'
                }
           }
        },
        series: [{
            data: [2890]
        }]
    
    });
},
/*
========Medium Gauge Module===========================
*/
    generateMediumGauge: function (divId) {
    var lowVal = 1000;
    var midVal = 3000;
    var highVal = 5000;
    var chart = new Highcharts.Chart({
    
        chart: {
            renderTo: divId,
            type: 'gauge',
            //plotBorderWidth: 1,
            backgroundColor: '',
            //plotBackgroundImage: null,
            marginBottom: 0,
            height: 110
        },
        credits: {enabled : false}, 
        exporting: {enabled : false}, 
        title: {text: null},
        
        pane: [{
            startAngle: -45,
            endAngle: 45,
            background: null,
            center: ['50%', '155%'],
            size: 200
            }
          ],                        
    
        yAxis: [{
            min: 0,
            max: highVal,
            minorTickPosition: 'outside',
            tickPosition: 'outside',
            labels: {
                rotation: 'auto',
                distance: 15
            },
            plotBands: [{
                from: 0,
                to: lowVal,
                color: '#C02316',
                innerRadius: '100%',
                outerRadius: '110%'
            },
                                     {
                from: lowVal,
                to: midVal,
                color: 'yellow',
                innerRadius: '100%',
                outerRadius: '105%'
            }
                                     ],
            pane: 0,
            title: {
                text: 'RealTouch<br/><span style="font-size:9px;margin:-2px;">Interactive</span>',
                y: -27
            }
        }],
        
        plotOptions: {
            gauge: {
                dataLabels: {enabled: false},
                dial: {radius: '100%' }
            }
        },
        tooltip:{
            shared: true,
            useHTML: true,
            headerFormat: '<small>{point.key}</small><table>',
            pointFormat: '<tr><td style="color: {series.color}">Count: </td>' +
            '<td style="text-align: right"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
        },
        series: [{data: [3800]} ]
    
    });
},
    method2: function (myName) { alert(myName + " at the end"); }

}  
