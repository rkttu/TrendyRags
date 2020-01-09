<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="ReviewOrder.aspx.vb" Inherits="Checkout_ReviewOrder" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="text-align: left; margin-left: 15px; margin-top: 10px; font-size: 17px; font-family: Verdana, Arial, Sans-Serif; font-style: italic; color: #FFFFFF;">
        <a href="ViewCART.aspx" style="font-size: 17px"><u>CART</u></a> - 
        <a href="https://www.TrendyRags.com/CheckOut/Checkout.aspx" style="font-size: 17px"><u>Billing/Shipping Address</u></a> - <span style="color: #FE7901;">[Review/Submit]</span> - Complete</div>
    <div style="text-align: left; margin-left: 15px; margin-top: 10px; margin-bottom: 20px; font-size: 12px; font-family: Verdana, Arial, Sans-Serif;">
        <asp:Table ID="tblCART" runat="server" BorderColor="SaddleBrown" BorderStyle="Solid"  BorderWidth="1px" CellPadding="0" CellSpacing="0" Width="780px">
            <asp:TableRow ID="TableRow1" runat="server" BorderWidth="1px" Height="24px">
                <asp:TableCell ID="TableCell1" runat="server" BorderStyle="Solid" BorderWidth="1px"  HorizontalAlign="Center" Width="320px">I t e m</asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" BorderStyle="Solid" BorderWidth="1px"  HorizontalAlign="Center" Width="130px">Unit Price</asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server" BorderStyle="Solid" BorderWidth="1px"  HorizontalAlign="Center" Width="100px">Quantity</asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server" BorderStyle="Solid" BorderWidth="1px"  HorizontalAlign="Center" Width="130px">Sub Total</asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server" BorderStyle="Solid" BorderWidth="1px"  HorizontalAlign="Center" Width="100px">Remarks</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
 
        <table id="CardInformation" border="0" cellpadding="5" cellspacing="0" style="margin-top:20px; width:500px; border-style:solid; border-width:1px; border-color:#99ffcc">
            <tr>
                <td colspan="2">
                        <span style="font-size: 11pt; color: #99ffcc; text-decoration: underline">
                        <strong><em>
                        Payment Information</em></strong></span></td>
            </tr>
            <tr>
                <td style="width: 135px">
                        <asp:Label ID="lblCardType" runat="server" Text="Card Type"></asp:Label>
                    </td>
                <td><asp:Literal ID="ltrCardType" runat="server"></asp:Literal></td> 
            </tr>
            <tr>
                <td style="width: 135px">
                        <asp:Label ID="lblCardNumber" runat="server" Text="Card Number"></asp:Label>
                    </td>
                <td><asp:Literal ID="ltrCardNumber" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">
                        <asp:Label ID="lblCardHolder" runat="server" Text="Card Holder"></asp:Label>
                    </td>
                <td><asp:Literal ID="ltrCardHolder" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">
                        <asp:Label ID="lblExpires" runat="server" Text="Expires"></asp:Label>
                    </td>
                <td><asp:Literal ID="ltrCardExpires" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">
                        <asp:Label ID="lblCVVcode" runat="server" Text="CVV code"></asp:Label>
                    </td>
                <td><asp:Literal ID="ltrCardCVV" runat="server"></asp:Literal></td>
            </tr>
        </table>
  
        <table id="BillingInformation" border="0" cellpadding="5" cellspacing="0" style="margin-top: 20px; width: 500px; border-style: solid; border-width: 1px; border-color: #99ffcc">
            <tr>
                <td colspan="2">
                    <span style="font-size: 11pt; color: #99ffcc; text-decoration: underline"><strong><em>
                        Billing Information</em></strong></span></td>
            </tr>
            <tr>
                <td style="width: 134px">Name</td>
                <td><asp:Literal ID="ltrBillName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px" valign="top">Address</td>
                <td><asp:Literal ID="ltrBillAddress" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">Phone</td>
                <td><asp:Literal ID="ltrBillPhone" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <span style="font-size: 11pt; color: #99ffcc; text-decoration: underline"><em><strong>
                        Shipping Information</strong></em></span></td>
            </tr>
            <tr>
                <td style="width: 134px">Name</td>
                <td><asp:Literal ID="ltrShipName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px" valign="top">Address</td>
                <td><asp:Literal ID="ltrShipAddress" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">Phone</td>
                <td><asp:Literal ID="ltrShipPhone" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    Shipping Method</td>
                <td>
                    <asp:Literal ID="ltrShippingMethod" runat="server"></asp:Literal>
                    <asp:Literal ID="ltrShippingFee" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px; padding-top: 10px;" valign="top">
                        Comment to TrendyRags.com</td>
                <td>
                        <asp:TextBox ID="txtComment" runat="server" BackColor="#111111" 
                                BorderStyle="Inset" BorderWidth="1px" ForeColor="White" Height="200px" 
                                Rows="10" TextMode="MultiLine" Width="345px"></asp:TextBox>
                                                                                                                                        </td>
            </tr>
        </table>
       <br />
       <br />
        This is the last step for ordering.<br />
        Please confirm your order and press the [Submit] button to complete your order.<br /><br />
        <asp:Button ID="btnBack" runat="server" Text="Back" Width="80px" />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="80px" />
    </div>
    
</asp:Content>

