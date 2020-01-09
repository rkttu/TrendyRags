<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="OrderHistory.aspx.vb" Inherits="MyAccount_OrderHistory" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-top: 25px; margin-left: 20px;">
        <div style="font-family: Verdana; font-size: 24px; color: #DB0008; text-align: left; margin-bottom:25px;">My Account</div>
        <asp:Table ID="tblHistory" runat="server" BorderColor="#C04000" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" CellSpacing="0" Font-Names="Verdana" Font-Size="12px" HorizontalAlign="Left" Width="780px">
            <asp:TableRow runat="server">
                <asp:TableCell ID="Date" runat="server" BorderColor="#C04000" BorderStyle="Solid" BorderWidth="1px" Width="160px">Date</asp:TableCell>
                <asp:TableCell ID="OrderNo" runat="server" BorderColor="#C04000" BorderStyle="Solid" BorderWidth="1px" Width="100px">Order No.</asp:TableCell>
                <asp:TableCell ID="Products" runat="server" BorderColor="#C04000" BorderStyle="Solid"  BorderWidth="1px" Width="230px">Products</asp:TableCell>
                <asp:TableCell ID="OrderAmount" runat="server" BorderColor="#C04000" BorderStyle="Solid"  BorderWidth="1px" Width="120px">Order Amount</asp:TableCell>
                <asp:TableCell ID="Status" runat="server" BorderColor="#C04000" BorderStyle="Solid"  BorderWidth="1px" Width="120px">Status</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>

