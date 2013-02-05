<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Realtouch.aspx.cs" Inherits="AEBNDashboard.Realtouch" %><!DOCTYPE html>
<html>
<head>
    <title>AEBN Dashboard - RealTouch</title>
    <script src="http://code.jquery.com/jquery-1.7.2.js"></script>
    <script src="http://omnipotent.net/jquery.sparkline/2.0/jquery.sparkline.min.js"></script>    
    <script>
        $(document).ready(function () {
            $('.sparkline').sparkline('html', { enableTagOptions: true });
            $('.lastWeekValue').each(function () {
                if (parseInt($(this).html()) < 0) { $(this).removeClass('up'); $(this).addClass('down'); }
                else { $(this).removeClass('down'); $(this).addClass('up'); }
            });
            $('#tabLabel').click(function () {
                if ($("#tabBody").is(":hidden")) $("#tabBody").slideDown();
                else $("#tabBody").slideUp();
            });            
        });
        var currentW = 0;
        var swapW = 360;
        var makeMobile = false;
        
        $(window).resize(function () {
            currentW = $(document).width();
            if (currentW > swapW) {
                prevW = currentW;
                if (makeMobile) $('body').removeClass('moblie');
                makeMobile = false;
                $('#screenRes').html("false");
            }
            else if (currentW < swapW) {
                if (!makeMobile) $('body').addClass('moblie');
                makeMobile = true;
                $('#screenRes').html("true");
            }
        });

               

    </script>
    <style>
        html, body{border:0px;margin:0px;padding:0px;}
        /*body{background-color:#1169a6;}*/
        #DashA{}
        .dashboardA{float:left;width:180px;padding:10px 5px;position:relative;}
        .dashboardA .label{font:bold 18px arial;}
        .dashboardA .sparkline{position:absolute;}  
        .dashboardA .average{position:absolute; font: 12px arial; left:90px;} 
        .dashboardA .lastWeekValue{background-repeat:no-repeat; font: 10px arial; margin: 5px 5px 0px 0px; float:left; height:21px;}
        .dashboardA .up{background-image:url('up.png'); padding-top:10px; color:green; }
        .dashboardA .down{background-image:url('down.png'); color:red;}
        .dashboardA .thisValue{float:left;font:bold 28px arial;}
        .dashboardA .row1, .dashboardA .row2{position:relative;height:20px;}
        .dashboardA .row2{height:30px;}
        h1{font:bold 28px arial;margin:0px;padding:5px;background-color:#000000;color:#ffffff;}
        h1 span{font:bold 16px arial;}
        #tabBody{background-color:#1169a6;display:none;padding:10px;}
        #tab{position:relative;}
        #tab #tabLabel{position:absolute;right:0px; cursor:pointer;font: bold 12px arial;background-color:#1169a6;padding:5px;color:#ffffff;}
        .mobile .dashboardA{width:300px;}
        .mobile .dashboardA .row1{width:160px;}
        .mobile .dashboardA .row2{position:absolute; left:170px; top:10px;}
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"  /-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
</head>
<body class="mobile">
   <div id="tabBody">hello
       <div id="screenRes"></div>
       <div id="screenRes2"></div>
   </div>
   <div id="tab"><div id="tabLabel">Options</div></div>

   <h1>RealTouch <span><%= date %></span></h1>
   <div id="DashA">
    <%= metricData %>
   </div>
   
</body>
</html>
