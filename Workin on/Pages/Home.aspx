﻿<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="lbl" ></asp:Label><br />
        <asp:Button runat="server" ID="btnPanal" Text="My Panal" OnClick="btnPanal_Click" />
        
    </div>
    </form>
</body>
</html>
