<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="AEBNDashboard.report" %><!DOCTYPE html>
<html>
<head>
<title>RealTouch Dashboard</title>
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="apple-touch-icon" href="AEBN.png"/>
    
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/jquery-ui-1.8.23.custom.min.js"></script>
<!-- script src="js/HighCharts/highcharts.js" type="text/javascript"></script -->
<link href="css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
<script src="http://omnipotent.net/jquery.sparkline/1.6/jquery.sparkline.min.js"></script>

<script>
    $(document).ready(function () {
        $('.sparkline').sparkline('html', { enableTagOptions: true, width: '95%' });

        var date = new Date();
        var htmlStr = "";
        var numbers = new Array();


        $("#menuMenu").click();
        $("#menuCal").click(function () {
            if ($(".calendar").is(":hidden")) $(".calendar").show("fast");
            else $(".calendar").hide("slow");
        });


        htmlStr = "<div style=\"position:relative;\">" + htmlStr + "</div>";

        $('#test90').html(numbers[0]);

        $('.consumptionLineGraph').sparkline('html', { width: '100%', height: '100', tooltipPrefix: 'Consumption: ' });

        $('.calendar div').datepicker({ minDate: -100, maxDate: -1, setDate: '<%= reportDateRaw %>', onSelect: function (dateText, inst) { gotoDate(dateText) } });

    });

        function gotoDate(date){
            //$(".calendar").hide("fast");
            myURL = document.URL.split("?");
            window.location.href = myURL[0]+"?d="+date;    
        }
 /*
        $(function () {
            var today=new Date();
            var ninety_days_ago=new Date().setDate(today.getDate()-90);
            var onehundredeighty_days_ago=new Date().setDate(today.getDate()-180);

    
            var chart;
            $(document).ready(function() {
               
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'container',
                        zoomType: 'x',
                        spacingRight: 20
                    },
                    credits:{ enabled: false},
                    exporting:{enabled: false},
                    tooltip: {shared: true},
                    legend: {enabled: false },
                    title: {
                        text: 'USD to EUR exchange rate from 2006 through 2008',
                        align:'left'
                    },
                    xAxis: {
                        type: 'datetime',
                        maxZoom: 14 * 24 * 3600000, // fourteen days
                        title: {
                            text: null
                        }
                    },
                    yAxis: {
                        title: {
                            text: null
                        },
                        min: 0.6,
                        startOnTick: false,
                        showFirstLabel: false
                    },
            
                    plotOptions: {
                        area: {
                            fillColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                                stops: [
                                    [0, '#c1ecd2'],
                                    [1, '#e6e9ed']
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
                        name: 'USD to EUR',
                        pointInterval: 24 * 3600 * 1000,
                        pointStart: onehundredeighty_days_ago,//Date.UTC(2012, 3, 05),
                        data: [
                            0.8446, 0.8445, 0.8444, 0.8451,    0.8418, 0.8264,    0.8258, 0.8232,    0.8233, 0.8258,
                            0.8283, 0.8278, 0.8256, 0.8292,    0.8239, 0.8239,    0.8245, 0.8265,    0.8261, 0.8269,
                            0.8273, 0.8244, 0.8244, 0.8172,    0.8139, 0.8146,    0.8164, 0.82,    0.8269, 0.8269,
                            0.8269, 0.8258, 0.8247, 0.8286,    0.8289, 0.8316,    0.832, 0.8333,    0.8352, 0.8357,
                            0.8355, 0.8354, 0.8403, 0.8403,    0.8406, 0.8403,    0.8396, 0.8418,    0.8409, 0.8384,
                            0.8386, 0.8372, 0.839, 0.84, 0.8389, 0.84, 0.8423, 0.8423, 0.8435, 0.8422,
                            0.838, 0.8373, 0.8316, 0.8303,    0.8303, 0.8302,    0.8369, 0.84, 0.8385, 0.84,
                            0.8401, 0.8402, 0.8381, 0.8351,    0.8314, 0.8273,    0.8213, 0.8207,    0.8207, 0.8215,
                            0.8242, 0.8273, 0.8301, 0.8346,    0.8312, 0.8312,    0.8312, 0.8306,    0.8327, 0.8282,
                            0.824, 0.8255, 0.8256, 0.8273, 0.8209, 0.8151, 0.8149, 0.8213, 0.8273, 0.8273,
                            0.8261, 0.8252, 0.824, 0.8262, 0.8258, 0.8261, 0.826, 0.8199, 0.8153, 0.8097,
                            0.8101, 0.8119, 0.8107, 0.8105,    0.8084, 0.8069,    0.8047, 0.8023,    0.7965, 0.7919,
                            0.7921, 0.7922, 0.7934, 0.7918,    0.7915, 0.787, 0.7861, 0.7861, 0.7853, 0.7867,
                            0.7827, 0.7834, 0.7766, 0.7751, 0.7739, 0.7767, 0.7802, 0.7788, 0.7828, 0.7816,
                            0.7829, 0.783, 0.7829, 0.7781, 0.7811, 0.7831, 0.7826, 0.7855, 0.7855, 0.7845,
                            0.7798, 0.7777, 0.7822, 0.7785, 0.7744, 0.7743, 0.7726, 0.7766, 0.7806, 0.785,
                            0.7907, 0.7912, 0.7913, 0.7931, 0.7952, 0.7951, 0.7928, 0.791, 0.7913, 0.7912,
                            0.7941, 0.7953, 0.7921, 0.7919, 0.7968, 0.7999, 0.7999, 0.7974, 0.7942, 0.796
                        ]
                    }]
                });
            
            alert("hello");
            });
    
    });​*/



        //HighCharts
//        var date = new Date();
//        var numbers = new Array();
//        for (i = 91; i >= 0; i--) {
//            date.setDate(date.getDate() - 1);
//            numbers[i] = (date.getMonth() + 1) + "/" + date.getDate();
//        }


</script>
<style>
        .round {
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;

            background: #f3f3f3; /* for non-css3 browsers */
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f3f3f3', endColorstr='#bdbbbb'); /* for IE */
            background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#bdbbbb)); /* for webkit browsers */
            background: -moz-linear-gradient(top,  #f3f3f3,  #bdbbbb); /* for firefox 3.6+ */ 
            
            border:1px solid #423d3d;
            position:relative;
            padding:10px;
        }

      
        html, body{padding:0px;margin:0px; font-family:Arial;}
        body{background-color:#9f9f9f;}
        .clr{clear:both;}
        .dash{position:relative;}
        .leftPanel{background-color:#231e1e;position:absolute;width:45px;height:100%;top:0px; z-index:10;}
        .leftPanel div{ cursor:pointer;}
        .topPanel{ border:1px solid #423d3d; margin:30px 10px 10px 55px;}
        .topPanel h1{padding:0px;margin:0px; font-size:18px;}
        .topPanel h2{position:absolute;right:10px;bottom:10px;padding:0px;margin:0px;font-size:16px;}
        .bodyPanel{height:620px;margin:10px 10px 10px 55px;}
        
        .moduleA{font-size:10px;margin:10px;}
        .moduleA .title{font-size:13px; font-weight:bold; color:#555; border-bottom:1px solid #9f9f9f; margin-bottom:3px;}
        .moduleA .data{float:left;}
        .moduleA .count{float:right;}
        .moduleA .data .value{font-size:20px;font-weight:bold;}
        .moduleA .sparkline{clear:left;}
        .moduleA .moduleElement{float:left;width:50%;}
        .moduleA .directionDown{color:red; text-align:center;float:left;margin-right:7px;line-height: 100%}
        .moduleA .directionUp{color:green; text-align:center;float:left;margin-right:7px;line-height: 100%}
        .moduleA .directionNone{color:black; text-align:center;float:left;margin-right:7px;line-height: 100%}

        .moduleMain{font-size:10px;margin:10px;}
        .moduleMain .title{font-size:13px; font-weight:bold; color:#555;}
        .moduleMain .data{float:left;}
        .moduleMain .data .value{font-size:45px;font-weight:bolder;line-height: 90%}
        .moduleMain .directionDown{color:red; text-align:center;float:left;margin:3px 0px 0px 7px;line-height: 100%}
        .moduleMain .directionUp{color:green; text-align:center;float:left;margin:3px 0px 0px 7px;line-height: 100%}
        .moduleMain .directionNone{color:black; text-align:center;float:left;margin:3px 0px 0px 7px;line-height: 100%}
        
        .moduleB{font-size:10px;float:left;width:20%;margin:15px 0px;}
        .moduleB .title{font-size:13px; font-weight:bold; color:#555;}
        .moduleB .data{float:left;}
        .moduleB .data .value{font-size:30px;font-weight:bolder;line-height: 90%}
        .moduleB .directionDown{color:red; text-align:center;float:left;margin:3px 7px 0px 0px;line-height: 100%}
        .moduleB .directionUp{color:green; text-align:center;float:left;margin:3px 7px 0px 0px;line-height: 100%}
        .moduleB .directionNone{color:black; text-align:center;float:left;margin:3px 7px 0px 0px;line-height: 100%}
     
        .navItem {text-align:center; margin-top:40px;}
        .navPanel{
            background-color:#231e1e;position:absolute;
            top:0px;left:60px;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            display:none;
         }
        .ui-datepicker{font-size:12px;}
        .calendar{top:100px;z-index:6;}
        .navPanel div{position:relative;margin:10px;}
        .menu{top:50px;z-index:5;}
        .salesLineGraph, .consumptionLineGraph{border-bottom:1px solid #9f9f9f;border-top:1px solid #9f9f9f;}
        
</style>
</head>
<body>
    
    <div class="navPanel calendar"><div></div></div>
    <div class="navPanel menu"></div>
    <div class="leftPanel">
    <div id="menuMenu" class="navItem"><img src="menu.png" /></div>
    <div id="menuCal" class="navItem"><img src="cal.png" /></div>
    <div id="menuPlay" class="navItem"><img src="play.png" /></div>
    </div>
    <div class="dash">
        <div class="topPanel round"><h1>RealTouch</h1><h2><%= reportDate %></h2></div>
        <div class="bodyPanel round">
            <div style="position:relative;">
                <div style="background-color:transparent; position:absolute; width:75%; left:0px; top:0px;height:100px;">
                   <div id="container" style="min-width: 400px; height: 200px; margin: 0 auto"></div>
                   <!-- div class="salesLineGraph"></div -->
                   
                   <div class="clr" ></div>
                   <div style="position:relative;">
                        <%= newClientsHtml %>
                    </div>
                   <div class="clr" ></div>
                   <div id="container2" style="min-width: 400px; height: 200px; margin: 0 auto"></div>
                    <div style="position:relative;">
                        <%= consumptionHmtl %>
                   </div>
                   <div class="clr" ></div>

                </div>
                
                <div style="background-color:none; position:absolute; width:25%; right:0px; top:0px;height:300px;">
                    <%= salesHtml %>
                </div>
        </div>
    </div>

    <div>

     </div>



</body>
</html>
