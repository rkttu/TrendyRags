<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" Debug="true"
        CodeFile="Shop.aspx.vb" Inherits="Admin_Shop" Title="TrendyRags.com" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div style="text-align: left; font-size: 14px; font-family: Verdana; padding: 10px 10px 10px 10px">
                Retail shop list Manager</div>
        <div style="text-align: left; padding-left: 10px; font-size: 12px">
                <table cellpadding="5" style="width: 700px; border-width: 0px;">
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        DisplayOrder
                                </td>
                                <td>
                                        <asp:TextBox ID="txtDisplayOrder" Width="150px" runat="server" BorderWidth="0"></asp:TextBox>&nbsp;
                                        </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Class
                                </td>
                                <td>
                                        <asp:TextBox ID="txtClass" Width="250px" runat="server" BorderWidth="0"></asp:TextBox>
                                &nbsp;
                                        <asp:DropDownList ID="ddlClass" runat="server" Width="250px" 
                                                AutoPostBack="True">
                                        </asp:DropDownList>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Company Name
                                </td>
                                <td>
                                        <asp:TextBox ID="txtCompanyName" runat="server" Width="500px" BorderWidth="0" 
                                                Rows="3" TextMode="MultiLine"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Street</td>
                                <td valign="middle">
                                        <asp:TextBox ID="txtAddressLine1" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                &nbsp;
                                        </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Suite No.
                                </td>
                                <td>
                                        <asp:TextBox ID="txtSuiteNo" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        City, State Zip</td>
                                <td>
                                        <asp:TextBox ID="txtAddressLine2" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                &nbsp;
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Phone
                                </td>
                                <td>
                                        <asp:TextBox ID="txtPhone" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Fax.
                                </td>
                                <td>
                                        <asp:TextBox ID="txtFax" runat="server" BorderWidth="0px" Width="300px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Email
                                </td>
                                <td>
                                        <asp:TextBox ID="txtEmail" runat="server" BorderWidth="0px" Width="300px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">
                                        Website</td>
                                <td>
                                        <asp:TextBox ID="txtWebsite" runat="server" BorderWidth="0px" Width="500px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px; height: 49px;">
                                </td>
                                <td valign="bottom" style="height: 49px">
                                        <asp:Button ID="btnOK" runat="server" Text=" OK " Width="100px" />&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text=" Cancel " Width="100px" OnClientClick="return confirm('  Are you sure you want to cancel?  ')" />
                                        &nbsp;
                                        <asp:Button ID="btnRemove" runat="server" OnClientClick="return confirm('  Are you sure you want to remove this client ??  ')"
                                                Text="  Remove  " />
                                </td>
                        </tr>
                </table>
                
        </div>
</asp:Content>
