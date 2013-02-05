<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pocTemplateA.aspx.cs" Inherits="AEBNDashboard.pocTemplateA" %><!DOCTYPE html><html>
<head>
<title></title>
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/HighCharts/highcharts.js"></script>
<script src="js/HighCharts/highstock.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="js/erikORIG.js"></script>
<script src="js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="http://omnipotent.net/jquery.sparkline/1.6/jquery.sparkline.min.js"></script>
<script>
    $(document).ready(function () {
        selectedDate = new Date();

        data1 = [2171.57, 2618.99, 1949.55, 1999.50, 2108.30, 3042.35, 2591.78, 2838.25, 803.85, 2652.95, 3208.90, 2551.80, 1688.10, 3683.04, 4162.20, 3673.93, 4627.54, 1793.55, 4041.70, 4325.00, 3102.87, 3082.60, 3611.82, 2881.65, 3697.40, 3825.10, 3294.42, 4011.56, 3362.30, 3012.02, 2935.95, 3853.62, 3866.45, 4201.19, 2918.30, 3394.37, 3683.32, 2718.20, 2904.65, 2645.17, 3057.80, 2808.55, 1637.57, 3983.85, 2435.95, 4215.57, 4266.27, 2912.50, 3734.80, 2983.97, 2751.93, 3720.55, 3979.05, 5494.36, 3249.90, 3601.53, 5483.85, 3497.58, 3751.87, 3262.25, 2827.98, 3368.60, 2843.60, 3365.52, 3829.40, 2528.40, 3931.32, 2997.12, 2793.55, 3749.72, 4447.45, 2372.95, 3490.20, 2518.25, 2904.00, 3619.92, 2627.75, 3097.05, 2921.58, 3842.00, 3132.83, 2156.30, 2079.75, 2766.35, 2965.10, 3123.17, 3164.27, 3833.52, 2465.50, 2702.52, 3234.05, 3192.50, 3418.90, 3308.16, 3400.87, 1894.98, 2414.97, 2859.60, 2398.40, 2139.00, 2347.50, 2403.10, 3587.00, 2354.62, 2114.90, 2745.97, 3575.46, 3028.60, 2802.95, 2933.14, 3531.50, 2113.10, 1038.60, 2463.10, 1885.30, 1883.65, 2273.25, 1523.25, 2057.65, 1957.75, 3505.12, 2518.20, 2389.67, 1852.70, 3098.80, 1788.00, 2999.32, 2420.95, 2811.63, 1922.12, 1550.50, 1569.60, 2002.72, 1958.20, 2863.80, 3723.77, 1953.75, 1809.47, 2220.94, 2042.95, 2125.20, 1783.05, 1751.84, 3117.95, 2518.40, 1678.00, 2083.35, 1773.90, 2566.02, 3694.70, 1063.35, 1423.90, 2083.46, 1682.65, 1783.60, 1911.37, 2304.25, 2938.85, 2869.55, 3497.52, 3527.00, 3497.45, 2025.57, 2715.36, 1816.77, 2385.62, 1905.07, 2147.70, 2576.85, 949.22, 2391.45, 1828.00, 1383.50, 1872.95, 1943.62, 2258.35, 2583.92, 2690.23, 3516.91, 2299.00, 1787.30, 1869.55];
        data2 = [2171.57, 2618.99, 1949.55, 1999.50, 1922.12, 1550.50, 1569.60, 2002.72, 1958.20, 2863.80, 3723.77, 1953.75, 1809.47, 2220.94, 2042.95, 2125.20, 1783.05, 1751.84, 3117.95, 2518.40, 1678.00, 2083.35, 1773.90, 2566.02, 3694.70, 1063.35, 1423.90, 2083.46, 1682.65, 1783.60, 1911.37, 2304.25, 2938.85, 2869.55, 3497.52, 3527.00, 3497.45, 2025.57, 2715.36, 1816.77, 2385.62, 1905.07, 2147.70, 2576.85, 949.22, 2391.45, 1828.00, 1383.50, 1872.95, 1943.62, 2258.35, 2583.92, 2690.23, 3516.91, 2299.00, 1787.30, 1869.55]

        data3 = [[1125273600000, 45.84], [1125360000000, 46.57], [1125446400000, 46.89], [1125532800000, 46.26], [1125619200000, 46.22], [1125964800000, 48.80], [1126051200000, 48.68],
        [1126137600000, 49.78],
        [1126224000000, 51.31],
        [1126483200000, 51.40],
        [1126569600000, 50.82],
        [1126656000000, 49.61],
        [1126742400000, 49.87],
        [1126828800000, 51.21],
        [1127088000000, 52.64],
        [1127174400000, 53.19],
        [1127260800000, 52.11],
        [1127347200000, 51.90],
        [1127433600000, 53.20],
        [1127692800000, 53.84],
        [1127779200000, 53.44],
        [1127865600000, 51.08],
        [1127952000000, 52.34],
        [1128038400000, 53.61],
        [1128297600000, 54.44],
        [1128384000000, 53.75],
        [1128470400000, 52.78],
        [1128556800000, 51.70],
        [1128643200000, 51.30],
        [1128902400000, 50.37],
        [1128988800000, 51.59],
        [1129075200000, 49.25],
        [1129161600000, 53.74],
        [1129248000000, 54.00],
        [1129507200000, 53.44],
        [1129593600000, 52.21],
        [1129680000000, 54.94],
        [1129766400000, 56.14],
        [1129852800000, 55.66],
        [1130112000000, 56.79],
        [1130198400000, 56.10],
        [1130284800000, 57.03],
        [1130371200000, 55.41],
        [1130457600000, 54.47],
        [1130716800000, 57.59],
        [1130803200000, 57.50],
        [1130889600000, 59.95],
        [1130976000000, 61.85],
        [1131062400000, 61.15],
        [1131321600000, 60.23],
        [1131408000000, 59.90],
        [1131494400000, 60.11],
        [1131580800000, 61.18],
        [1131667200000, 61.54],
        [1131926400000, 61.45],
        [1132012800000, 62.28],
        [1132099200000, 64.95],
        [1132185600000, 64.52],
        [1132272000000, 64.56],
        [1132531200000, 64.96],
        [1132617600000, 66.52],
        [1132704000000, 67.11],
        [1132876800000, 69.34],
        [1133136000000, 69.66],
        [1133222400000, 68.10],
        [1133308800000, 67.82],
        [1133395200000, 71.60],
        [1133481600000, 72.63],
        [1133740800000, 71.82],
        [1133827200000, 74.05],
        [1133913600000, 73.95],
        [1134000000000, 74.08],
        [1134086400000, 74.33],
        [1134345600000, 74.91],
        [1134432000000, 74.98],
        [1134518400000, 72.01],
        [1134604800000, 72.18],
        [1134691200000, 71.11],
        [1134950400000, 71.38],
        [1135036800000, 72.11],
        [1135123200000, 73.50],
        [1135209600000, 74.02],
        [1135296000000, 73.35],
        [1135641600000, 74.23],
        [1135728000000, 73.57],
        [1135814400000, 71.45],
        [1135900800000, 71.89],
        [1136246400000, 74.75],
        [1136332800000, 74.97],
        [1136419200000, 74.38],
        [1136505600000, 76.30],
        [1136764800000, 76.05],
        [1136851200000, 80.86],
        [1136937600000, 83.90],
        [1137024000000, 84.29],
        [1137110400000, 85.59],
        [1137456000000, 84.71],
        [1137542400000, 82.49],
        [1137628800000, 79.04],
        [1137715200000, 76.09],
        [1137974400000, 77.67],
        [1138060800000, 76.04],
        [1138147200000, 74.20],
        [1138233600000, 72.33],
        [1138320000000, 72.03],
        [1138579200000, 75.00],
        [1138665600000, 75.51],
        [1138752000000, 75.42],
        [1138838400000, 72.10],
        [1138924800000, 71.85],
        [1139184000000, 67.30],
        [1139270400000, 67.60],
        [1139356800000, 68.81],
        [1139443200000, 64.95],
        [1139529600000, 67.31],
        [1139788800000, 64.71],
        [1139875200000, 67.64],
        [1139961600000, 69.22],
        [1140048000000, 70.57],
        [1140134400000, 70.29],
        [1140480000000, 69.08],
        [1140566400000, 71.32],
        [1140652800000, 71.75],
        [1140739200000, 71.46],
        [1140998400000, 70.99],
        [1141084800000, 68.49],
        [1141171200000, 69.10],
        [1141257600000, 69.61],
        [1141344000000, 67.72],
        [1141603200000, 65.48],
        [1141689600000, 66.31],
        [1141776000000, 65.66],
        [1141862400000, 63.93],
        [1141948800000, 63.19],
        [1142208000000, 65.68],
        [1142294400000, 67.32],
        [1142380800000, 66.23],
        [1142467200000, 64.31],
        [1142553600000, 64.66],
        [1142812800000, 63.99],
        [1142899200000, 61.81],
        [1142985600000, 61.67],
        [1143072000000, 60.16],
        [1143158400000, 59.96],
        [1143417600000, 59.51],
        [1143504000000, 58.71],
        [1143590400000, 62.33],
        [1143676800000, 62.75],
        [1143763200000, 62.72],
        [1144022400000, 62.65],
        [1144108800000, 61.17],
        [1144195200000, 67.21],
        [1144281600000, 71.24],
        [1144368000000, 69.79],
        [1144627200000, 68.67],
        [1144713600000, 67.99],
        [1144800000000, 66.71],
        [1144886400000, 66.47],
        [1145232000000, 64.81],
        [1145318400000, 66.22],
        [1145404800000, 65.65],
        [1145491200000, 67.63],
        [1145577600000, 67.04],
        [1145836800000, 65.75],
        [1145923200000, 66.17],
        [1146009600000, 68.15],
        [1146096000000, 69.36],
        [1146182400000, 70.39],
        [1146441600000, 69.60],
        [1146528000000, 71.62],
        [1146614400000, 71.14],
        [1146700800000, 71.13],
        [1146787200000, 71.89],
        [1147046400000, 71.89],
        [1147132800000, 71.03],
        [1147219200000, 70.60],
        [1147305600000, 68.15],
        [1147392000000, 67.70]
        ];

        //
        EMTdash.generateLineGraph("container3", Date.UTC(2012, 07, 12), "Other", "Stuff", "#b9d2ef", "#e6e9ed", data1);
        EMTdash.generateLineGraph("container2", Date.UTC(2008, 05, 05), "Erik", "Other Stuff", "#c1ecd2", "#e6e9ed", data2);
        EMTdash.generateStockChart("container", "please work", data3);
        EMTdash.generateSmallGauge("container4");
        //EMTdash.generateSmallGauge("container5");
        EMTdash.generateExtraSmallGauge("container5");
        EMTdash.generateMediumGauge("container6");

        //Sparklines
        $('.sparkline').sparkline('html', { enableTagOptions: true, width: '95%' });


        //Navigation
        $("#menuMenu").click();
        $("#menuCal").click(function () {
            if ($(".calendar").is(":hidden")) $(".calendar").show("fast");
            else $(".calendar").hide("slow");
        });
        $('.calendar div').datepicker({ minDate: -100, maxDate: -1, setDate: selectedDate, onSelect: function (dateText, inst) { gotoDate(dateText) } });
    });
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
    <div class="dash">
        <div class="topPanel round"><h1>Dashboard Name</h1><h2>Day - Date</h2></div>
        <div class="bodyPanel round">
            <div style="position:relative;">
                <div style="background-color:transparent; position:absolute; width:75%; left:0px; top:0px;height:100px;">
                   <div id="container" style="min-width: 400px; height: 250px; margin: 0 auto"></div>
                   <div class="clr" ></div>
                   <div style="position:relative;">
                        New Items Here
                    </div>
                   <div class="clr" ></div>
                   <div id="container2" style="min-width: 400px; height: 200px; margin: 0 auto"></div>
                   <div id="container3" style="min-width: 400px; height: 200px; margin: 0 auto"></div>
                    <div style="position:relative;">
                       Consumption Items Here
                   </div>
                   <div class="clr" ></div>
                </div>
                <div style="background-color:none; position:absolute; width:25%; right:0px; top:0px;height:300px;">
                   Main and Sales Info Here
                  

                    <div class="moduleA" >
                    <div class="title" ><a href="http://datac00523/Reports_SQL2012/Pages/Report.aspx?ItemPath=%2fRTi+Sessions&SelectedSubTabId=ReportDataSourcePropertiesTab">RTi Sessions</a></div>
                    <div class="moduleElement" >
                    <div class="directionDown" >
                    <div><img src="down2.png" /></div>
                    <div class="count" >18</div>
                    <div class="percent" >0.13%</div>
                    </div>
                    <div class="data" ><div class="value" >18</div>
                    <div class="avg" >14.00 AVG</div>
                    </div>
                    <div class="sparkline" >14,14,32,19,17,8,9,8,15,15,17,11,13,18,5,14,13,9,11,17,9,17,8,15,16,20,13,14,9,23,18</div>
                    </div>
                    <div class="moduleElement" ><div class="directionUp" ><div><img src="up2.png" /></div>
                    <div class="count" >325</div>
                    <div class="percent" >0.35%</div>
                    </div>
                    <div class="data" ><div class="value" >$1,258</div>
                    <div class="avg" >854 AVG</div>
                    </div>
                    <div class="sparkline" >725.00,795.00,2135.00,1015.00,1175.00,485.00,600.00,460.00,745.00,894.00,1077.00,610.00,705.00,1011.00,245.00,839.00,865.00,610.00,480.00,820.00,720.00,922.00,540.00,905.00,933.00,1304.00,812.00,1015.00,385.00,1255.00,1400.00</div>
                    </div>
                    </div>
                    <div class="clr" ></div>

                   <div id="container5" style="height: 160px; margin: 0 auto"></div>
                   <div>hello</div>
                    <div id="container6" style="height: 160px; margin: 0 auto"></div>
                    <div>hello</div>
                   <div id="container4" style="height: 160px; margin: 0 auto"></div>
                   <div>hello</div>
                </div>
        </div>
    </div>
</body>
</html>
