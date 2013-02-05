<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pocTemplateC.aspx.cs" Inherits="AEBNDashboard.pocTemplateC" %><!DOCTYPE html><html>
<head>
<title>AEBN Dashboard</title>
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="apple-touch-icon" href="AEBN.png"/>
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/HighCharts/highcharts.js"></script>
<script src="js/HighCharts/highstock.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="js/erik.js"></script>
<script src="js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="http://omnipotent.net/jquery.sparkline/1.6/jquery.sparkline.min.js"></script>
<script>
    $(document).ready(function () {
        $('.dash').show();
        //Sparklines
        $('.sparkline').sparkline('html', { enableTagOptions: true, width: '95%' });

        //Navigation
        $("#menuMenu").click();
        $("#menuCal").click(function () {
            if ($(".calendar").is(":hidden")) $(".calendar").show("fast");
            else $(".calendar").hide("slow");
        });

        //Calendar Date
        selectedDate = new Date(); //This should come from C# TODO
        $('.calendar div').datepicker({ minDate: -100, maxDate: -1, setDate: selectedDate, onSelect: function (dateText, inst) { gotoDate(dateText) } });

        //Generate Charts
        $('.renderStockLineGraph').each(function () {
            EMTdash.generateStockChartC($(this).attr('id'));
        });
        $('.renderMediumGauge').each(function () {
            EMTdash.generateExtraSmallGauge($(this).attr('id'));
        });
        $('.renderOnionskinLineGraph').each(function () {
            EMTdash.generateLineGraph($(this).attr('id'));
            
        });


        // setTimeout(function () { window.location.href = document.URL }, 15000);

    });
//Calendar Click Action
    function gotoDate(date) {
        myURL = document.URL.split("?");
        window.location.href = myURL[0] + "?d=" + date;
    }

</script>
<link href="css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
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
    <div class="dash" style="display:none;">
        <div class="topPanel round"><h1>Dashboard Name</h1><h2>Day - Date</h2></div>
        <div class="bodyPanel round">
            <div style="position:relative;">
                <div style="background-color:transparent; position:absolute; width:75%; left:0px; top:0px;height:100px;">
                   
<!--First Stock Graph-->
                    <div class="renderOnionskinLineGraph" id="salesGraph" style="height: 380px; margin: 0 auto; overflow:hidden;">
                        <div class="date" >7/9/2012 12:00:00 AM</div>
                        <div class="title" >Sales</div>
                        <div class="hoverLabel" >Sales</div>
                        <div class="colors" >#b9d2ef,#e6e9ed</div>
                        <div class="data" >2171.57, 2618.99, 1949.55, 1999.50, 2108.30, 3042.35, 2591.78, 2838.25, 803.85, 2652.95, 3208.90, 2551.80, 1688.10, 3683.04, 4162.20, 3673.93, 4627.54, 1793.55, 4041.70, 4325.00, 3102.87, 3082.60, 3611.82, 2881.65, 3697.40, 3825.10, 3294.42, 4011.56, 3362.30, 3012.02, 2935.95, 3853.62, 3866.45, 4201.19, 2918.30, 3394.37, 3683.32, 2718.20, 2904.65, 2645.17, 3057.80, 2808.55, 1637.57, 3983.85, 2435.95, 4215.57, 4266.27, 2912.50, 3734.80, 2983.97, 2751.93, 3720.55, 3979.05, 5494.36, 3249.90, 3601.53, 5483.85, 3497.58, 3751.87, 3262.25, 2827.98, 3368.60, 2843.60, 3365.52, 3829.40, 2528.40, 3931.32, 2997.12, 2793.55, 3749.72, 4447.45, 2372.95, 3490.20, 2518.25, 2904.00, 3619.92, 2627.75, 3097.05, 2921.58, 3842.00, 3132.83, 2156.30, 2079.75, 2766.35, 2965.10, 3123.17, 3164.27, 3833.52, 2465.50, 2702.52, 3234.05, 3192.50, 3418.90, 3308.16, 3400.87, 1894.98, 2414.97, 2859.60, 2398.40, 2139.00, 2347.50, 2403.10, 3587.00, 2354.62, 2114.90, 2745.97, 3575.46, 3028.60, 2802.95, 2933.14, 3531.50, 2113.10, 1038.60, 2463.10, 1885.30, 1883.65, 2273.25, 1523.25, 2057.65, 1957.75, 3505.12, 2518.20, 2389.67, 1852.70, 3098.80, 1788.00, 2999.32, 2420.95, 2811.63, 1922.12, 1550.50, 1569.60, 2002.72, 1958.20, 2863.80, 3723.77, 1953.75, 1809.47, 2220.94, 2042.95, 2125.20, 1783.05, 1751.84, 3117.95, 2518.40, 1678.00, 2083.35, 1773.90, 2566.02, 3694.70, 1063.35, 1423.90, 2083.46, 1682.65, 1783.60, 1911.37, 2304.25, 2938.85, 2869.55, 3497.52, 3527.00, 3497.45, 2025.57, 2715.36, 1816.77, 2385.62, 1905.07, 2147.70, 2576.85, 949.22, 2391.45, 1828.00, 1383.50, 1872.95, 1943.62, 2258.35, 2583.92, 2690.23, 3516.91, 2299.00, 1787.30, 1869.55</div>
                    </div>
                   
                   <div class="clr" ></div>
                  <div style="position:relative;">
                        
                    </div>
                   <div class="clr" ></div>
<!--First Scaling Graph-->
                   
                   <div style="position:relative;">
<!-- RAW Consumption Module-->
                        
                   </div>
                   <div class="clr" ></div>
                </div>
                <div style="background-color:none; position:absolute; width:25%; right:0px; top:0px;height:300px;">
<!-- RAW Main Module-->
                    <div class="moduleMain" >
                        <div class="title" >Daily Adj Sales</div>
                        <div>
                        <div class="data" >
                            <div class="value" >$2,665</div>
                            <div class="avg" >2,714 AVG</div>
                        </div>
                        <div class="directionDown" >
                            <div><img src="down2.png" /></div>
                            <div class="count" >-1,168</div>
                            <div class="percent" >-0.30%</div>
                        </div>
                        </div>
                    </div>
                    <div class="clr" >
                    
<!-- RAW Dollar Module-->
                    
                    <div class="clr" ></div>

                </div>
        </div>
    </div>
</body>
</html>
