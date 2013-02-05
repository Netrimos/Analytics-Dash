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
                    <div class="renderStockLineGraph" id="salesGraph" style="height: 380px; margin: 0 auto; overflow:hidden;">
                        <div class="date" >7/9/2012 12:00:00 AM</div>
                        <div class="title" >Sales</div>
                        <div class="hoverLabel" >Sales</div>
                        <div class="colors" >#b9d2ef,#e6e9ed</div>
                        <div class="data" >[[1321977600000 , 172512.90] ,[1322064000000 , 174985.20] ,[1322150400000 , 173057.85] ,[1322236800000 , 149236.55] ,[1322323200000 , 148648.85] ,[1322409600000 , 146027.20] ,[1322496000000 , 163484.80] ,[1322582400000 , 134818.53] ,[1322668800000 , 144163.81] ,[1322755200000 , 156472.15] ,[1322841600000 , 161598.90] ,[1322928000000 , 146274.97] ,[1323014400000 , 135678.65] ,[1323100800000 , 141259.60] ,[1323187200000 , 160819.72] ,[1323273600000 , 153434.71] ,[1323360000000 , 125882.63] ,[1323446400000 , 122200.35] ,[1323532800000 , 122816.40] ,[1323619200000 , 121438.90] ,[1323705600000 , 136753.35] ,[1323792000000 , 147686.16] ,[1323878400000 , 139335.09] ,[1323964800000 , 126572.05] ,[1324051200000 , 112277.55] ,[1324137600000 , 127096.96] ,[1324224000000 , 131016.12] ,[1324310400000 , 141745.40] ,[1324396800000 , 143384.77] ,[1324483200000 , 139171.52] ,[1324569600000 , 128249.75] ,[1324656000000 , 118204.37] ,[1324742400000 , 124644.83] ,[1324828800000 , 132755.91] ,[1324915200000 , 134932.20] ,[1325001600000 , 116492.33] ,[1325088000000 , 99677.29] ,[1325174400000 , 134976.18] ,[1325260800000 , 137618.59] ,[1325347200000 , 130750.80] ,[1325433600000 , 139541.24] ,[1325520000000 , 147553.41] ,[1325606400000 , 138276.48] ,[1325692800000 , 139828.72] ,[1325779200000 , 148773.71] ,[1325865600000 , 133826.15] ,[1325952000000 , 121627.54] ,[1326038400000 , 120865.61] ,[1326124800000 , 134257.11] ,[1326211200000 , 143580.69] ,[1326297600000 , 141235.85] ,[1326384000000 , 120419.09] ,[1326470400000 , 113298.69] ,[1326556800000 , 119364.91] ,[1326643200000 , 121988.48] ,[1326729600000 , 136858.24] ,[1326816000000 , 146499.63] ,[1326902400000 , 134801.31] ,[1326988800000 , 129112.64] ,[1327075200000 , 119593.15] ,[1327161600000 , 117017.02] ,[1327248000000 , 117006.94] ,[1327334400000 , 128705.53] ,[1327420800000 , 154541.96] ,[1327507200000 , 142633.86] ,[1327593600000 , 128377.68] ,[1327680000000 , 117171.57] ,[1327766400000 , 121591.88] ,[1327852800000 , 120552.10] ,[1327939200000 , 134223.86] ,[1328025600000 , 148494.43] ,[1328112000000 , 140383.20] ,[1328198400000 , 118330.77] ,[1328284800000 , 117605.23] ,[1328371200000 , 128002.44] ,[1328457600000 , 127709.01] ,[1328544000000 , 139617.69] ,[1328630400000 , 154619.66] ,[1328716800000 , 141915.66] ,[1328803200000 , 127309.17] ,[1328889600000 , 125286.37] ,[1328976000000 , 119472.88] ,[1329062400000 , 124482.71] ,[1329148800000 , 132634.75] ,[1329235200000 , 150213.97] ,[1329321600000 , 138805.16] ,[1329408000000 , 124347.50] ,[1329494400000 , 117829.27] ,[1329580800000 , 128243.96] ,[1329667200000 , 131996.22] ,[1329753600000 , 137821.79] ,[1329840000000 , 151144.74] ,[1329926400000 , 139449.87] ,[1330012800000 , 129081.38] ,[1330099200000 , 118173.13] ,[1330185600000 , 120855.63] ,[1330272000000 , 121540.36] ,[1330358400000 , 135480.56] ,[1330444800000 , 151429.64] ,[1330531200000 , 143796.70] ,[1330617600000 , 126880.35] ,[1330704000000 , 118350.11] ,[1330790400000 , 126492.03] ,[1330876800000 , 135633.24] ,[1330963200000 , 139208.00] ,[1331049600000 , 153330.90] ,[1331136000000 , 146513.22] ,[1331222400000 , 120006.36] ,[1331308800000 , 119049.81] ,[1331395200000 , 118732.52] ,[1331481600000 , 122566.83] ,[1331568000000 , 136890.71] ,[1331654400000 , 148874.91] ,[1331740800000 , 145334.94] ,[1331827200000 , 121841.06] ,[1331913600000 , 117465.85] ,[1332000000000 , 121647.80] ,[1332086400000 , 141513.05] ,[1332172800000 , 149462.92] ,[1332259200000 , 137854.00] ,[1332345600000 , 120682.98] ,[1332432000000 , 116977.74] ,[1332518400000 , 117811.23] ,[1332604800000 , 121452.73] ,[1332691200000 , 133148.11] ,[1332777600000 , 146866.59] ,[1332864000000 , 135649.63] ,[1332950400000 , 120829.07] ,[1333036800000 , 117462.46] ,[1333123200000 , 116787.39] ,[1333209600000 , 118707.53] ,[1333296000000 , 136678.39] ,[1333382400000 , 149474.67] ,[1333468800000 , 137595.00] ,[1333555200000 , 121656.80] ,[1333641600000 , 114084.53] ,[1333728000000 , 118478.44] ,[1333814400000 , 132625.35] ,[1333900800000 , 138211.47] ,[1333987200000 , 134811.06] ,[1334073600000 , 127019.17] ,[1334160000000 , 132523.90] ,[1334246400000 , 123457.03] ,[1334332800000 , 126294.67] ,[1334419200000 , 124528.31] ,[1334505600000 , 134256.69] ,[1334592000000 , 141945.79] ,[1334678400000 , 136415.74] ,[1334764800000 , 112692.14] ,[1334851200000 , 117740.97] ,[1334937600000 , 116560.39] ,[1335024000000 , 119871.92] ,[1335110400000 , 138999.70] ,[1335196800000 , 145159.09] ,[1335283200000 , 139806.57] ,[1335369600000 , 120303.07] ,[1335456000000 , 114701.57] ,[1335542400000 , 120204.66] ,[1335628800000 , 121741.32] ,[1335715200000 , 131950.08] ,[1335801600000 , 138157.25] ,[1335888000000 , 135860.77] ,[1335974400000 , 120597.35] ,[1336060800000 , 121184.95] ,[1336147200000 , 119102.70] ,[1336233600000 , 118186.48] ,[1336320000000 , 125550.49] ,[1336406400000 , 139223.37] ,[1336492800000 , 132536.24] ,[1336579200000 , 119129.34] ,[1336665600000 , 108201.95] ,[1336752000000 , 112986.48] ,[1336838400000 , 117158.33] ,[1336924800000 , 125744.65] ,[1337011200000 , 140706.26] ,[1337097600000 , 129531.52] ,[1337184000000 , 117800.07] ,[1337270400000 , 115097.10] ,[1337356800000 , 118018.29] ,[1337443200000 , 117541.02] ,[1337529600000 , 123361.61] ,[1337616000000 , 134844.65] ,[1337702400000 , 130741.19] ,[1337788800000 , 119604.93] ,[1337875200000 , 103286.83] ,[1337961600000 , 111966.80] ,[1338048000000 , 118518.38] ,[1338134400000 , 128301.13] ,[1338220800000 , 135294.49] ,[1338307200000 , 120293.51] ,[1338393600000 , 129647.44] ,[1338480000000 , 115730.15] ,[1338566400000 , 111172.92] ,[1338652800000 , 115130.43] ,[1338739200000 , 127704.07] ,[1338825600000 , 139607.19] ,[1338912000000 , 131624.88] ,[1338998400000 , 118812.48] ,[1339084800000 , 110813.28] ,[1339171200000 , 112659.72] ,[1339257600000 , 119517.57] ,[1339344000000 , 121242.09] ,[1339430400000 , 131302.78] ,[1339516800000 , 130440.27] ,[1339603200000 , 116028.12] ,[1339689600000 , 108714.04] ,[1339776000000 , 112174.57] ,[1339862400000 , 114809.29] ,[1339948800000 , 127683.44] ,[1340035200000 , 133619.31] ,[1340121600000 , 127241.73] ,[1340208000000 , 115347.14] ,[1340294400000 , 111457.82] ,[1340380800000 , 112973.80] ,[1340467200000 , 115901.74] ,[1340553600000 , 124109.38] ,[1340640000000 , 129159.78] ,[1340726400000 , 125790.23] ,[1340812800000 , 113383.97] ,[1340899200000 , 111901.51] ,[1340985600000 , 111569.43] ,[1341072000000 , 119647.02] ,[1341158400000 , 127471.42] ,[1341244800000 , 133230.38] ,[1341331200000 , 125734.87] ,[1341417600000 , 120049.23] ,[1341504000000 , 114391.77] ,[1341590400000 , 115885.41] ,[1341676800000 , 114165.81] ,[1341763200000 , 127050.97] ,[1341849600000 , 135078.71] ,[1341936000000 , 130436.40] ,[1342022400000 , 112931.95] ,[1342108800000 , 109260.42] ,[1342195200000 , 108816.83] ,[1342281600000 , 113382.30] ,[1342368000000 , 128003.09] ,[1342454400000 , 137946.27] ,[1342540800000 , 134851.26] ,[1342627200000 , 115098.78] ,[1342713600000 , 113950.32] ,[1342800000000 , 114001.80] ,[1342886400000 , 121891.74] ,[1342972800000 , 127054.47] ,[1343059200000 , 132277.23] ,[1343145600000 , 129259.11] ,[1343232000000 , 114035.74] ,[1343318400000 , 109747.19] ,[1343404800000 , 108470.39] ,[1343491200000 , 113322.59] ,[1343577600000 , 117458.17] ,[1343664000000 , 128875.40] ,[1343750400000 , 129806.89] ,[1343836800000 , 116848.06] ,[1343923200000 , 112267.51] ,[1344009600000 , 120988.63] ,[1344096000000 , 129699.09] ,[1344182400000 , 125502.68] ,[1344268800000 , 115703.59] ,[1344355200000 , 109507.07] ,[1344441600000 , 114558.09] ,[1344528000000 , 113409.03] ,[1344614400000 , 122452.74] ,[1344700800000 , 129381.12] ,[1344787200000 , 121113.40] ,[1344873600000 , 107797.10] ,[1344960000000 , 109886.62] ,[1345046400000 , 114905.91] ,[1345132800000 , 113804.24] ,[1345219200000 , 120078.86] ,[1345305600000 , 131450.27] ,[1345392000000 , 123193.24] ,[1345478400000 , 110358.54] ,[1345564800000 , 111174.04] ,[1345651200000 , 109776.61] ,[1345737600000 , 111311.29] ,[1345824000000 , 119993.98] ,[1345910400000 , 130620.20] ,[1345996800000 , 122756.87] ,[1346083200000 , 111332.25] ,[1346169600000 , 103539.68] ,[1346256000000 , 97895.65] ,[1346342400000 , 112256.60] ,[1346428800000 , 129058.69] ,[1346515200000 , 130573.08] ,[1346601600000 , 116681.61] ,[1346688000000 , 121597.36] ]</div>
                    </div>
                   
                   <div class="clr" ></div>
                  <div style="position:relative;">
                        <div class="renderMediumGauge" id="a682" style="float:left;width:20%;"><div class="fourRanges" >0,1199.384,1499.23,1595</div>
<div class="threeRangeColor" >#C02316,none,green</div>
<div class="title" ># Theater Signups</div>
<div class="percentage" >-0.02%</div>
<div class="data" >[1401]</div>
</div><div class="renderMediumGauge" id="a686" style="float:left;width:20%;"><div class="fourRanges" >0,70.4,88,276</div>
<div class="threeRangeColor" >#C02316,none,green</div>
<div class="title" ># VE Signups</div>
<div class="percentage" >-0.07%</div>
<div class="data" >[226]</div>
</div><div class="renderMediumGauge" id="a690" style="float:left;width:20%;"><div class="fourRanges" >0,0.376,0.47,20</div>
<div class="threeRangeColor" >#C02316,none,green</div>
<div class="title" ># Roku Signups</div>
<div class="percentage" >0.00%</div>
<div class="data" >[14]</div>
</div><div class="renderMediumGauge" id="a694" style="float:left;width:20%;"><div class="fourRanges" >0,44.64,55.8,110</div>
<div class="threeRangeColor" >#C02316,none,green</div>
<div class="title" ># Channel Count</div>
<div class="percentage" >0.00%</div>
<div class="data" >[46]</div>
</div><div class="renderMediumGauge" id="a698" style="float:left;width:20%;"><div class="fourRanges" >0,16.264,20.33,37</div>
<div class="threeRangeColor" >#C02316,none,green</div>
<div class="title" ># Bluray Signups</div>
<div class="percentage" >-0.30%</div>
<div class="data" >[7]</div>
</div>
                    </div>
                   <div class="clr" ></div>
<!--First Scaling Graph-->
                   
                   <div style="position:relative;">
<!-- RAW Consumption Module-->
                        <div class="moduleB" ><div class="title" ># Date Mins</div>
                        <div><div class="directionNone" ><div><img src="neutral2.png" /></div>
                        <div class="count" >-80</div>
                        </div>
                        <div class="data" ><div class="value" >340</div>
                        <div class="avg" >368.10 AVG</div>
                        </div>
                        <div class="sparkline" >195.10,573.85,333.87,358.00,166.33,181.98,213.48,212.12,236.00,396.00,197.45,220.52,532.22,89.45,299.93,287.98,204.13,194.88,3111.25,176.23,270.98,181.25,328.52,373.33,421.63,253.07,278.73,105.70,347.42,304.60,364.98</div>
                        </div>
                        </div>
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

                </div>
        </div>
    </div>
</body>
</html>
