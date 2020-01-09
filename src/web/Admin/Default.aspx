<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" title="Untitled Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1" >
    <table border="0" cellpadding="0" cellspacing="0" width="810" >
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="810" >
                    <tr>
                        <td background="../images/home_trendyreag_06.gif" style="width: 620px; vertical-align:top; text-align:right ">
                                <table border="0" style="margin-right:20px; margin-top:10px; margin-left:300px;">
                                    <tr>
                                        <td style="padding-right:7px; padding-bottom:5px; padding-left:10px; width: 71px;">Login Name</td>
                                        <td style="padding-bottom: 5px;"><asp:TextBox ID="txtLoginID" runat="server" 
                                                        BorderColor="Transparent" AutoCompleteType="Email"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 7px; padding-bottom: 5px; padding-left: 10px; width: 71px;">Password</td>
                                        <td style="padding-bottom: 5px;"><asp:TextBox ID="txtPassword" runat="server" BorderColor="Transparent" TextMode="Password"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 71px"> </td> 
                                        <td style="height: 33px; text-align: center;">
                                                    <asp:Button ID="btnLogin" runat="server" Text="Login" />
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        <td><div class="Right_banner"><asp:image imageurl="~/images/Home_01.jpg" ID="Home_01" runat="server" /></div>
                            <div class="Right_banner"><asp:image imageurl="~/images/Home_02.jpg" ID="Home_02" runat="server" /></div>
                            <div class="Right_banner03"><asp:image imageurl="~/images/Home_03.jpg" ID="Home_03" runat="server" /></div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
