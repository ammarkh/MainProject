<%@ Page Title="Control Panel" Language="C#" MasterPageFile="~/Masters/ControlPanel.master" AutoEventWireup="true" CodeFile="UserControlPanel.aspx.cs" Inherits="Pages_UserControlPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView runat="server" ID="MultiUserPanal" ActiveViewIndex="0">
        <asp:View runat="server" ID="DefaultView">
        </asp:View>
        <asp:View runat="server" ID="ViewAddMarker">
            <!-- DataBlock -->

            <asp:HiddenField ID="hfLat" runat="server" />
            <asp:HiddenField ID="hfLng" runat="server" />
            <asp:HiddenField ID="hfSelectedGenre" runat="server" Value="Resturant" />
            <asp:HiddenField ID="hfSelectedIndex" runat="server" Value="1" />
            <asp:HiddenField ID="hfAddress" runat="server" />
            <asp:HiddenField ID="hfDeterminOP" runat="server" />
            <asp:HiddenField ID="hfSelectedID" runat="server" />

            <!--Main Map Div-->

            <div id="divAddMarkerMapContainer"></div>
            <input type="button" id="btnAddMarker" class="btn btn-info btn-group-xs" value="Add marker" title="Add Place to the Map" />
            <input type="button" id="btnAddBranch" class="btn btn-info btn-group-xs" value="Add Branch" title="Add Branch to Exsisting Marker" />
            <asp:Label runat="server" ID="lblTest"></asp:Label>

            <!--End Main Div-->

            <!-- Select Category Div -->

            <div class="modal fade" id="basicInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="basicInfoLabel">Basic Information</h4>
                        </div>
                        <div class="modal-body">
                            Select a Category :<br />
                            <asp:DropDownList runat="server" ID="ddlSelectGenre" class="form-control"></asp:DropDownList><br />
                            Enter Marker's Name :<br />
                            <input type="text" class="form-control" runat="server" id="tboxMarkerName" />
                        </div>
                        <div class="modal-footer">
                            <button id="btnSelectCategorySubmit" type="button" class="btn btn-primary">Continue</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--End Select Category Div -->
            <!--All Info -->

            <div class="modal fade" id="AllInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="AllInfoLabel"></h4>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <h4>Name</h4>
                                    </td>
                                    <td>
                                        <h5 id="lblMarkerName">test</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4>Address</h4>
                                    </td>
                                    <td>
                                        <h5 id="lblMarkerAddress"></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4>Phone</h4>
                                    </td>
                                    <td>
                                        <input id="tboxPhone" type="text" runat="server" class="form-control" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4>Website</h4>
                                    </td>
                                    <td>
                                        <input id="tboxWebsite" type="text" runat="server" class="form-control" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4>Genre</h4>
                                    </td>
                                    <td>
                                        <h5 id="lblMarkerGenre"></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4>Discription</h4>
                                    </td>
                                    <td>
                                        <textarea id="tboxDescription" rows="9" class="form-control" runat="server"></textarea></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSubmitMarker" Text="Add" class="btn btn-primary" runat="server"
                                OnClick="btnSubmitMarker_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>

            <!--End All Info -->


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
            <input type="button" value="ShowMap" id="btnShowMap" />
            <div id="map-Div" style="position: absolute; left: 20px; border-radius: 20px; display: none; width: 800px; height: 800px"></div>
        </asp:View>
        <asp:View ID="ViewPrometAdvertisment" runat="server">
            Promet Adv
        </asp:View>
        <asp:View ID="ViewDeleteAdvertisment" runat="server">
            Delete Adv
        </asp:View>

    </asp:MultiView>
    <!--2b Sham Script-->
    <script>

        (function (window, Codepros) {

            var btnAddMarker = document.getElementById('btnAddMarker'),
                btnAddBranch = document.getElementById('btnAddBranch'),
                mapContainer = document.getElementById('divAddMarkerMapContainer'),
                divSelectCategory = document.getElementById('divSelectCategory'),
                btnSubmitBasicInfo = document.getElementById('btnSelectCategorySubmit'),
                allInfoHeaderLabel = document.getElementById('AllInfoLabel'),
                lblMarkerName = document.getElementById('lblMarkerName'),
                lblMarkerAddress = document.getElementById('lblMarkerAddress'),
                lblMarkerCategory = document.getElementById('lblMarkerGenre'),
                tboxLat = document.getElementById('<%=hfLat.ClientID%>'),
                tboxLng = document.getElementById('<%=hfLng.ClientID%>'),
                ddlSelectGenre = document.getElementById('<%=ddlSelectGenre.ClientID%>'),
                tboxSelectedGenre = document.getElementById('<%=hfSelectedGenre.ClientID%>'),
                tboxMarkerName = document.getElementById('<%=tboxMarkerName.ClientID%>'),
                tboxAddress = document.getElementById('<%=hfAddress.ClientID%>'),
                tboxDeterminOP = document.getElementById('<%=hfDeterminOP.ClientID%>');

            var myMap = Codepros.CreateNew(mapContainer, {
                center: new google.maps.LatLng(35, 35),
                zoom: 9,
                geocoder:true
            });
            //myMap.PushControl(btnAddMarker, 'top_right');
            //myMap.PushControl(btnAddBranch, 'top_right');

            btnAddMarker.onclick = function () {
                tboxDeterminOP.value = "branch";
                myMap.gMap.setOptions({ draggableCursor: 'cursor' });
                myMap._OnOnce({
                    obj: myMap.gMap,
                    event: 'click',
                    callback: function (e) {
                        tboxLat.value = e.latLng.lat();
                        tboxLng.value = e.latLng.lng();

                        $('#basicInfo').modal('show');
                    }
                })
            }

            btnSubmitBasicInfo.onclick = function () {
                var address = '';
                $('#basicInfo').modal('hide');
                allInfoHeaderLabel.innerHTML = "Adding " + tboxSelectedGenre.value;
                lblMarkerName.innerHTML = tboxMarkerName.value;
                myMap.Geocode({
                    latLng: new google.maps.LatLng(tboxLat.value, tboxLng.value),
                    success: function (results) {
                        if (results[0].address_components) {
                            address = [
							(results[0].address_components[0] && results[0].address_components[0].short_name || ''),
							(results[0].address_components[1] && results[0].address_components[1].short_name || ''),
							(results[0].address_components[2] && results[0].address_components[2].short_name || '')
                            ].join(' ');
                        }
                        lblMarkerAddress.innerHTML = address;
                        tboxAddress.value = address;
                    }
                })
                lblMarkerGenre.innerHTML = tboxSelectedGenre.value;
                $('#AllInfo').modal('show');
            }

            ddlSelectGenre.onChange = function () {
                alert('changed');
            }
            btnAddBranch.onclick = function () {
                var markers,
                    markerToAdd,
                    counter = 0;

                tboxDeterminOP.value = "branch";
                markers = <%=JSONHelper.GetMasterMarkerByUserId(18)%>;
                for( var marker in markers ) {
                    counter = counter + 1;
                    markerToAdd = markers[marker];
                    myMap.CreateMarker({
                        lat:markerToAdd.LAT,
                        lng:markerToAdd.LNG,
                        id:counter,
                        name:markerToAdd.MARKER_NAME,
                        animation:google.maps.Animation.DROP,
                        content:markerToAdd.MARKER_NAME+"<br/>"+markerToAdd.DESCRIPTION+"<br/>Pin this Master<input type='button' id='submit"+counter+"' value='Submit' class = 'btn btn-primary' onClick = 'DetermineMaster("+counter+")'/>"
                    });
                }
            }
            window.myMap = myMap;
        })(window, window.Codepros)

        function ChangeLabelText() {

            var ddlSelectGenre = document.getElementById('<%=ddlSelectGenre.ClientID%>'),
                tboxSelectedGenre = document.getElementById('<%=hfSelectedGenre.ClientID%>'),
                tboxSelectedIndex = document.getElementById('<%=hfSelectedIndex.ClientID%>');

            tboxSelectedGenre.value = ddlSelectGenre.options[ddlSelectGenre.selectedIndex].text;
            tboxSelectedIndex.value = ddlSelectGenre.selectedIndex+1;
        }
        function DetermineMaster( counter ) {
            var tboxSelectedId = document.getElementById('<%=hfSelectedID.ClientID%>'),
                tboxLat = document.getElementById('<%=hfLat.ClientID%>'),
                tboxLng = document.getElementById('<%=hfLng.ClientID%>');

            myMap.RemoveBy(function(marker){
                return marker.id != counter;
            });
            tboxSelectedId.value = counter-1;
            myMap._OnOnce({
                obj: myMap.gMap,
                event: 'click',
                callback: function (e) {
                    tboxLat.value = e.latLng.lat();
                    tboxLng.value = e.latLng.lng();

                    $('#basicInfo').modal('show');
                }
            })
        }

    </script>
</asp:Content>

