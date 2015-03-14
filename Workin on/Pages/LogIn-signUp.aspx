<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="LogIn-signUp.aspx.cs" Inherits="Pages_LogIn_signUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 130px;
        }
        .auto-style2 {
            width: 318px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <header><strong>3Alyamen</strong></header>
        </div>
        <div id="body">
    <div id="login" style="position:absolute;left:100px;width:400px;top:100px">
        <table>
            <tr>
                <td align="center" colspan="3"><strong >Sign-In Here !!</strong></td>
            </tr>
            <tr>
                <td width="100px"><label>UserName : </label></td>
                <td class="auto-style2" ><asp:TextBox ValidationGroup="v1" runat="server" ID="tboxUsername" Width="267px" ></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="validationUserName" ValidationGroup="v1" runat="server" ErrorMessage="*" ControlToValidate="tboxUsername"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td width="100px"><label>Password : </label></td>
                <td class="auto-style2" ><asp:TextBox runat="server" ValidationGroup="v1" ID="tboxPassword" Width="267px" TextMode="Password" ></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="validationPassword" runat="server" ValidationGroup="v1" ErrorMessage="*" ControlToValidate="tboxPassword"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="3"><asp:CheckBox runat="server" ID="cboxRememper" Font-Size="Medium" Text=" Rememper Me" /></td>
            </tr>
            <tr>
                <td width="100px"><asp:Button runat="server" ValidationGroup="v1" ID="btnSignin" Text="Sign-In" width="100px" OnClick="signinbtn_Click" /></td>
                <td class="auto-style2"><asp:Label runat="server" ID="lblError" Visible="false" Font-Size="Small"></asp:Label></td>
            </tr>
        </table>
        
    </div>
    <div id="signUp" style="position:absolute;left:550px;width:509px; top:100px">
        <table>
            <tr>
                <td colspan="3" align="center"><strong >Sign-Up Here !!</strong></td>
            </tr>
            <tr>
                <td class="auto-style1"><label>UserName : </label></td>
                <td ><asp:TextBox ValidationGroup="v2" runat="server" ID="tboxuserNameSignUp" Width="267px" ></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="userNameValidatior" runat="server" ValidationGroup="v2" ErrorMessage="*" Display="Dynamic" ControlToValidate="tboxuserNameSignUp"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="auto-style1"><label>Password : </label></td>
                <td ><asp:TextBox ValidationGroup="v2" runat="server" ID="tboxPasswordSignUp" Width="267px" TextMode="Password" ></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="passWordValidatior" runat="server" ValidationGroup="v2" ErrorMessage="*" Display="Dynamic" ControlToValidate="tboxPasswordSignUp"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="auto-style1"><label>Confirm Password : </label></td>
                <td ><asp:TextBox ValidationGroup="v2" runat="server" ID="tboxConfirmPassword" Width="267px" TextMode="Password" ></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="ConfirmPassValidator" runat="server" ValidationGroup="v2" ErrorMessage="*" Display="Dynamic" ControlToValidate="tboxPasswordSignUp"></asp:RequiredFieldValidator></td>
                <td><asp:CompareValidator runat="server" ID="CompareConfirmPassword" ValidationGroup="v2" ControlToCompare="tboxPasswordSignUp" Display="Dynamic" Font-Size="Small" ErrorMessage="Don't Match" ControlToValidate="tboxConfirmPassword"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td class="auto-style1"><label>Email : </label></td>
                <td ><asp:TextBox ValidationGroup="v2" runat="server" ID="tboxEmail" Width="267px" ></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="v2" ErrorMessage="*" ControlToValidate="tboxEmail"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Small" ControlToValidate="tboxEmail" ErrorMessage="Invalid Email" /></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Button runat="server" Display="Dynamic" ValidationGroup="v2" ID="btnSignUp" Text="Sign-Up" width="125px" OnClick="btnSignUp_Click" /></td>
                <td colspan="3" ><asp:Label runat="server" ID="lblErrorSignUp" Font-Size="Small" Visible="false"></asp:Label></td>
            </tr>
        </table>
    </div>
        </div>
    </form>
</body>
</html>
