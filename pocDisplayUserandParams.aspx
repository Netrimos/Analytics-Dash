<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pocDisplayUserandParams.aspx.cs" Inherits="AEBNDashboard.pocDisplayUserandParams" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        URL = <%= uri %>
    </div>
    <div>
        d = <%= d %>
    </div>
    <div>
        p = <%= p %>
    </div>
    <div>
        Name = <%= name %>
    </div>
    </form>
</body>
</html>
