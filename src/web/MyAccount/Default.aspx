<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="MyAccount_Default" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-top:25px; margin-left:20px;">
    <div style=" font-family:Verdana; font-size:24px; color:#DB0008; text-align:left; ">My Account</div>
    <ul style="margin-top:35px; text-align:left; font-size:12px; font-family:Verdana;">
       <li><asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MyAccount/MyAccount.aspx" Font-Names="Verdana" Font-Size="12px">Update my profile</asp:LinkButton><br /><br /><br /></li>
       <li><asp:LinkButton ID="LinkButton2" runat="server" Font-Names="Verdana" Font-Size="12px">Change my password</asp:LinkButton><br /><br /><br /></li> 
       <li><asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/MyAccount/OrderHistory.aspx" Font-Names="Verdana" Font-Size="12px">Order history / Tracking order</asp:LinkButton><br /></li>
    </ul>

</div>
</asp:Content>

