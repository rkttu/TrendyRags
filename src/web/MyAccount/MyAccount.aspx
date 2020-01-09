<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="MyAccount.aspx.vb" Inherits="MyAccount_MyAccount" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left: 25px; margin-top: 20px; text-align: left;">
       <div style="margin-bottom: 15px; margin-left:50px; font-size: 20px;">Update My Information</div>
        <div style="margin-bottom: 10px; font-size: 12px;">
            <table border="0" cellpadding="5" cellspacing="" style="margin-bottom:15px;">
                <tr>
                    <td style="text-align: right">Login ID.(Email)</td>
                    <td><asp:Literal ID="ltrLoginID" runat="server"></asp:Literal></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="lblNewPassword1" runat="server" Text="New Password" Visible="False"></asp:Label></td>
                    <td><asp:TextBox ID="txtNewPassword" runat="server" Width="200px" TextMode="Password" Visible="False"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="lblLongPassword" runat="server" Text="(6 ~ 30 characters)" Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="lblNewPassword2" runat="server" Text="Confirm New Password" Visible="False"></asp:Label></td>
                    <td><asp:TextBox ID="txtNewPassword2" runat="server" Width="200px" TextMode="Password" Visible="False"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <span style="color: red">(*)</span> &nbsp;Current Password</td>
                    <td><asp:TextBox ID="txtCurrentPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox></td>
                    <td>&nbsp;(6 ~ 30 characters)</td>
                </tr>
                <tr style="height:20px;">
                    <td>&nbsp;</td>
                    <td><asp:Button ID="btnChangePassword" runat="server" Font-Bold="True" Font-Names="verdana"
                            Font-Size="10px" ForeColor="Red" Height="20px" Text="Change Password" Width="148px" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">First Name</td>
                    <td><asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox></td>
                    <td>      </td>
                </tr>
                <tr>
                    <td style="text-align: right">Last Name</td>
                    <td><asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox></td>
                    <td>       </td>
                </tr>
                <tr>
                    <td style="text-align: right">Phone</td>
                    <td><asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox></td>
                    <td>          </td>
                </tr>
                <tr>
                    <td style="text-align: right">Street1</td>
                    <td><asp:TextBox ID="txtStreet1" runat="server" Width="200px"></asp:TextBox></td>
                    <td>        </td>
                </tr>
                <tr>
                    <td style="text-align: right">Street2</td>
                    <td><asp:TextBox ID="txtStreet2" runat="server" Width="200px"></asp:TextBox></td>
                    <td>         </td>
                </tr>
                <tr>
                    <td style="text-align: right">City</td>
                    <td><asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox></td>
                    <td>           </td>
                </tr>
                <tr>
                    <td style="text-align: right">State</td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" DataSourceID="sqlDSStates" DataTextField="StatesName"
                            DataValueField="Abbr" Width="205px">
                        </asp:DropDownList><asp:SqlDataSource ID="sqlDSStates" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
                            SelectCommand="SELECT [Abbr], [StatesName] FROM [CodeStates] ORDER BY [StatesName]">
                        </asp:SqlDataSource>
                    </td>
                    <td>          </td>
                </tr>
                <tr>
                    <td style="text-align: right">Zip</td>
                    <td><asp:TextBox ID="txtZip" runat="server" Width="200px"></asp:TextBox></td>
                    <td>         </td>
                </tr>
                <tr>
                    <td style="text-align: right">Country</td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="sqlDSCountry" DataTextField="CountryName"
                            DataValueField="CCode3" Width="205px">
                        </asp:DropDownList><asp:SqlDataSource ID="sqlDSCountry" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
                            SelectCommand="SELECT [CountryName], [CCode3] FROM [CodeCountry] ORDER BY [CountryName]">
                        </asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>
            </table>
           <div style="margin-left:120px;"> 
            <asp:Button ID="btnUpdate" runat="server" Text="Update" ToolTip="Update your information"  Width="100px" OnClientClick="return chkValid()" />
            &nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" />
           </div> 
        </div>
    </div>

    <script language="javascript" type="text/javascript">

    function chkValid()
   {
        var txtPassword = document.getElementById('<%=txtCurrentPassword.clientid %>').value

        if (txtPassword == '') {
                alert(' Please enter your Password !!')
                document.getElementById('<%=txtCurrentPassword.clientid %>').focus()
                return false
        }
        
        var txtPassword1 = document.getElementById('<%=txtNewPassword.clientid %>').value
        var txtPassword2 = document.getElementById('<%=txtNewPassword2.clientid %>').value

        if (txtPassword1 != txtPassword2) {
                alert(' Your new password and confirmation new password are not match !!\nPlease check your passwords again..')
                document.getElementById('<%=txtNewPassword.clientid %>').focus()
                return false
        } 
   } 
    </script>

</asp:Content>

