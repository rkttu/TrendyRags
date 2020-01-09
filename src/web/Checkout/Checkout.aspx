<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout_Checkout" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="../highslide/highslide.js" type="text/javascript"></script>
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

    <div style="text-align: left; margin-left: 15px; margin-top: 10px; font-size: 17px; font-family: Verdana, Arial, Sans-Serif; font-style: italic; color: #FFFFFF;">
        <a href="ViewCART.aspx" style="font-size:17px;"><u>CART</u></a> - <span style="color: #FE7901;">[ Billing/Shipping Address]</span> - Review/Submit - Complete</div>
    <div style="text-align: left; margin-left: 15px; margin-top: 20px; font-size: 13px; font-family: Verdana, Arial, Sans-Serif;  color: #FFFFFF;">
        <table border="0" cellpadding="3" cellspacing="0" width="800"  style="padding-bottom:10px;">
            <tr>
                <td style="text-align: right"></td>
                <td style="width: 313px"></td>
                <td style="text-align: right"></td>
                <td></td>
            </tr>

            <tr style="padding-bottom: 20px;">
                <td colspan="2" style="padding-left:60px;">
                    <span style="font-size: 15px">Billing Information<br /></span>
                    <span style="font-size: 10px"><em>(must match your credit card statement)</em></span></td>
                <td colspan="2" style="padding-left:90px;">
                    <span style="font-size: 15px">Shipping Information<br /></span>
                    <span style="font-size: 10px"><em>
                        <asp:CheckBox ID="chkSame" runat="server" Checked="true"  
                                Text="Uncheck if it is different with billing address" TabIndex="9" /></em></span></td>
            </tr>
            <tr>
                <td style="height: 24px; width:150px; text-align: right;"><asp:Label ID="lblNameBilling" runat="server" Text="(*)Name"></asp:Label></td>
                <td style="height: 24px; width: 313px;"><asp:TextBox ID="txtNameBilling" runat="server" Width="190px" TabIndex="1"></asp:TextBox></td>
                <td style="height: 24px; width: 150px; text-align: right;"><asp:Label ID="lblNameShipping" runat="server" Text="(*)Name"></asp:Label></td>
                <td style="height: 24px; width: 250px;"><asp:TextBox ID="txtNameShipping" 
                                runat="server" Width="190px" TabIndex="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblAddress1Billing" runat="server" Text="(*)Address 1"></asp:Label></td>
                <td style="width: 313px"><asp:TextBox ID="txtAddress1Billing" runat="server" 
                                Width="190px" TabIndex="2"></asp:TextBox></td>
                <td style="text-align: right"><asp:Label ID="lblAddress1Shipping" runat="server" Text="(*)Address 1"></asp:Label></td>
                <td><asp:TextBox ID="txtAddress1Shipping" runat="server" Width="190px" TabIndex="11"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="Label1" runat="server" Text="Address 2"></asp:Label></td>
                <td style="width: 313px"><asp:TextBox ID="txtAddress2Billing" runat="server"  
                                Width="190px" TabIndex="3"></asp:TextBox></td>
                <td style="text-align: right">Address 2</td>
                <td><asp:TextBox ID="txtAddress2Shipping" runat="server" Width="190px" TabIndex="12"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: right; height: 34px;"><asp:Label ID="lblCityBilling" runat="server" Text="(*)City"></asp:Label></td>
                <td style="width: 313px; font-family: Verdana; height: 34px;">
                        <asp:TextBox ID="txtCityBilling" runat="server" Width="190px" TabIndex="4"></asp:TextBox></td>
                <td style="text-align: right; height: 34px;"><asp:Label ID="lblCityShipping" runat="server" Text="(*)City"></asp:Label></td>
                <td style="height: 34px"><asp:TextBox ID="txtCityShipping" runat="server" Width="190px" 
                                TabIndex="13"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="Label2" runat="server" Text="State"></asp:Label></td>
                <td style="width: 313px">
                    <asp:DropDownList ID="ddlStateBilling" runat="server" DataSourceID="sqlDSStates" 
                                DataTextField="StatesName" DataValueField="Abbr" Width="190px" 
                                TabIndex="5">
                    </asp:DropDownList>
                    </td>
                <td style="text-align: right">State</td>
                <td>
                    <asp:DropDownList ID="ddlStateShipping" runat="server" DataSourceID="sqlDSStates" 
                                DataTextField="StatesName" DataValueField="Abbr" Width="190px" 
                                TabIndex="14">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblZipBilling" runat="server" Text="(*)Zip"></asp:Label></td>
                <td style="width: 313px"><asp:TextBox ID="txtZipBilling" runat="server" Width="190px" 
                                TabIndex="6"></asp:TextBox></td>
                <td style="text-align: right"><asp:Label ID="lblZipShipping" runat="server" Text="(*)Zip"></asp:Label></td>
                <td><asp:TextBox ID="txtZipShipping" runat="server" Width="190px" TabIndex="15"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="Label3" runat="server" Text="Country"></asp:Label></td>
                <td style="width: 313px">
                    <asp:DropDownList ID="ddlCountryBilling" runat="server" DataSourceID="sqlDSCountry" 
                                DataTextField="CountryName" DataValueField="CCode3" Width="190px" 
                                TabIndex="7">
                    </asp:DropDownList>
                    </td>
                <td style="text-align: right">Country</td>
                <td>
                    <asp:DropDownList ID="ddlCountryShipping" runat="server" 
                                DataSourceID="sqlDSCountry" DataTextField="CountryName"  
                                DataValueField="CCode3" Width="190px" TabIndex="16">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblPhoneBilling" runat="server" Text="(*)Telephone"></asp:Label></td>
                <td style="width: 313px"><asp:TextBox ID="txtPhoneBilling" runat="server" Width="190px" 
                                TabIndex="8"></asp:TextBox></td>
                <td style="text-align: right"><asp:Label ID="lblPhoneShipping" runat="server" Text="(*)Telephone"></asp:Label></td>
                <td><asp:TextBox ID="txtPhoneShipping" runat="server" Width="190px" TabIndex="17"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left:60px; height: 40px;" colspan="2"><span  style="font-size: 15px">Payment Information</span></td>
                <td style="text-align: right; height: 40px;"></td>
                <td style="height: 40px"></td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method"></asp:Label></td>
                <td style="width: 313px">
                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" Width="190px" 
                                TabIndex="18">
                                <asp:ListItem Value="Credit Card" Selected="True">Credit Card</asp:ListItem>
                                <asp:ListItem Value="COD">COD</asp:ListItem>
                                <asp:ListItem Value="Net 30">Net 30</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                <td style="text-align: right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblCardType" runat="server" Text="(*)Card Type"></asp:Label></td>
                <td style="width: 313px">
                    <asp:DropDownList ID="ddlCardType" runat="server" Width="190px" TabIndex="19">
                        <asp:ListItem Selected="True">VISA</asp:ListItem>
                        <asp:ListItem>MASTER</asp:ListItem>
                        <asp:ListItem>AMEX</asp:ListItem>
                        <asp:ListItem>PayPal</asp:ListItem>
                    </asp:DropDownList>
                        &nbsp;<a class="highslide" href="../images/YourSecurity.jpg" 
                                onclick="return hs.expand(this);"><span style="font-size: 9px; color: red"><strong>Your security</strong></span></a></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblCardNumber" runat="server" Text="(*)Card Number"></asp:Label></td>
                <td style="width: 313px"><asp:TextBox ID="txtCardNumber" runat="server" Width="190px" 
                                TabIndex="20"></asp:TextBox></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblExpires" runat="server" Text="(*)Expires"></asp:Label></td>
                <td style="width: 313px">
                        <asp:TextBox ID="txtExpiresMonth" runat="server" Width="50px" TabIndex="21"></asp:TextBox>&nbsp;(mm)&nbsp; 
                        <asp:TextBox ID="txtExpiresYear" runat="server" Width="50px" TabIndex="22"></asp:TextBox>&nbsp;(yyyy)</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right"><asp:Label ID="lblCVV" runat="server" Text="(*)CVV or CID"></asp:Label></td>
                <td style="width: 313px"><asp:TextBox ID="txtCVV" runat="server" Width="190px" 
                                TabIndex="23"></asp:TextBox>&nbsp;
                        <a class="highslide" href="../images/SecurityCode.png" onclick="return hs.expand(this);"><span 
                                style="font-size: 9px; color: #ff0000;"><strong>What&#39;s this?</strong></span></a></td>
                <td style="text-align: right"><asp:Label ID="Label4" runat="server" Text="Shipping Method"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlShippingMethod" runat="server" Width="195px" TabIndex="24">
                        <asp:ListItem Selected="True" Value="UPS Ground">UPS Ground</asp:ListItem>
                        <asp:ListItem Value="UPS 2 Days">UPS 2 Days</asp:ListItem>
                        <asp:ListItem Value="UPS Next Day">UPS Next Day</asp:ListItem>
                    </asp:DropDownList>&nbsp;<a 
                                class="highslide" href="../images/Shipping01.JPG" 
                                onclick="return hs.expand(this);"><strong><span 
                                style="color: red; font-size: 9px;">Table</span></strong></a></td>
            </tr>
            <tr>
                <td style="text-align: right"></td>
                <td style="width: 313px"></td>
                <td style="text-align: right"></td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="padding-bottom:20px; width: 313px; padding-top: 20px;">
                        <asp:Button ID="btnNextStep" 
                                runat="server" Font-Bold="True" 
                                Text="Next to [Review]"  Width="200px" TabIndex="25" 
                                onclientclick="return chkValid()" /></td>
                <td></td>
                <td><asp:TextBox ID="txtGoAhead" runat="server" Visible="False" Width="50px" TabIndex="500">STOP</asp:TextBox></td>
            </tr>
        </table> 
    </div>
    <asp:SqlDataSource ID="sqlDSStates" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
        SelectCommand="SELECT [Abbr], [StatesName] FROM [CodeStates] ORDER BY [Abbr]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSCountry" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
        SelectCommand="SELECT [CountryName], [CCode3] FROM [CodeCountry] ORDER BY [CountryName]">
    </asp:SqlDataSource>

    <script language="javascript" type="text/javascript">
   
   function ChkboxPressed() 
   {
        var chkSame = document.getElementById('<%=chkSame.clientid %>')
        if (chkSame.checked) 
        {
            document.getElementById('<%=txtNameShipping.clientid %>').value = document.getElementById('<%=txtNameBilling.clientid %>').value
            document.getElementById('<%=txtAddress1Shipping.clientid %>').value = document.getElementById('<%=txtAddress1Billing.clientid %>').value
            document.getElementById('<%=txtAddress2Shipping.clientid %>').value = document.getElementById('<%=txtAddress2Billing.clientid %>').value
            document.getElementById('<%=txtCityShipping.clientid %>').value = document.getElementById('<%=txtCityBilling.clientid %>').value
            document.getElementById('<%=ddlStateShipping.clientid %>').value = document.getElementById('<%=ddlStateBilling.clientid %>').value
            document.getElementById('<%=txtZipShipping.clientid %>').value = document.getElementById('<%=txtZipBilling.clientid %>').value
            document.getElementById('<%=ddlCountryShipping.clientid %>').value = document.getElementById('<%=ddlCountryBilling.clientid %>').value
            document.getElementById('<%=txtPhoneShipping.clientid %>').value = document.getElementById('<%=txtPhoneBilling.clientid %>').value
         } else {
            document.getElementById('<%=txtNameShipping.clientid %>').value = ''
            document.getElementById('<%=txtAddress1Shipping.clientid %>').value = ''
            document.getElementById('<%=txtAddress2Shipping.clientid %>').value = ''
            document.getElementById('<%=txtCityShipping.clientid %>').value = ''
            document.getElementById('<%=ddlStateShipping.clientid %>').value = ''
            document.getElementById('<%=txtZipShipping.clientid %>').value = ''
            document.getElementById('<%=ddlCountryShipping.clientid %>').value = ''
            document.getElementById('<%=txtPhoneShipping.clientid %>').value = ''
           } 
   }
   

    function chkValid()
   {

        var ddlPaymentMethod = document.getElementById('<%=ddlPaymentMethod.clientid %>')
        var strPaymentMethod = ddlPaymentMethod.options[ddlPaymentMethod.selectedIndex].value

        var txtCardNumber = document.getElementById('<%=txtCardNumber.clientid %>').value
        var txtExpiresMonth = document.getElementById('<%=txtExpiresMonth.clientid %>').value
        var txtExpiresYear = document.getElementById('<%=txtExpiresYear.clientid %>').value
        var txtCVV = document.getElementById('<%=txtCVV.clientid %>').value

        var txtNameBilling = document.getElementById('<%=txtNameBilling.clientid %>').value
        var txtAddress1Billing = document.getElementById('<%=txtAddress1Billing.clientid %>').value
        var txtCityBilling = document.getElementById('<%=txtCityBilling.clientid %>').value
        var txtZipBilling = document.getElementById('<%=txtZipBilling.clientid %>').value
        var txtPhoneBilling = document.getElementById('<%=txtPhoneBilling.clientid %>').value

        var txtNameShipping = document.getElementById('<%=txtNameShipping.clientid %>').value
        var txtAddress1Shipping = document.getElementById('<%=txtAddress1Shipping.clientid %>').value
        var txtCityShipping = document.getElementById('<%=txtCityShipping.clientid %>').value
        var txtZipShipping = document.getElementById('<%=txtZipShipping.clientid %>').value
        var txtPhoneShipping = document.getElementById('<%=txtPhoneShipping.clientid %>').value

            document.getElementById('<%=lblCardNumber.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblExpires.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblCVV.clientid %>').style.color = '#ffffff'

            document.getElementById('<%=lblNameBilling.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblAddress1Billing.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblCityBilling.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblZipBilling.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblNameShipping.clientid %>').style.color = '#ffffff'

            document.getElementById('<%=lblAddress1Shipping.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblCityShipping.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblZipShipping.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblPhoneBilling.clientid %>').style.color = '#ffffff'
            document.getElementById('<%=lblPhoneShipping.clientid %>').style.color = '#ffffff'

        // alert(txtFirstName)
        // alert(SizeValue) 
        // var filter=/^.+@.+\..{2,3}$/

         if ((strPaymentMethod == 'Credit Card') && (txtCardNumber.length < 15)) {
            document.getElementById('<%=lblCardNumber.clientid %>').style.color = '#ff0000'
            alert(' Please input a valid Card No.! ')
            txtCardNumber.focus()
            return false
            } else if ((strPaymentMethod == 'Credit Card') && (txtExpiresMonth.length < 1)) {
            document.getElementById('<%=lblExpires.clientid %>').style.color = '#ff0000'
            alert(' Please enter the month. ')
            txtExpiresMonth.focus()
            return false
            } else if ((strPaymentMethod == 'Credit Card') && (txtExpiresYear.length < 1)) {
            document.getElementById('<%=lblExpires.clientid %>').style.color = '#ff0000'
            alert(' Please enter the Year. ')
            txtExpiresYear.focus()
            return false
            } else if ((strPaymentMethod == 'Credit Card') && (txtCVV.length < 0)) {
            document.getElementById('<%=lblCVV.clientid %>').style.color = '#ff0000'
            alert(' Please enter the security code of your Credit Card.')
            txtCVV.focus()
            return false
            } else if (txtNameBilling.length < 1) {
            document.getElementById('<%=lblNameBilling.clientid %>').style.color = '#ff0000'
            alert(' Please enter your name for billing. ')
            txtNameBilling.focus()
            return false
            } else if (txtAddress1Billing.length < 1) {
            document.getElementById('<%=lblAddress1Billing.clientid %>').style.color = '#ff0000'
            alert(' Please enter your address. ')
            txtAddressBilling.focus()
            return false
            } else if (txtCityBilling.length < 1) {
            document.getElementById('<%=lblCityBilling.clientid %>').style.color = '#ff0000'
            alert(' Please enter the city of billing address. ')
            txtCityBilling.focus()
            return false
            } else if (txtZipBilling.length < 1) {
            document.getElementById('<%=lblZipBilling.clientid %>').style.color = '#ff0000'
            alert(' Please enter the Zip number of billing address. ')
            txtZipBilling.focus()
            return false
            } else if (txtPhoneBilling.length < 1) {
            document.getElementById('<%=lblPhoneBilling.clientid %>').style.color = '#ff0000'
            alert(' Please enter the phone no. of billing address. ')
            txtPhoneBilling.focus()
            return false
            } else if (txtNameShipping.length < 1) {
            document.getElementById('<%=lblNameShipping.clientid %>').style.color = '#ff0000'
            alert(' Please enter the name for shipping. ')
            txtNameShipping.focus()
            return false
            } else if (txtAddress1Shipping.length < 1) {
            document.getElementById('<%=lblAddress1Shipping.clientid %>').style.color = '#ff0000'
            alert(' Please enter the address for shipping. ')
            txtAddress1Shipping.focus()
            return false
            } else if (txtCityShipping.length < 1) {
            document.getElementById('<%=lblCityShipping.clientid %>').style.color = '#ff0000'
            alert(' Please enter the city of shipping address. ')
            txtCityShipping.focus()
            return false
            } else if (txtZipShipping.length < 1) {
            document.getElementById('<%=lblZipShipping.clientid %>').style.color = '#ff0000'
            alert(' Please enter the zip of shipping address. ')
            txtZipShipping.focus()
            return false
            } else if (txtPhoneShipping.length < 1) {
            document.getElementById('<%=lblPhoneShipping.clientid %>').style.color = '#ff0000'
            alert(' Please enter the phone no. of shipping address. ')
            txtPhoneShipping.focus()
            return false
            } else {
            return true         
            } 
   } 
   
   function changedPayMethod() {
        var ddlPaymentMethod = document.getElementById('<%=ddlPaymentMethod.clientid %>')
        var strPaymentMethod = ddlPaymentMethod.options[ddlPaymentMethod.selectedIndex].value
        
        var txtCardNumber = document.getElementById('<%=txtCardNumber.clientid %>')
        var txtExpiresMonth = document.getElementById('<%=txtExpiresMonth.clientid %>')
        var txtExpiresYear = document.getElementById('<%=txtExpiresYear.clientid %>')
        var txtCVV = document.getElementById('<%=txtCVV.clientid %>')
        var ddlCardType = document.getElementById('<%=ddlCardType.clientid %>')
        
        var lblCardType  = document.getElementById('<%=lblCardType.clientid %>')
        var lblExpires = document.getElementById('<%=lblExpires.clientid %>')
        var lblCVV = document.getElementById('<%=lblCVV.clientid %>')
        var lblCardNumber = document.getElementById('<%=lblCardNumber.clientid %>')
        
        if (strPaymentMethod == 'Credit Card') {
                ddlCardType.disabled = false
                txtCardNumber.disabled = false
                txtExpiresMonth.disabled = false
                txtExpiresYear.disabled = false
                txtCVV.disabled = false
                
                lblCardNumber.disabled = false
                lblCardType.disabled = false
                lblCVV.disabled = false
                lblExpires.disabled = false
                
        } else {
                ddlCardType.disabled = true
                txtCardNumber.disabled = true 
                txtExpiresMonth.disabled = true
                txtExpiresYear.disabled = true
                txtCVV.disabled = true

                lblCardNumber.disabled = true
                lblCardType.disabled = true
                lblCVV.disabled = true
                lblExpires.disabled = true
                
        }        
   
   }
   
   </script>

    <div id="controlbar" class="highslide-overlay controlbar">
        <a class="close" href="#" onclick="return hs.close(this)" title="Close"></a>
    </div>

</asp:Content>

