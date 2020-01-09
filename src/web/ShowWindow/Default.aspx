<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="ShowWindow_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="../highslide/highslide.js" type="text/javascript"></script>
    <script src="../highslide/highslide-html.js" type="text/javascript"></script>
    <script src="../js/dhtmlwindow.js" type="text/javascript"></script>
    <script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
//    hs.outlineType = 'rounded-white';
//    hs.outlineType = 'null';
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

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="width: 200px; height: 50px; text-align: left; padding-left: 15px;">
                <asp:Label ID="lblClassName" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="13px"
                    ForeColor="#E0E0E0" Text="Class Name"></asp:Label></td>
            <td align="right" style="padding-right: 10px; width: 400px;">
                <asp:Literal ID="ltrListPage" runat="server">1 2 3 4 5</asp:Literal></td>
            <td align="left">
                <asp:Literal ID="ltrTotalItems" runat="server"></asp:Literal>
                <br />
                <asp:LinkButton ID="lbtnViewAll" runat="server">View All</asp:LinkButton>
            </td>
        </tr>
    </table>
    <div style="text-align: left;">
        <asp:Literal ID="ltrList" runat="server"></asp:Literal>
        <!-- 
                    테이블을 2열 8칸으로 배열한다.
                    대표사진을 넓이100으로하고 그 밑에 상품번호, 상품명, 간략설명, 가격을 기록한다. 
                    class="highslide" onclick="return hs.expand(this, {captionId: 'caption1'})"                
               -->
    </div>
    <asp:Literal ID="ltrDiv" runat="server"></asp:Literal>
    <div id='CopyRight' class='highslide-caption'>
        <span style="color: #1089CB">This image is created by Trendy Rags.<br />
            All rights are reserved. </span>
    </div>
    <div id="controlbar" class="highslide-overlay controlbar">
        <a class="close" href="#" onclick="return hs.close(this)" title="Close"></a>
    </div>
</asp:Content>
