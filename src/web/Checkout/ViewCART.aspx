<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="ViewCART.aspx.vb" Inherits="Checkout_ViewCART" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="../highslide/highslide.js" type="text/javascript"></script>
    <script src="../highslide/highslide-html.js" type="text/javascript"></script>
    <script src="../js/dhtmlwindow.js" type="text/javascript"></script>
    <script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineWhileAnimating = false;
	hs.registerOverlay(
    	{
    		thumbnailId: null,
    		overlayId: 'controlbar',
    		position: 'top right',
    		hideOnMouseOut: true
		}
	);
    </script>

<div style="text-align: left; margin-left: 15px; margin-top: 10px; font-size: 17px;
    font-family: Verdana, Arial, Sans-Serif; font-style: italic; color: #FE7901;">Shopping CART</div>
    <div style="text-align: left; margin-left: 15px; margin-top: 10px; margin-bottom:20px; font-size: 12px; font-family: Verdana, Arial, Sans-Serif; ">
        <asp:Table ID="tblCART" runat="server" Width="780px" BorderColor="SaddleBrown" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" CellSpacing="0">
            <asp:TableRow runat="server" BorderWidth="1px" Height="24px">
                <asp:TableCell runat="server" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="320px">I t e m</asp:TableCell>
                <asp:TableCell runat="server" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="130px">Unit Price</asp:TableCell>
                <asp:TableCell runat="server" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="100px">Quantity</asp:TableCell>
                <asp:TableCell runat="server" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="130px">Sub Total</asp:TableCell>
                <asp:TableCell runat="server" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="100px">Remove</asp:TableCell>
            </asp:TableRow>
        </asp:Table> 
    </div>
   <div style="text-align:center; margin-bottom:15px; " >
       <asp:Label ID="lblCoupon" runat="server" Text="Promotion Code : " Font-Size="13px"></asp:Label>
       <asp:TextBox ID="txtCouponCode" runat="server" Width="128px"></asp:TextBox>
       <asp:Button ID="btnCoupon" runat="server" Text="Apply" /><br /><br />
    <asp:Button ID="btnUpdateQty" runat="server" Text="Update Quantity" />
    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" OnClientClick="history.back()" />
    <asp:Button ID="btnCheckOut" runat="server" Text="Check out" />
   </div> 
</asp:Content>

