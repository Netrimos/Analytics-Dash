<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AEBNDashboard.Default" %><!DOCTYPE html><html>
<head>
<title><%= currentPage %></title>
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="apple-touch-icon" href="/AEBN.png"/>

<script src="/js/jquery-1.8.0.min.js"></script>
<script src="/js/HighCharts/highcharts.js"></script>
<script src="/js/HighCharts/highstock.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="/js/erik.js"></script>
<script src="/js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="http://omnipotent.net/jquery.sparkline/1.6/jquery.sparkline.min.js"></script>
<script>
    
    var thisPage = "<%= thisPage %>";
    var thisDate = new Date("<%= thisDate %>");
    var greatestDate = new Date("<%= greatestDashDate %>");

    function gotoDash(date, page) {
        if (page == null) { page = thisPage }
        
        // Keep the jQuery date picker in the same format 9-5-2012
        date = date.replace("/", "-").replace("/", "-");

        $(".calendar").hide("fast");

        myURL = document.URL.split("?");
        if (date > greatestDate) { alert("no way man"); }
        else window.location.href = myURL[0] + "?p=" + page + "&d=" + date;
    }

    function clickNav(page) { gotoDash(thisDateToCleanString(), page); }

    function changeDateByOneDay(direction) {
        if (direction == "up") thisDate.setDate(thisDate.getDate() + 1);
        else if (direction == "down") thisDate.setDate(thisDate.getDate() - 1);
        gotoDash(thisDateToCleanString());
    }
    function openMenu(div) {
        keepClosed = false;
        if ($(div).is(":hidden")) keepClosed = true;
        if ($(".calendar").is(":visible")) $(".calendar").hide("fast");
        if ($(".menu").is(":visible")) $(".menu").hide("fast");
        if (keepClosed) $(div).show("fast");
    }
    function thisDateToCleanString(){
        return (thisDate.getMonth() + 1) + "-" + thisDate.getDate() + "-" + thisDate.getFullYear();
    }

    $(document).ready(function () {
        //Sparklines
        $('.sparkline').sparkline('html', { enableTagOptions: true, width: '95%' });

        //Navigation
        $("#menuMenu").click(function () { openMenu(".menu"); });
        $("#menuCal").click(function () { openMenu(".calendar"); });
        $("#up").click(function () { changeDateByOneDay("up"); });
        $("#down").click(function () { changeDateByOneDay("down"); });
        if (thisDate.toDateString() == greatestDate.toDateString()) $("#up").hide();

        //Calendar
        $('.calendar div').datepicker({ minDate: -100, maxDate: -1, onSelect: function (dateText, inst) { gotoDash(dateText) } });

        // Render Graphs
        $('.renderMediumGauge').each(function () { EMTdash.generateGaugeA($(this).attr('id')); });
        $('.renderScalingLineGraph').each(function () { EMTdash.generateLineGraph($(this).attr('id')); });
        $('.renderStockLineGraph').each(function () { EMTdash.generateStockChartC($(this).attr('id')); });
    });

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
        .navPanel div li{border-top:1px solid grey; list-style-type:none;padding:3px;}
        .navPanel #menuItems span{color:#ffffff; font-weight:bold; text-decoration:none; cursor:pointer;}
        .menu{top:50px;z-index:5;}
        .salesLineGraph, .consumptionLineGraph{border-bottom:1px solid #9f9f9f;border-top:1px solid #9f9f9f;}
        
</style>
</head>
<body>
    <div class="navPanel menu"><div id="menuItems">
   <%= navHTML %>
    </div>
    </div>
    <div class="navPanel calendar"><div></div></div>
    <div class="leftPanel">
    <div id="menuMenu" class="navItem"><img src="/menu.png" /></div>
    <div id="menuCal" class="navItem"><img src="/cal.png" /></div>
    <div id="menuPlay" class="navItem"><img src="/play.png" /></div>
    </div>
    <div class="dash">
        <div class="topPanel round"><h1><%= currentPage %></h1><h2><button id="down"> << </button><%= de.dashDateRaw %><button id="up"> >> </button></h2></div>
        <div class="bodyPanel round">
            <div style="position:relative;">
                <div style="background-color:transparent; position:absolute; width:75%; left:0px; top:0px;height:100px;">
                   <%= de.salesLineGraph %>
                   <div class="clr" ></div>
                   <div style="position:relative;">
                        <%= de.newClientsHtml %>
                    </div>
                   <div class="clr" ></div>
                   
                    <div style="position:relative;"><!-- Consumption GRAPH  -->
                       <%= de.consumptionHmtl %>
                   </div>
                   <div class="clr" ></div>
                </div>
                <div style="background-color:none; position:absolute; width:25%; right:0px; top:0px;height:300px;">
                   <%= de.mainHtml %>
                   <%= de.salesHtml %>
                </div>
        </div>
    </div>
</body>
</html>
