<%@ Page Language="VB" MasterPageFile="~/MP0.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Title="TrendyRags.com" %>
<%@ Register Assembly="FlashControl" Namespace="Bewise.Web.UI.WebControls" TagPrefix="Bewise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <!-- script src="highslide/highslide.js" type="text/javascript"></script -->
        <script src="highslide/highslide-with-html.js" type="text/javascript"></script>

        <script type="text/javascript">    

        hs.graphicsDir = 'highslide/graphics/';
        hs.outlineType = 'rounded-white';
//     hs.outlineType = 'null';
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

        <script id="Popup_Notice" type="text/javascript" language="javascript">
   
        </script>

        <table border="0" cellpadding="0" cellspacing="0" width="810">
                <tr>
                        <td style="width: 620px; vertical-align: top;">
                                <div style="width: 620px; z-index: 600;">
                                        <asp:Literal ID="ltrHome00" runat="server"></asp:Literal>
                                </div>
                        </td>
                        <td valign="top">
                                <div class="Right_banner01" style="z-index: 0;">
                                        <a href="Press/Default.aspx">
                                                <asp:Image ImageUrl="~/images/Home_01.jpg" ID="Home01" runat="server" /></a></div>
                                <div class="Right_banner02" style="z-index: 0;">
                                        <a href="Policies/Showroom.aspx">
                                                <asp:Image ImageUrl="~/images/Home_02.jpg" ID="Home02" runat="server" /></a></div>
                                <div class="Right_banner03">
                                        <a href="include-video.htm" onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">
                                                <asp:Image ImageUrl="~/images/Home_03.jpg" ID="Home03" runat="server" /></a></div>
                                <div class="Right_banner04">
                                        <a href="ShowWindow/FF_ComingSoon.aspx">
                                                <asp:Image ImageUrl="~/images/Home_04.jpg" ID="Image04" runat="server" /></a></div>
                        </td>
                </tr>
        </table>
        <div id="controlbar" class="highslide-overlay controlbar">
                <a class="close" href="#" onclick="return hs.close(this)" title="Close"></a>
        </div>

</asp:Content>
