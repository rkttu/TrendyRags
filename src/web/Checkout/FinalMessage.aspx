<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false"
    CodeFile="FinalMessage.aspx.vb" Inherits="Checkout_FinalMessage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: left; font-size: 18px; height: 45px; padding-top: 25px; padding-left: 15px;">
        Thank you!!
    </div>
    <div style="text-align: left; font-size: 14px; padding-top: 10px; padding-left: 20px;
        margin-bottom: 15px;">
        - Please print and keep this page until you receive your orders.<br />
        - Order No :
        <asp:Literal ID="ltrOrderNo" runat="server"></asp:Literal>
    </div>
    <div style="margin-bottom: 25px;">
        <asp:Table ID="tblOrders" runat="server" BorderColor="SaddleBrown" BorderStyle="Solid"
            BorderWidth="1px" CellPadding="0" CellSpacing="0" Width="780px" Font-Names="Microsoft Sans Serif"
            Font-Size="13px">
        </asp:Table>
    </div>
    <div style="text-align: left; margin-left: 15px; margin-bottom: 25px;">
        <table id="CardInformation" border="0" cellpadding="5" cellspacing="0" style="border: 1px solid #99ffcc;
            margin-top: 20px; width: 600px; font-size: 13px;">
            <tr>
                <td colspan="2" style="height: 24px">
                    <span style="font-size: 12pt; color: #99ffcc; text-decoration: underline"><strong><em>
                        Payment Information</em></strong></span>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Payment Method
                </td>
                <td style="width: 465px">
                    <asp:Literal ID="ltrCardType" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Card Holder
                </td>
                <td style="width: 355px">
                    <asp:Literal ID="ltrCardHolder" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Expires
                </td>
                <td style="width: 355px">
                    No display for security
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    CVV code
                </td>
                <td style="width: 355px">
                    No display for security
                </td>
            </tr>
        </table>
        <table id="BillingInformation" border="0" cellpadding="5" cellspacing="0" style="border: 1px solid #99ffcc;
            margin-top: 20px; width: 600px; font-size: 13px;">
            <tr>
                <td colspan="2">
                    <span style="font-size: 12pt; color: #99ffcc; text-decoration: underline"><strong><em>
                        Billing Information</em></strong></span>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Name
                </td>
                <td>
                    <asp:Literal ID="ltrBillName" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px" valign="top">
                    Address
                </td>
                <td>
                    <asp:Literal ID="ltrBillAddress" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Phone
                </td>
                <td>
                    <asp:Literal ID="ltrBillPhone" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span style="font-size: 12pt; color: #99ffcc; text-decoration: underline"><em><strong>
                        Shipping Information</strong></em></span>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Name
                </td>
                <td>
                    <asp:Literal ID="ltrShipName" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px" valign="top">
                    Address
                </td>
                <td>
                    <asp:Literal ID="ltrShipAddress" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Phone
                </td>
                <td>
                    <asp:Literal ID="ltrShipPhone" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Shipping Method
                </td>
                <td>
                    <asp:Literal ID="ltrShippingMethod" runat="server"></asp:Literal>
                    <asp:Literal ID="ltrShippingFee" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnContinue" runat="server" Text="OK" Width="100px" /><br />
    </div>
</asp:Content>
