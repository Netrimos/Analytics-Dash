<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pocNavandDateFunctionality.aspx.cs" Inherits="AEBNDashboard.pocNavandDateFunctionality" %><!DOCTYPE html>

<html>
<head runat="server">
<title>Nav and Date Test</title>

<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
<link rel="apple-touch-icon" href="AEBN.png"/>
<script src="/js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="/js/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
<script>
    var isRanFromHomeScreen = navigator.standalone;
    if (isRanFromHomeScreen) document.write(isRanFromHomeScreen);
    else document.write("not full screen on iPad");


    var thisPage = "<%= thisPage %>";
    var thisDate = new Date("<%= thisDate %>");
    var greatestDate = new Date("<%= greatestDashDate %>");
    function gotoDate(date) {
        date = date.replace("/", "-").replace("/", "-");
        $(".calendar").hide("fast");
        myURL = document.URL.split("?");
        if (date > greatestDate) { alert("no way man"); }
        else window.location.href = myURL[0] + "?p=" + thisPage + "&d=" + date;
    }
    function changeDateByOneDay(direction) {
        if (direction == "up") thisDate.setDate(thisDate.getDate() + 1);
        else if (direction == "down") thisDate.setDate(thisDate.getDate() - 1);
         gotoDate((thisDate.getMonth()+1)+"/"+thisDate.getDate()+"/"+thisDate.getFullYear());
    }
    
    function openMenu(div) {
        keepClosed = false;
        if ($(div).is(":hidden")) keepClosed = true;
        if ($(".calendar").is(":visible")) $(".calendar").hide("fast");
        if ($(".menu").is(":visible")) $(".menu").hide("fast");
        if (keepClosed) $(div).show("fast");
    }
    function newData(){
        $("#cal").click(function () { openMenu(".calendar"); });
        $("#up").click(function () { changeDateByOneDay("up"); });
        $("#down").click(function () { changeDateByOneDay("down"); });
        if (thisDate.toDateString() == greatestDate.toDateString()) $("#up").hide();
        $('.calendar').datepicker({ minDate: -100, maxDate: -1, onSelect: function (dateText, inst) { gotoDate(dateText) } });
        
    }
    
    $(document).ready(function () { newData() });
</script>
</head>
<body>
    <div>Date of page: <%= thisDate %> | is never greater than: <%= greatestDashDate %></div>
    <div class="calendar" style="position:absolute; display:none; padding:10px; margin:10px; border:1px solid black; background-color:#ffffff;"></div>
    <div>
        ChangeDate: <button id="down"> << </button><input type="button" id="cal" value="ChangeDate"/><button id="up"> >> </button>
    </div>
    <div>
    
    </div>
    <div>
        ChangeNav: <span> RealTouch </span> | <span> Video </span>  (<%= thisPage %>)
    </div>

</body>
</html>
