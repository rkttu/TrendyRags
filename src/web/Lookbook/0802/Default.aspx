<%@ Page Language="VB" MasterPageFile="~/Includes/Sub2/MP2.master" AutoEventWireup="false"
        CodeFile="Default.aspx.vb" Inherits="Lookbook_0802_Default" Title="TrendyRags.com - Lookbook Feb. 08" %>
<%@ Register Assembly="FlashControl" Namespace="Bewise.Web.UI.WebControls" TagPrefix="Bewise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div style="text-align:center; margin-top: 5px; margin-bottom: 0px; padding-left: 0px; width: 790px; ">
                <Bewise:FlashControl ID="FlashControl1" runat="server" Height="530px" Loop="True"
                        MovieUrl="~/Lookbook/0802/slideshow.swf" Width="790px" />
        </div>
</asp:Content>
