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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false"></script>
    <script type="text/javascript" src="../Scripts/jquery1.10.2.js"></script>
    <script type="text/javascript" src="../Scripts/jqueryui1.11.3.js"></script>
    <script type="text/javascript" src="../Scripts/list.js"></script>
    <script type="text/javascript" src="../Scripts/MarkerClusterer.js"></script>
    <script type="text/javascript" src="../Scripts/Codepros.js"></script>
    <script>
    </script>
</head>
<body>
    <div id="container"></div>
    <script>
        (function (window, Codepros) {
            var markers = <%= JSONHelper.AllMarkers() %>;
            var myMap = Codepros.CreateNew(document.getElementById('container'), {
                center : new google.maps.LatLng(markers[0].lat,markers[0].lng),
                zoom:9
            });
            for(var marker in markers){
                var toAdd = markers[marker];
                myMap.CreateMarker({
                    lat:toAdd.lat,
                    lng:toAdd.lng,
                    content:toAdd.content
                });
            }
            console.log(myMap.markers);
        })( window, window.Codepros );
    </script>
</body>
</html>
