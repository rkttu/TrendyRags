<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="Signup_EU.aspx.vb" Inherits="Login_Signup_EU" title="Signup for End-user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="border-style:solid; border-width:1px; border-color:#666666; padding-top:20px; ">
    <table style="width: 750px; margin-top:5px; margin-bottom:25px;" cellpadding="5">
        <tr>
            <td style="width: 200px; padding-right: 10px; text-align: right; vertical-align:bottom;">
                <strong><em><span style="color: red">(*) Required fields</span></em></strong></td>
            <td style="width: 475px; text-align:left; padding-left:15px; height:30px;"><span style="font-size: 11pt; font-family: Verdana"><em><strong>Thank you for creating
                your account!!</strong></em></span>
            </td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right:10px;">
                <asp:Label ID="lblEmail" runat="server" Text="(*) User ID. (Your e-mail)"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="padding-right: 10px; width: 200px; text-align: right">
                <asp:Label ID="lblEmailConfirm" runat="server" Text="(*) Confirm e-mail"></asp:Label></td>
            <td style="width: 475px; text-align: left">
                <asp:TextBox ID="txtEmailConfirm" runat="server" Width="200px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblPassword" runat="server" Text="(*) Password"></asp:Label></td>
            <td style="width: 475px; text-align: left; vertical-align: middle;" valign="middle">
                <asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                <span style="font-size: 9pt; color: red"><em><strong>
                (6~30 characters)</strong></em></span></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblPasswordConfirm" runat="server" Text="(*) ConfirmPassword"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtPasswordConfirm" runat="server" Width="200px" 
                            TextMode="Password"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtNameFirst" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtNameLast" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtPhone" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">Country</td>
            <td style="width: 475px; text-align: left;">
                <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="sqlDSCountry" DataTextField="CountryName"
                    DataValueField="CCode3" Width="270px">
                </asp:DropDownList>
                </td>
            <td style="width: 150px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblStreet1" runat="server" Text="Street1"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtStreet1" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblStreet2" runat="server" Text="Street2"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtStreet2" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtCity" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblState" runat="server" Text="State"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:DropDownList ID="ddlState" runat="server" DataSourceID="sqlDSStates" DataTextField="StatesName"
                    DataValueField="Abbr" Width="270px">
                </asp:DropDownList>
            </td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label></td>
            <td style="width: 475px; text-align: left;">
                <asp:TextBox ID="txtZip" runat="server" Width="270px"></asp:TextBox></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 10px;">
                </td>
            <td style="width: 475px; text-align: left;">
                    &nbsp;</td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="padding-right: 10px; width: 200px; text-align: right">
                <asp:Label ID="lblPrivacyAgreement" runat="server" Text="(*) Privacy agreement"></asp:Label></td>
            <td style="width: 475px; text-align: left">
                <asp:CheckBox ID="chkAgreewithPolicy" runat="server" Text=" " />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Policies/PrivacyAndSecurity.aspx"
                    Target="_blank" Font-Bold="True" Font-Italic="True" ForeColor="Yellow">Our Privacy Policy</asp:HyperLink></td>
            <td style="width: 150px"></td>
        </tr>
        <tr>
            <td style="width: 200px">
            </td>
            <td style="width: 475px; text-align: left;">
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClientClick="return chkValid()" />
                &nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" /></td>
            <td style="width: 150px"></td>
        </tr>
    </table>
    
        <asp:SqlDataSource ID="sqlDSStates" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
                SelectCommand="SELECT [Abbr], [StatesName] FROM [CodeStates] ORDER BY [Abbr]">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sqlDSCountry" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
            SelectCommand="SELECT [CountryName], [CCode3] FROM [CodeCountry] ORDER BY [CountryName]">
        </asp:SqlDataSource>
    
</div> 

<script language="javascript" type="text/javascript">

        function postSelectCountry()
        {
                var ddlCountry = document.getElementById('<%=ddlCountry.clientid %>')
                var valCountry = ddlCountry.options[ddlCountry.selectedIndex].value
                
                var lblStreet1 = document.getElementById('<%=lblStreet1.clientid%>')
                var lblStreet2 = document.getElementById('<%=lblStreet2.clientid%>')
                var lblCity = document.getElementById('<%=lblCity.clientid%>')
                var lblState = document.getElementById('<%=lblState.clientid%>')
                var ddlState = document.getElementById('<%=ddlState.clientid%>')
                
                if (valCountry != 'USA' && valCountry != 'CAN' ) {
                        ddlState.options[ddlState.selectedIndex].value = '  '
                        lblStreet1.innerHTML = "Address1"
                        lblStreet2.innerHTML = "Address2"
                        lblCity.innerHTML = "Address3"
                        lblState.style.display = 'none'
                        ddlState.style.display = 'none'
                        
                } else {
                        ddlState.options[ddlState.selectedIndex].value = 'CA'
                        lblStreet1.innerHTML = "Street1"
                        lblStreet2.innerHTML = "Street2"
                        lblCity.innerHTML = "City"
                        lblState.style.display = 'block'
                        ddlState.style.display = 'block'

                }
        
        
        }

    function chkValid()
   {
        var txtEmail1 = document.getElementById('<%=txtEmail.clientid %>').value
        var txtEmail2 = document.getElementById('<%=txtEmailConfirm.clientid %>').value
        var txtPassword1 = document.getElementById('<%=txtPassword.clientid %>').value
        var txtPassword2 = document.getElementById('<%=txtPasswordConfirm.clientid %>').value

            document.getElementById('<%=lblEmail.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblPassword.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblEmailConfirm.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblPasswordConfirm.clientid %>').style.color = '#ffffff'
        // alert(txtFirstName)
        // alert(SizeValue) 

         var filter=/^.+@.+\..{2,3}$/

         if (!filter.test(txtEmail1)) {
            document.getElementById('<%=lblEmail.clientid %>').style.color = '#ff0000'
            alert("Please input a valid email address!")
            document.getElementById('<%=lblEmail.clientid %>').focus()
            return false
            } else if (txtEmail1 != txtEmail2) {
            alert(' Your email and confirmation email are not match !!\nPlease check your email again..')
            document.getElementById('<%=lblEmail.clientid %>').style.color = '#ff0000'
            document.getElementById('<%=lblEmail.clientid %>').focus()
            return false
            } else if (txtPassword1.length < 6) {
            alert(' Please enter your password longer than 6 characters..')
            document.getElementById('<%=lblPassword.clientid %>').style.color = '#ff0000'
            return false
            } else if (txtPassword1 != txtPassword2) {
            alert(' Your password and confirmation password are not match !!\nPlease check your password again..')
            document.getElementById('<%=lblPassword.clientid %>').style.color = '#ff0000'
            return false
           }  else {
            return true         
       } 
  
   } 
</script>

</asp:Content>

