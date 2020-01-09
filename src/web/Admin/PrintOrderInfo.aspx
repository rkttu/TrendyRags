<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PrintOrderInfo.aspx.vb" Inherits="Admin_PrintOrderInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Printable Page</title>
</head>
<body onload="javascript:print();">
    <form id="form1" runat="server">
        <div>

            <div style="font-family: Verdana, Arial, Sans-Serif; font-size:14px; color: #000000;">
                <table style="width: 800px; margin-bottom:20px; margin-top:50px;">
                    <tr>
                        <td style="width: 500px; text-align:left; padding-top:10px;">
                            <span style="font-size: 20px">
                            TrendyRags, Inc.</span><br /><br />
                            <span style="font-size: 12px">
                            790 E. Washington Blvd.<br />
                            Los Angeles, CA 90021<br />
                            Tel:213-471-2913<br />
                            Fax:213-403-6057<br />
                            Email:support@TrendyRags.com</span></td>
                        <td style="width: 300px; padding-top:10px; text-align: right; vertical-align:top; ">
                                <span style="font-size:32px;">Order Information</span></td>
                    </tr>
                </table>
                Order No :  <asp:Literal ID="ltrOrderNo" runat="server"></asp:Literal><br />
                <table cellpadding="0" cellspacing="0" width="800" style="font-size:11px; border-width:1px; border-style:solid; border-color:#000000; margin-top:5px;">
                    <tr>
                        <td align="left" valign="top" style="width:70px; font-weight:bold; padding:5px 0px 0px 10px;">Ship to:</td>
                        <td align="left" valign="top" style="width:330px; padding:5px 5px 5px 0px;">
                            <asp:Literal ID="ltrShipName" runat="server"></asp:Literal><br />
                            <asp:Literal ID="ltrShipAddress" runat="server"></asp:Literal><br />
                            <asp:Literal ID="ltrShipPhone" runat="server"></asp:Literal></td>
                        <td align="left" style="width: 70px; border-left-color: #000000; border-left-style: solid;
                            border-left-width: 1px; font-weight: bold; padding: 5px 0px 0px 10px;" valign="top">Bill to:</td>
                        <td align="left" style="width: 330px; padding: 5px 5px 5px 0px;" valign="top">
                            <asp:Literal ID="ltrBillName" runat="server"></asp:Literal><br />
                            <asp:Literal ID="ltrBillAddress" runat="server"></asp:Literal><br />
                            <asp:Literal ID="ltrBillPhone" runat="server"></asp:Literal></td>
                    </tr>
                </table>
            </div>
            <div style="text-align: left; margin-top: 10px; margin-bottom: 20px; font-size: 12px; font-family: Verdana, Arial, Sans-Serif;">
                <asp:Table ID="tblOrder" runat="server" BorderColor="Black" BorderStyle="Solid"
                    BorderWidth="1px" CellPadding="0" CellSpacing="0" Width="800px">
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
                    width: 500px; border-style: solid; border-width: 1px; border-color: #000000">
                    <tr>
                        <td colspan="2">
                            <span style="font-size: 11pt; color: #000000; text-decoration: underline"><strong><em>
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
                    <tr>
                        <td style="width: 134px">
                            Shipping Method</td>
                        <td>
                            <asp:Literal ID="ltrShippingMethod" runat="server"></asp:Literal>
                            <asp:Literal ID="ltrShippingFee" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                                Comment from Client</td>
                        <td>
                                <asp:Literal ID="ltrCommentFromClient" runat="server"></asp:Literal>
                                                </td>
                    </tr>
                </table>
                <br />
                <br />
               <div style="width:790px; text-align:center; font-size:14px; border-color:Gray; border-style:solid; border-width:1px; padding: 2px 10px 10px 2px; vertical-align:middle;">
                   Thank you for your business!</div> 
                </div>
        </div>
    </form>
</body>
</html>
