<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="FindPassword.aspx.vb" Inherits="Login_FindPassword" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-left:25px; margin-top:20px; text-align:left; height:400px;">
<div style="margin-bottom:15px; font-size:17px;">Finding password</div>
<div style="margin-bottom:10px; font-size:12px;">Please enter your Email as a Login ID.<br />
    Your password will be sent to your email address shortly.</div>
<div style="margin-bottom:10px; font-size:12px;"><asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox><br />
    <br />
    <asp:Button ID="btnFind" runat="server" Text="Find" ToolTip="Password will be sent to your email.." Width="64px" />
    &nbsp;
    <asp:Button ID="btnCancel"  runat="server" Text="Cancel" Width="64px" />
</div>

</div>
</asp:Content>

