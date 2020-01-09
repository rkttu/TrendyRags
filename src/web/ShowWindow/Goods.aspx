<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="Goods.aspx.vb" Inherits="ShowWindow_Goods"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <script src="../highslide/highslide.js" type="text/javascript"></script>
        <script src="../highslide/highslide-html.js" type="text/javascript"></script>
        <script src="../highslide/highslide-with-html.js" type="text/javascript"></script>
        <script src="../js/dhtmlwindow.js" type="text/javascript"></script>
        <script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
//    hs.outlineType = 'null';
    hs.outlineWhileAnimating = true;

	hs.registerOverlay(
    	{
    		thumbnailId: null,
    		overlayId: 'controlbar',
    		position: 'top right',
    		hideOnMouseOut: true
		}
	);
	
        </script>

        <div id="table_description" style="padding: 20px 0px 20px 0px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                                <td align="center" valign="top" style="width: 330px">
                                        <table cellpadding="0" cellspacing="0" width="300">
                                                <tr>
                                                        <td>
                                                                <asp:Literal ID="ltrRepImage" runat="server"></asp:Literal>
                                                        </td>
                                                </tr>
                                        </table>
                                </td>
                                <td style="background-image: url('../images/VertDots_prod.gif'); background-repeat: repeat-y;
                                        width: 10px;">
                                        &nbsp;
                                </td>
                                <td valign="top" align="left">
                                        <table border="0" style="width: 468px">
                                                <tr style="height: 330px;">
                                                        <td align="left" valign="top" style="width:auto ">
                                                                <span style="font-size: 18px; font-weight: bold; padding: 0px 0px 10px 10px; display: block; color: #FE7901;">
                                                                        <asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label></span>
                                                                <span style="padding: 5px 10px 5px 10px; font-size: 12px; display: block; font-weight: bold;  color: #669999;">
                                                                        <asp:Literal ID="ltrBriefDescription" runat="server"></asp:Literal></span>
                                                                <span style="padding: 5px 10px 15px 10px; font-size: 11px; display: block; text-align:justify;">
                                                                        <asp:Literal ID="ltrFullDescription" runat="server"></asp:Literal></span><br />
                                                                <div style="padding: 5px 5px 10px 10px; font-size: 13px; font-weight: bold; color: #669999; text-align:left; width: 100%;">
                                                                        <asp:Label ID="lblRetailPrice" runat="server" Text="Price : " ></asp:Label><asp:Literal ID="ltrRetailPrice" runat="server"></asp:Literal></div>
                                                                <div style="padding: 5px 5px 10px 10px; font-size: 13px; font-weight: bold; color: #FFCC00; text-align:left; width: 100%;">
                                                                        <asp:Label ID="lblWholesalePrice" runat="server" Text="Wholesale : " ></asp:Label><asp:Literal ID="ltrWholesalePrice" runat="server" Visible="False"></asp:Literal></div>
                                                                <span style="padding: 5px 0px 10px 10px; font-size: 11px; display: block; font-weight: bold;  color: #FF9900;">
                                                                        <asp:Table ID="Options" runat="server" Width="366px">
                                                                                <asp:TableRow>
                                                                                        <asp:TableCell>
                                                                                                <asp:DropDownList ID="ddlColor" runat="server" CausesValidation="True">
                                                                                                        <asp:ListItem Selected="True" Value="None">Select color</asp:ListItem>
                                                                                                </asp:DropDownList>&nbsp;
                                                                                                <asp:DropDownList ID="ddlSize" runat="server">
                                                                                                        <asp:ListItem Selected="True" Value="None">Select Size</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                        </asp:TableCell>
                                                                                        <asp:TableCell>
                                                                                                <a href="SizeChart.html"  onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">
                                                                                                <span style="font-size: 9px; color: #FFCC00;"><u>Size Chart</u></span></a>                                                                                        </asp:TableCell>
                                                                                </asp:TableRow>
                                                                                <asp:TableRow>
                                                                                        <asp:TableCell>
                                                                                                <asp:ImageButton ID="btnAdd2CART" runat="server" ImageUrl="~/images/btn_addcart.gif" OnClientClick="return checkDDL()" />
                                                                                        </asp:TableCell>
                                                                                        <asp:TableCell>
                                                                                                <asp:HyperLink ID="hlnkTellAFriend" runat="server">Tell a friend</asp:HyperLink>
                                                                                        </asp:TableCell>
                                                                                </asp:TableRow>
                                                                        </asp:Table>
                                                                </span>
                                                                <div style="padding: 5px 5px 20px 10px; font-size: 13px; color: #FFCC00; text-align:left; width: 100%;"><asp:Literal ID="ltrWholesaleNotice" runat="server" Visible="False"></asp:Literal></div>
                                                        </td>
                                                </tr>
                                                <tr style="height: 100px;">
                                                        <td valign="bottom">
                                                                <span style="padding: 0px 0px 0px 10px; font-size: 11px; display: block; font-weight: bold;">
                                                                        Additional Views :
                                                                         <asp:Literal ID="ltrThumbnails" runat="server"></asp:Literal>
                                                                </span>
                                                        </td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                </table>
        </div>
        <!-- 
    <asp:Literal ID="ltrDiv" runat="server"></asp:Literal>
   -->
        <div id='CopyRight' class='highslide-caption'>
                <span style="color: #1089CB">This image is created by Trendy Rags.<br />
                        All rights are reserved. </span>
        </div>
        <div id="controlbar" class="highslide-overlay controlbar">
                <a class="close" href="#" onclick="return hs.close(this)" title="Close"></a>
        </div>

        <script type="text/javascript">    

    function checkDDL()
   {
   
        var ddlColor = document.getElementById('<%=ddlColor.clientid %>')
        var ColorValue = ddlColor.options[ddlColor.selectedIndex].value

        var ddlSize = document.getElementById('<%=ddlSize.clientid %>')
        var SizeValue = ddlSize.options[ddlSize.selectedIndex].value 

        // alert(ColorValue)
        // alert(SizeValue) 

        if (ColorValue == 'None') {
            alert(' Please select a color !!')
            return false
           }  else if (SizeValue == 'None') {
            alert(' Please select a size !!')
            return false
           }  else {
        return true         
       } 
   } 
        </script>

</asp:Content>
