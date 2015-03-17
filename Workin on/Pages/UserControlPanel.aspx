<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/ControlPanel.master" AutoEventWireup="true" CodeFile="UserControlPanel.aspx.cs" Inherits="Pages_UserControlPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView runat="server" ID="MultiUserPanal" >
        <asp:View runat="server" ID="ViewAddMarker">
            add marker
        </asp:View>
        <asp:View ID="ViewDeleteMarker" runat="server">
            Delete Marker
        </asp:View>
        <asp:View ID="ViewUserInfo" runat="server">
                  <div style="position:absolute;top:3%;left:2%" id="divUserInformation" runat="server" >
                  <table>
                        <tr>
                            <td><label style="color:gray">UserName : </label></td>
                            <td ><asp:TextBox runat="server" ID="tboxUserName" ReadOnly="true"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label style="color:gray">First Name : </label></td>
                            <td ><asp:TextBox runat="server" ID="tboxFirstName" ReadOnly="true"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label style="color:gray">Last Name : </label></td>
                            <td ><asp:TextBox runat="server" ID="tboxLastName" ReadOnly="true" ></asp:TextBox></td>
                            <td><asp:LinkButton runat="server" ID="lbtnEditLastName" Text="Edit Personal Info" OnClick="lbtnEditLastName_Click" Style="text-decoration:none;color:gray" Font-Size="Small" ></asp:LinkButton></td>
                        </tr>
                        <tr>
                           <td><label style="color:gray">Email : </label></td>
                           <td ><asp:TextBox runat="server" ID="tboxEmail" ReadOnly="true"></asp:TextBox></td>
                           <td><asp:LinkButton runat="server" Font-Size="Small" ID="lbtnEditEmail" Text="Edit Email" OnClick="lbtnEditEmail_Click" Style="text-decoration:none;color:gray" ></asp:LinkButton></td>
                        </tr>
                        <tr>
                          <td><label style="color:gray">Cell-Phone : </label></td>
                          <td ><asp:TextBox runat="server" ID="tboxCellPhone" ReadOnly="true"></asp:TextBox></td>
                          <td><asp:LinkButton runat="server" ID="lbtnEditCellPhone" Font-Size="Small" Text="Edit Cell-Phone" OnClick="lbtnEditCellPhone_Click" Style="text-decoration:none;color:gray" ></asp:LinkButton></td>
                        </tr>
                        <tr>
                          <td><label style="color:gray">Password : </label></td>
                          <td><asp:LinkButton runat="server" ID="lbtnEditPassword" Text="Edit Password" Font-Size="Small" OnClick="lbtnEditPassword_Click" Style="text-decoration:none;color:gray" ></asp:LinkButton></td>
                        </tr>
                    </table>
                  </div>    
          <asp:MultiView runat="server" ID="MultiUserInfo" >
              <asp:View ID="viewEditPersonalInfo" runat="server">
                 <div style="position:absolute;top:3%;left:2%">
                  <table>
                      <tr>
                          <td><label style="color:gray">First Name :</label></td>
                          <td><asp:TextBox runat="server" ValidationGroup="Personal" ID="tboxEditFirstName"></asp:TextBox></td>
                          <td><asp:RequiredFieldValidator runat="server" ValidationGroup="v1" ControlToValidate="tboxEditFirstName" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
                          <td><label style="color:gray">First Name :</label></td>
                          <td><asp:TextBox runat="server" ValidationGroup="Personal" ID="tboxEditLastName"></asp:TextBox></td>
                          <td><asp:RequiredFieldValidator runat="server" ValidationGroup="v1" ControlToValidate="tboxEditLastName" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
                          <td><asp:Button runat="server" ID="btnBackPerosnal" Text="Back" OnClick="btnBackPerosnal_Click" Width="46px" /></td>
                          <td><asp:Button runat="server" ID="btnDonePersonalInfo" ValidationGroup="Personal" Text="Save" OnClick="btnDonePersonalInfo_Click" /></td>
                          <td><asp:Label runat="server" ID="lblErrorPersonal" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                      </tr>
                  </table>
                </div> 
              </asp:View>
              <asp:View ID="viewEditEmail" runat="server">
                  <div>
                      <table>
                          <tr>
                              <td><label style="color:gray">Email : </label></td>
                              <td><asp:TextBox runat="server"  ValidationGroup="Email" ID="tboxEditEmail"></asp:TextBox></td>
                              <td>
                                  <asp:RequiredFieldValidator runat="server" ValidationGroup="Email" ControlToValidate="tboxEditEmail" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator runat="server" ValidationGroup="Email" ControlToValidate="tboxEditEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ErrorMessage="Invild-Email" Font-Size="Small" Display="Dynamic"></asp:RegularExpressionValidator>
                              </td>
                          </tr>
                          <tr>
                              <td><asp:Button runat="server" ID="btnBackEmail" Text="Back" OnClick="btnBackPerosnal_Click" /></td>
                              <td><asp:Button runat="server" ID="btnDoneEmail" Text="Done" ValidationGroup="Email" OnClick="btnDoneEmail_Click" /></td>
                              <td><asp:Label runat="server" ID="lblErrorEmail" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                          </tr>
                      </table>
                  </div>
              </asp:View>
              <asp:View ID="viewEditCellPhone" runat="server">
                  <div>
                      <table>
                          <tr>
                              <td><label style="color:gray">Cell-Phone : </label></td>
                              <td><asp:TextBox runat="server" ValidationGroup="Phone" ID="tboxEditCellPhone"></asp:TextBox></td>
                              <td>
                                  <asp:RequiredFieldValidator runat="server" ValidationGroup="Phone" ControlToValidate="tboxEditCellPhone" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator runat="server" ValidationGroup="Phone" ControlToValidate="tboxEditCellPhone" ValidationExpression="\d{10,14}" ForeColor="Red" ErrorMessage="Invild-Number" Font-Size="Small" Display="Dynamic"></asp:RegularExpressionValidator>
                              </td>
                          </tr>
                          <tr>
                              <td><asp:Button runat="server" ID="btnBackCellPhone" Text="Back" OnClick="btnBackPerosnal_Click" /></td>
                              <td><asp:Button runat="server" ID="btnDoneCellPhone" Text="Save" ValidationGroup="Phone" OnClick="btnDoneCellPhone_Click" /></td>
                              <td><asp:Label runat="server" ID="lblErrorCellPhone" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                          </tr>
                      </table>
                  </div>
              </asp:View>
              <asp:View ID="viewChangePassword" runat="server">
                  <div>
                      <table>
                          <tr>
                              <td><label style="color:gray">Old Password :</label></td>
                              <td><asp:TextBox runat="server" ValidationGroup="Password" ID="tboxOldPassword" TextMode="Password"></asp:TextBox></td>
                              <td><asp:RequiredFieldValidator ValidationGroup="Password" runat="server" ControlToValidate="tboxOldPassword" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator></td>
                          </tr>
                          <tr>
                              <td><label style="color:gray">New Password :</label></td>
                              <td><asp:TextBox runat="server" ValidationGroup="Password" ID="tboxNewPassword" TextMode="Password"></asp:TextBox></td>
                              <td><asp:RequiredFieldValidator ValidationGroup="Password" runat="server" ControlToValidate="tboxNewPassword" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator></td>
                          </tr>
                          <tr>
                              <td><label style="color:gray">Confirm Password :</label></td>
                              <td><asp:TextBox runat="server" ID="tboxConfirmPassword" ValidationGroup="Password" TextMode="Password"></asp:TextBox></td>
                              <td>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="tboxConfirmPassword" ValidationGroup="Password" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                                  <asp:CompareValidator runat="server" ControlToValidate="tboxConfirmPassword" ControlToCompare="tboxNewPassword" ValidationGroup="Password" ErrorMessage="Don't Match" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:CompareValidator>
                              </td>
                          </tr>
                          <tr>
                              <td><asp:Button runat="server" ID="btnBackPassword" Text="Back" OnClick="btnBackPerosnal_Click" /></td>
                              <td><asp:Button runat="server" ID="btnDoneEditPassword" Text="Save" ValidationGroup="Password" OnClick="btnDoneEditPassword_Click" /></td>
                              <td><asp:Label runat="server" ID="lblErrorPassword" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                          </tr>
                      </table>
                  </div>
              </asp:View>
          </asp:MultiView>
        </asp:View>
        <asp:View ID="ViewAddAdvertisment"  runat="server">
          <div>
              <label>Choose </label>
          </div>
        </asp:View>
        <asp:View ID="ViewPrometAdvertisment" runat="server">
            Promet Adv
        </asp:View>
        <asp:View ID="ViewDeleteAdvertisment" runat="server">
            Delete Adv
        </asp:View>
    </asp:MultiView>
    <script type="text/javascript" src="../Scripts/UserControlPanelScript.js"></script>
</asp:Content>

