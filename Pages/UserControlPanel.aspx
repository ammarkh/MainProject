<%@ Page Title="Control Panel" Language="C#" MasterPageFile="~/Masters/ControlPanel.master" AutoEventWireup="true" CodeFile="UserControlPanel.aspx.cs" Inherits="Pages_UserControlPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView runat="server" ID="MultiUserPanal" ActiveViewIndex="0">
        <asp:View runat="server" ID="DefaultView">
        </asp:View>
        <asp:View runat="server" ID="ViewAddMarker">
            <p id="test">Adding Marker</p>
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
    <div id="map-container" style="position: absolute; height: 100%; width: 100%;"></div>
    <script type="text/javascript" src="../Scripts/UserControlPanelScript.js"></script>
</asp:Content>

