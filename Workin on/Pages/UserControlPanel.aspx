<%@ Page Title="Control Panel" Language="C#" MasterPageFile="~/Masters/ControlPanel.master" AutoEventWireup="true" CodeFile="UserControlPanel.aspx.cs" Inherits="Pages_UserControlPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../CSSs/UserControlPanel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView runat="server" ID="MultiUserPanal" ActiveViewIndex="0">
        <asp:View runat="server" ID="DefaultView">
        </asp:View>
        <asp:View runat="server" ID="ViewAddMarker">
            <!--<input type="button" id="btnAddMarker" value="Add Marker" />
            <input type="text" id="tboxAddMarkerLat" style="visibility:hidden" />
            <input type="text" id="tboxAddMarkerLng" style="visibility:hidden" />-->
            <asp:Label ID="lblMarkerName" runat="server" Text="Place Name:"></asp:Label>
            <asp:TextBox ID="tboxMarkerName" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
            <asp:TextBox ID="tboxDesciption" runat="server"></asp:TextBox><br />
            <button id="btnpopupAddressButton">Set Address</button>
            <div id="popupContainer">
                <div id="addMarkerMapContainer"></div>
                <button id="btnpopupClose">Submit</button>
                <button id="btnPopupCurrentLocation">My Current Location</button>
            </div>
            <input type="text" id="tboxAddMarkerLat" style="visibility: hidden" runat="server" />
            <input type="text" id="tboxAddMarkerLng" style="visibility: hidden" runat="server" />
        </asp:View>
        <asp:View ID="ViewDeleteMarker" runat="server">
            Delete Marker
        </asp:View>
        <asp:View ID="ViewUserInfo" runat="server">
            User Info
        </asp:View>
        <asp:View ID="ViewEditInfo" runat="server">
            Edit Info
        </asp:View>
        <asp:View ID="ViewAddAdvertisment" runat="server">
            add Adv
        </asp:View>
        <asp:View ID="ViewPrometAdvertisment" runat="server">
            Promet Adv
        </asp:View>
        <asp:View ID="ViewDeleteAdvertisment" runat="server">
            Delete Adv
        </asp:View>

    </asp:MultiView>
    <script>

        (function (window, Codepros) {

            var popupDiv = document.getElementById('popupContainer'),
            mapContainer = document.getElementById('addMarkerMapContainer'),
            btnPopupShow = document.getElementById('btnpopupAddressButton'),
            btnPopupHide = document.getElementById('btnpopupClose'),
            btnPopupCurrentLocation = document.getElementById('btnPopupCurrentLocation'),
            tboxLat = document.getElementById('<%= tboxAddMarkerLat.ClientID %>'),
            tboxLng = document.getElementById('<%= tboxAddMarkerLng.ClientID %>'),
            myMap,
            cursorMarker,
            currentPosition;

            btnPopupHide.onclick = function () {
                tboxLat.value = cursorMarker.position.lat();
                tboxLng.value = cursorMarker.position.lng();
                //console.log(tboxLat.value);
                popupDiv.style.display = 'none';
                return false;
            }

            btnPopupShow.onclick = function () {
                popupDiv.style.display = 'block';

                myMap = Codepros.CreateNew(mapContainer, {
                    //center: new google.maps.LatLng(33.51849923765608, 36.287841796875),
                    center: myMap.GetCurrentPosition(),
                    zoom: 13,
                    geocoder: true,
                    styles: [{
                        featureType: 'poi',
                        elementtype: 'labels',
                        stylers: [
                        { visibility: 'off' }
                        ]
                    }]
                });
                myMap.Center(currentPosition);
                myMap._AttachEvents(myMap.gMap, [{
                    name: 'click',
                    callback: function (e) {
                        clearMap();
                        cursorMarker = myMap.CreateMarker({
                            lat: e.latLng.lat(),
                            lng: e.latLng.lng(),
                            draggable: true
                        })
                        console.log(myMap.markers);
                    }
                }])
                return false;
            }

            btnPopupCurrentLocation.onclick = function () {
                clearMap();
                //myMap.RemoveMarker(cursorMarker);
                cursorMarker = myMap.MarkCurrentPosition();
                console.log(cursorMarker);
                return false;
            }

            function clearMap() {
                if (cursorMarker) {
                    cursorMarker.setMap(null);
                }
            }

        })(window, window.Codepros)

    </script>
    <!--<script type="text/javascript" src="../Scripts/UserControlPanelScript.js"></script>-->
</asp:Content>

