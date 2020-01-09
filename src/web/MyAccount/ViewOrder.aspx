<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="ViewOrder.aspx.vb" Inherits="MyAccount_ViewOrder" title="Untitled Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="text-align: left; margin-left: 15px; margin-top: 10px; font-size: 17px; font-family: Verdana, Arial, Sans-Serif; font-style: italic; color: #FFFFFF;">
        Order No : <asp:Literal ID="ltrOrderNo" runat="server"></asp:Literal></div>
    <div style="text-align: left; margin-left: 15px; margin-top: 10px; margin-bottom: 20px;
        font-size: 12px; font-family: Verdana, Arial, Sans-Serif;">
        <asp:Table ID="tblOrder" runat="server" BorderColor="SaddleBrown" BorderStyle="Solid"
            BorderWidth="1px" CellPadding="0" CellSpacing="0" Width="780px">
            <asp:TableRow ID="TableRow1" runat="server" BorderWidth="1px" Height="24px">
                <asp:TableCell ID="TableCell1" runat="server" BorderStyle="Solid" BorderWidth="1px"
                    HorizontalAlign="Center" Width="320px">I t e m</asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" BorderStyle="Solid" BorderWidth="1px"
                    HorizontalAlign="Center" Width="130px">Unit Price</asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server" BorderStyle="Solid" BorderWidth="1px"
                    HorizontalAlign="Center" Width="100px">Quantity</asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server" BorderStyle="Solid" BorderWidth="1px"
                    HorizontalAlign="Center" Width="130px">Sub Total</asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server" BorderStyle="Solid" BorderWidth="1px"
                    HorizontalAlign="Center" Width="100px">Remarks</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <table id="CardInformation" border="0" cellpadding="5" cellspacing="0" style="margin-top: 20px;
            width: 500px; border-style: solid; border-width: 1px; border-color: #99ffcc">
            <tr>
                <td colspan="2">
                    <span style="font-size: 11pt; color: #99ffcc; text-decoration: underline"><strong><em>
                        Payment and Shipping Information</em></strong></span></td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Card Type</td>
                <td>
                    <asp:Literal ID="ltrCardType" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Pay Status</td>
                <td>
                    <asp:Literal ID="ltrPayStatus" runat="server"></asp:Literal></td>
            </tr>
            <tr><td style="width: 134px">
                    Shipping Method</td>
                <td>
                    <asp:Literal ID="ltrShippingMethod" runat="server"></asp:Literal>
                    <asp:Literal ID="ltrShippingFee" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Order Status</td>
                <td>
                    <asp:Literal ID="ltrOrderStatus" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Tracking Info</td>
                <td>
                    <asp:LinkButton ID="lbtnTracking" runat="server">LinkButton</asp:LinkButton></td>
            </tr>
        </table>
        <table id="BillingInformation" border="0" cellpadding="5" cellspacing="0" style="margin-top: 20px;
            width: 500px; border-style: solid; border-width: 1px; border-color: #99ffcc">
            <tr>
                <td colspan="2">
                    <span style="font-size: 11pt; color: #99ffcc; text-decoration: underline"><strong><em>
                        Bill to:</em></strong></span></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Name</td>
                <td>
                    <asp:Literal ID="ltrBillName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px" valign="top">
                    Address</td>
                <td>
                    <asp:Literal ID="ltrBillAddress" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Phone</td>
                <td>
                    <asp:Literal ID="ltrBillPhone" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <span style="font-size: 11pt; color: #99ffcc; text-decoration: underline"><em><strong>
                        Ship to:</strong></em></span></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Name</td>
                <td>
                    <asp:Literal ID="ltrShipName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px" valign="top">
                    Address</td>
                <td>
                    <asp:Literal ID="ltrShipAddress" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Phone</td>
                <td>
                    <asp:Literal ID="ltrShipPhone" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnBack" runat="server" Text="Back" Width="80px" />&nbsp;
    </div>
</asp:Content>
