<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pocModelRanking.aspx.cs" Inherits="AEBNDashboard.pocModelRanking" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.0.js"></script>
    <script>
        var modelJSON = '<%= JSON %>';
        var output = "";
        var obj = "";
        var obj2 = "";
        var rowCount = 1;
        var evenRow = "";

        $(function () {
            writeModelGrid(jQuery.parseJSON(modelJSON));
        });
        function writeModelGrid(JSON) {

            obj = JSON.Table1[0];
            
            output += "<table><tr class=\"head\">";
            var loopNum = 0;
            $.each(obj, function (index) { /*Header Row*/
                output += "<th onclick=\"sort("+loopNum+")\">" + index + "</th>";
                loopNum++;
            });
            //alert(obj.Table1[0]);
            output += "</tr>";
            
            $.each(obj.Table1, function (index, item) {
                if (isEven(rowCount)) evenRow = " class=\"even\"";
                else evenRow = "";
                output += "<tr" + evenRow + ">";
                loopNum = 0;
                $.each(item, function (index2, item2) { /*Model Object*/
                    output += "<td class=\"col" + loopNum + "\">" + item2 + "</td>";
                    loopNum++;
                });
                rowCount++;
                output += "</tr>";
            });
            output += "</table>";

            $("#modelGrid").html(output);
            
        }
        function isEven(value) {
            if (value % 2 == 0) return true;
            else return false;
        }
        function sort(item) {
            obj2 = $(obj.Table1).sort(sortDesc);
            //writeModelGrid(obj2);
            
            alert(obj2.Table1[0].Model);
        }
        function SortByName(x, y) {
            return ((x.Model == y.Model) ? 0 : ((x.Model > y.Model) ? 1 : -1));
        }
        
        function sortAsc(a, b) {
            if (a.Days_in_System == b.Days_in_System) {
                return 0;
            }
            return a.Days_in_System > b.Days_in_System ? 1 : -1;
        };
        function sortDesc(a, b) {
            alert(a);
            return sortAsc(a, b) * -1;
        };
    </script>
    <style>
        body span input{width:35px; margin-left:5px;}
        body span {margin:0px 10px; font:10pt verdana;}
        table{border-collapse:collapse; font:8pt verdana;}
        td, th {padding:2px 7px;}
        th {cursor:pointer;}
        tr { background-color:#999;}
        .head { background-color:blue;}
        .even{ background-color:#666;}
    </style>
</head>
<body>
    <span>Formula Modifiers:  </span>
    <span>RTP<input type="text" name="RTP" value=".5"/></span>
    <span>SP<input type="text" name="SP" value="1"/></span>
    <span>USP<input type="text" name="USP" value="5"/></span>
    <span>RP<input type="text" name="RP" value=".8"/></span>
    <span>SDP<input type="text" name="SDP" value=".005"/></span>
    <span>RDP<input type="text" name="RDP" value=".7"/></span>
    <span>FP<input type="text" name="FP" value=".1"/></span>

    <div id="modelGrid"></div>
</body>
</html>
