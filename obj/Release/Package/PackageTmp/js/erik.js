var EMTdash = {
/*
========Line Graph Module===========================
*/ 
    generateLineGraph: function (divId) {
        $('#'+divId).show();
        
        var title = $('#'+divId + "> .title").html();
        
        var hoverLabel = $('#'+divId + "> .hoverLabel").html();
        var colors = $('#'+divId + "> .colors").html().split(",");
        var chartData = jQuery.parseJSON($('#'+divId + "> .data").html());//, date, title, hoverLabel, topColor, bottomColor, chartData
        var date = new Date(parseInt($('#'+divId + "> .date").html()));
       // alert('yo');
        var requestDate = new Date(date);

        /*DATE Subtraction ERROR!!*/

        var chart_in_days = new Date().setDate(date.getDate() - (chartData.length + 1));
        testDate = new Date();
        //testDate = testDate.setDate(testDate.getDate() - 50);

        

        $(document).ready(function () {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: divId,
                    zoomType: 'x',
                    backgroundColor: 'none',
                    //zoomType: 'y',
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
                    //min: .6,
                    startOnTick: false,
                    showFirstLabel: false
                },
                plotOptions: {
                    area: {
                        fillColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [
                                [0, colors[0]],
                                [1, colors[1]]
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
                    pointStart: Date.UTC(2012, 3, 05),//chart_in_days, //
                    data: chartData
                }]
            });

        });
    },
/*
========Basic Stock Module===========================
*/ 
    generateStockChartA: function(divId) {
        
        $('#'+divId).show();
        
        var title = $('#'+divId + "> .title").html();
        var hoverLabel = $('#'+divId + "> .hoverLabel").html();
        var chartData = jQuery.parseJSON($('#'+divId + "> .data").html());       
        window.chart = new Highcharts.StockChart({
            chart : {
                renderTo: divId,
                marginTop: 10,
                backgroundColor: ''
            },
            rangeSelector : {
                enabled: false,
                selected : 1
            },
            title : {
                text: title,
                align: 'left'
            },
        
            series : [{
                //type: 'areaspline',
                name : hoverLabel,
                data: chartData,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    },
/*
    ======== Stock Module===========================
    */
 
    generateStockChartB: function(divId) {
        
        $('#'+divId).show();

        var title = $('#'+divId + "> .title").html();
        var hoverLabel = $('#'+divId + "> .hoverLabel").html();
        var colors = $('#'+divId + "> .colors").html().split(",");
        var chartData = jQuery.parseJSON($('#'+divId + "> .data").html());       
        window.chart = new Highcharts.StockChart({
            chart : {
                renderTo: divId,
                marginTop: 10,
                backgroundColor: ''
            },
            credits: { enabled: false },
            exporting: { enabled: false },
            rangeSelector : {
                //enabled: false,
                selected : 2
            },
            title : {
                text: title,
                align: 'center'
            },
        
            series : [{
                //type: 'areaspline',
                id: 'mainData',
                name : hoverLabel,
                data: chartData,
                threshold : null,
                tooltip: {
                    valueDecimals: 2
                },

                fillColor : {
                    linearGradient : {
                        x1: 0, 
                        y1: 0, 
                        x2: 0, 
                        y2: 1
                    },
                    stops : [[0, Highcharts.getOptions().colors[0]], [1, 'rgba(0,0,0,0)']]
                    //stops : [
                    //    [0],
                    //    [colors[0]],
                    //    [colors[1]]
                    //]
                }
            }]
        });

        

    },
    /*
    ======== Stock Module TwoTracks===========================
    */
 
    generateStockChartC: function(divId) {
        
        $('#'+divId).show();

        var title = $('#'+divId + "> .title").html();
        var hoverLabel = $('#'+divId + "> .hoverLabel").html();
        var colors = $('#'+divId + "> .colors").html().split(",");
        var dataA = jQuery.parseJSON($('#'+divId + "> .data2").html()); 
        var dataB = jQuery.parseJSON($('#'+divId + "> .data").html());       
        
        chart = new Highcharts.StockChart({
            chart: {
                renderTo: divId,
                backgroundColor: 'none',
                alignTicks: false,
                marginTop: 12
            },
            credits: { enabled: false },
            exporting: { enabled: false },                
            rangeSelector: {
                selected: 1,
                inputEnabled: false
            },
            scrollbar : {
                enabled : false
            },
            navigator : {
                maskFill: 'rgba(180, 198, 220, 0.6)'
              
            },
            title: {
                text: 'History Track',
                align: 'right'
            },

            yAxis: [{
                title: {
                    text: 'Sales'
                },
                height: 150,
                lineWidth: 2
            }, {
                title: {
                    text: 'Consumption'
                },
                top: 190,
                height: 90,
                offset: 0,
                lineWidth: 2
            }],
            
            series: [
                {
                name: 'Sales',
                data: dataA,
                type : 'area',
                fillColor : {
                    linearGradient : {
                        x1: 0, 
                        y1: 0, 
                        x2: 0, 
                        y2: 1
                    },
                    stops : [[0, '#bbdebc'], [1, '#e1e0e0']]
                }



                },
                {
                type: 'column',
                name: 'Consumption',
                color: '#6a8ea7',
                data: dataB,
                yAxis: 1 }





            ]
        });

    },
    value1: "thompson",
    method1: function (myName) { alert(myName + " at the end"); },
/*
======== Gauge A Module===========================
*/
    generateGaugeA: function (divId) {

    $('#'+divId).show();

    var dataValue = $('#'+divId + "> .data").html();
    dataValue = jQuery.parseJSON(dataValue);
    
    var percentage = $('#'+divId + "> .percentage").html();
    
    var title = $('#'+divId + "> .title").html();
    title = dataValue[0] + ' (' + percentage + ')<br/>' + title;
    //title = dataValue[0] + ' (' + percentage + ')';
    var allValuesColor = $('#'+divId + "> .threeRangeColor").html();
    var colorArray = new Array();
    colorArray = allValuesColor.split(",");
    var lowColor = colorArray[0];
    var midColor = colorArray[1];
    var highColor = colorArray[2];

    var allValues = $('#'+divId + "> .fourRanges").html();
    var valueArray = new Array();
    valueArray = allValues.split(",");
    var bottomVal = valueArray[0];
    var lowVal = valueArray[1];
    var midVal = valueArray[2];
    var highVal = valueArray[3];

    var chart = new Highcharts.Chart({
    
    
        chart: {
            renderTo: divId,
            type: 'gauge',
            backgroundColor: '',
            
            //borderColor: '#666',
            //borderWidth: 1,
            marginBottom: 50,
            height: 110
        },
        credits: {enabled : false}, 
        exporting: {enabled : false}, 
        title: {text: null},
        
        pane: [{
            startAngle: -65, //45
            endAngle: 65, //45
            background: null,
            center: ['50%', '155%'],
            size: 110
            }
          ],                        
    
        yAxis: [{/* Odd error I should not need to use parseInt... possibly because 0 is also false*/
            min: parseInt(bottomVal),
            max: highVal,
            minorTickPosition: 'outside',
            tickPosition: 'outside',
            labels: {
                rotation: 'auto',
                distance: 15
            },
            plotBands: [{
                from: bottomVal,
                to: lowVal,
                color: lowColor,
                innerRadius: '98%',
                outerRadius: '110%'
            },
                                     {
                from: lowVal,
                to: midVal,
                color: midColor,
                innerRadius: '100%',
                outerRadius: '104%'
            },
            {
                from: midVal,
                to: highVal,
                color: highColor,
                innerRadius: '100%',
                outerRadius: '103%'
            }
                                     ],
            pane: 0,
            title: {
                text: title,
                y: 12
            }
        }],
        
        plotOptions: {
            gauge: {
                dataLabels: {enabled: false},
                dial: {radius: '120%' }
            }
        },
        /*tooltip:{
            shared: true,
            useHTML: true,
            headerFormat: '<small>{point.key}</small><table>',
            pointFormat: '<tr><td style="color: {series.color}">'+hoverLabel+': </td>' +
            '<td style="text-align: right"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
        },*/
        series: [{data: dataValue} ]
    
    });
},


/*
========Gauge Module===========================
*/
    generateGaugeB: function (divId) {

        $('#'+divId).show();

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
                startAngle: -120, //120
                endAngle: 120 //120
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
========Small Gauge Module===========================
*/
    generateGaugeC: function (divId) {
    
    $('#'+divId).show();

    var dataValue = $('#'+divId + "> .data").html();
    dataValue = jQuery.parseJSON(dataValue);
    
    var percentage = $('#'+divId + "> .percentage").html();
    
    var title = $('#'+divId + "> .title").html();
    title = dataValue[0] + ' (' + percentage + ')<br/><span style="font-size:9px;margin:-2px;"> ' + title + '</span>';
    //title = dataValue[0] + ' (' + percentage + ')';
    var allValuesColor = $('#'+divId + "> .threeRangeColor").html();
    var colorArray = new Array();
    colorArray = allValuesColor.split(",");
    var lowColor = colorArray[0];
    var midColor = colorArray[1];
    var highColor = colorArray[2];

    var allValues = $('#'+divId + "> .fourRanges").html();
    var valueArray = new Array();
    valueArray = allValues.split(",");

    var bottomVal = valueArray[0];
    var lowVal = valueArray[1];
    var midVal = valueArray[2];
    var highVal = valueArray[3];


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
                color: lowColor,
                innerRadius: '90%',
                outerRadius: '100%'},
                {from: lowVal,
                to: midVal,
                color: midColor,
                innerRadius: '95%',
                outerRadius: '100%'},
                {from: midVal,
                to: highVal,
                color: highColor,
                innerRadius: '98%',
                outerRadius: '100%'}
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
            data: [dataValue]
        }]
    
    });
},
/*
========Medium Gauge Module===========================
*/
    generateExtraSmallGauge: function (divId) {

    $('#'+divId).show();

    var dataValue = $('#'+divId + "> .data").html();
    dataValue = jQuery.parseJSON(dataValue);
    
    var percentage = $('#'+divId + "> .percentage").html();
    
    var title = $('#'+divId + "> .title").html();
    title = dataValue[0] + ' (' + percentage + ')<br/><span style="font-size:9px;margin:-2px;"> ' + title + '</span>';
    //title = dataValue[0] + ' (' + percentage + ')';
    var allValuesColor = $('#'+divId + "> .threeRangeColor").html();
    var colorArray = new Array();
    colorArray = allValuesColor.split(",");
    var lowColor = colorArray[0];
    var midColor = colorArray[1];
    var highColor = colorArray[2];

    var allValues = $('#'+divId + "> .fourRanges").html();
    var valueArray = new Array();
    valueArray = allValues.split(",");
    var bottomVal = valueArray[0];
    var lowVal = valueArray[1];
    var midVal = valueArray[2];
    var highVal = valueArray[3];

    var chart = new Highcharts.Chart({
    
    
        chart: {
            renderTo: divId,
            type: 'gauge',
            backgroundColor: '',
            
            //borderColor: '#666',
            //borderWidth: 1,
            marginBottom: 25,
            height: 80
        },
        credits: {enabled : false}, 
        exporting: {enabled : false}, 
        title: {text: null},
        
        pane: [{
            startAngle: -55, //45
            endAngle: 55, //45
            background: null,
            center: ['50%', '155%'],
            size: 120
            }
          ],                        
    
        yAxis: [{/* Odd error I should not need to use parseInt... possibly because 0 is also false*/
            min: parseInt(bottomVal),
            max: highVal,
            minorTickPosition: 'outside',
            tickPosition: 'outside',
            labels: {
                rotation: 'auto',
                distance: 15
            },
            plotBands: [{
                from: bottomVal,
                to: lowVal,
                color: lowColor,
                innerRadius: '100%',
                outerRadius: '108%'
            },
                                     {
                from: lowVal,
                to: midVal,
                color: midColor,
                innerRadius: '100%',
                outerRadius: '104%'
            },
            {
                from: midVal,
                to: highVal,
                color: highColor,
                innerRadius: '100%',
                outerRadius: '102%'
            }
                                     ],
            pane: 0,
            title: {
                text: title,
                y: -3
            }
        }],
        
        plotOptions: {
            gauge: {
                dataLabels: {enabled: false},
                dial: {radius: '120%' }
            }
        },
        /*tooltip:{
            shared: true,
            useHTML: true,
            headerFormat: '<small>{point.key}</small><table>',
            pointFormat: '<tr><td style="color: {series.color}">'+hoverLabel+': </td>' +
            '<td style="text-align: right"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
        },*/
        series: [{data: dataValue} ]
    
    });
}

}  
