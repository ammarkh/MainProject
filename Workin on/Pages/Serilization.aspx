<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Serilization.aspx.cs" Inherits="Pages_Serilization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body, html {
            margin: 0px;
            padding: 0px;
        }

        #container {
            width: 100%;
            height: 100%;
            position: absolute;
        }
    </style>
    <script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false"></script>
    <script>
        function init() {
            var markers = <%=ConvertDataTabletoString()%>;
            console.log(markers);
            var mapOption = {
                center:new google.maps.LatLng(markers[0].lat,markers[0].lng),
                zoom:10
            };
            var myMap = new google.maps.Map(document.getElementById('container'),mapOption);
        }
    </script>
</head>
<body onload="init()">
    <div id="container"></div>
</body>
</html>
