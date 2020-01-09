<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Admin_Order" title="Untitled Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1">
        <div style="text-align: left; margin-left: 15px; margin-top: 10px; font-size: 17px;
        font-family: Verdana, Arial, Sans-Serif; font-style: italic; color: #FFFFFF;">
        Order No. :
        <asp:Label ID="lblOrderNo" runat="server" Text="Order No"></asp:Label>
        - (<asp:Label ID="lblOrderDate" runat="server" Text="OrderDate" Font-Size="12px"></asp:Label>)</div>
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
                        Order Information</em></strong></span></td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Order No</td>
                <td>
                    <asp:Literal ID="ltrOrderNo2" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">
                    Order Date</td>
                <td>
                    <asp:Literal ID="ltrOrderDate2" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">Pay Method</td>
                <td><asp:Literal ID="ltrPayMethod" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 135px">Pay Status</td>
                <td><asp:Literal ID="ltrPayStatus" runat="server"></asp:Literal></td>
            </tr>
        </table>
        <table id="BillingInformation" border="0" cellpadding="5" cellspacing="0" style="margin-top: 20px;
            width: 500px; border-style: solid; border-width: 1px; border-color: #99ffcc">
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
                <td style="width: 134px">Email</td>
                <td><asp:Literal ID="ltrBillEmail" runat="server"></asp:Literal></td>
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
                <td style="width: 134px">Shipping Method</td>
                <td><asp:Literal ID="ltrShippingMethod" runat="server"></asp:Literal><asp:Literal ID="ltrShippingFee" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 134px">Comment from Client</td>
                <td><div style="width:366px">
                                <asp:Literal ID="ltrCommentFromClient" runat="server"></asp:Literal>
                        </div>
                </td>
            </tr>
            <tr>
                <td style="width: 134px">Print Order Information</td>
                <td>
                        <asp:Button ID="btnPrintOrderInfo" runat="server"  
                                OnClientClick="PrintOrderInformation()"  Text="Print Order Information" 
                                Width="200px" Enabled="False" />
                </td>
            </tr>
        </table>
        <br />
        <table id="OrderProcessing" border="0" cellpadding="5" cellspacing="0" style="margin-top: 20px;
            width: 500px; border-style: solid; border-width: 1px; border-color: #99ffcc">
            <tr>
                <td style="width: 100px">
                    Status</td>
                <td style="width: 300px">
                    <asp:RadioButtonList ID="rdoOrderStatus" runat="server" DataSourceID="sqlDS_TrendyRags"
                        DataTextField="StatusName" DataValueField="StatusCode">
                    </asp:RadioButtonList>
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Print Invoice</td>
                <td style="width: 300px">
                    <asp:CheckBox ID="chkChangeOrderStatus" runat="server" Text='Change Order status to "Packaging"?' /><br />
                    <asp:CheckBox ID="chkSendMail" runat="server" Text="Send mail to client?" /></td>
                <td style="width: 100px; text-align: center;">
                    <asp:Button ID="btnPrint" runat="server" OnClientClick="openPrintableWindow()" Text="Print&amp;Email"
                        Width="80px" /></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Tracking No</td>
                <td style="width: 300px">
                    <asp:TextBox ID="txtTrackingNo" runat="server" Width="188px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Comment to Client</td>
                <td style="width: 300px">
                    <asp:TextBox ID="txtCommentToClient" runat="server" Rows="7" TextMode="MultiLine" Width="290px"></asp:TextBox></td>
                <td style="width: 100px">
                    <span style="font-size: 10px; color: #cc0000">Will be printed in the Invoice</span></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 300px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 300px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 300px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 300px; text-align: center;">
                    <asp:Button ID="btnUpdate" runat="server" Text=" Update " />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text=" Cancel " /></td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="sqlDS_TrendyRags" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
            SelectCommand="SELECT [StatusCode], [StatusName] FROM [CodeOrderStatus] ORDER BY [StatusCode]">
        </asp:SqlDataSource>
        <asp:HiddenField ID="hdnOriginalOrderStatusCode" runat="server" />
        <br />
    </div>
   <script language="javascript" type="text/javascript">
   function openPrintableWindow() {
   
       var strOrderNo = document.getElementById('<%=lblOrderNo.clientid %>').innerText ;
        if (typeof(strOrderNo) == "undefined"){
                strOrderNo=document.getElementById('<%=lblOrderNo.clientid %>').textContent ;
        }
       var printURL = 'PrintableOrder.aspx?ON=' + strOrderNo;
       window.open(printURL, 'Invoice', 'toolbar=no, location=no, status=no,menubar=no, scrollbars=yes, height=800, width=820'); 
       
   }

   function PrintOrderInformation() {
   
       var strOrderNo = document.getElementById('<%=lblOrderNo.clientid %>').innerText ;
        if (typeof(strOrderNo) == "undefined"){
                strOrderNo=document.getElementById('<%=lblOrderNo.clientid %>').textContent ;
        }
       var printURL = 'PrintOrderInfo.aspx?ON=' + strOrderNo;
       alert(strOrderNo);
       window.open(printURL, 'Invoice', 'toolbar=no, location=no, status=no,menubar=no, scrollbars=yes, height=800, width=820'); 
       
   }

   </script> 
</asp:Content>
