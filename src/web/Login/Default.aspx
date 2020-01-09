<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false"  CodeFile="Default.aspx.vb" Inherits="Login_Default" Title="TrendyRags.com - Login"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <table border="0" cellpadding="0" cellspacing="0" width="810">
        <tr>
            <td style="width: 620px; vertical-align: top; text-align: right">
                <table width="620">
                    <tr>
                        <td style="width: 50px; height: 193px;">
                            &nbsp;</td>
                        <td style="text-align: left; height: 193px; vertical-align:top; width:250px; padding-top:30px;">
                            <table border="0"   style="border: thin double #FFFF00; margin-right: 20px; margin-top: 10px; width:240px; height:190px;">
                                <tr>
                                    <td colspan="2" style="padding-bottom: 5px; height: 50px; text-align: center">
                                            <span style="font-size: 14pt; color: #FFD700; font-family: Verdana">Returning 
                                            Customers</span></td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 7px; padding-bottom: 5px; padding-left: 10px; width: 70px; text-align: right; font-weight: bold; font-size: 11px;">(e-mail)</td>
                                    <td style="padding-bottom: 5px; width: 157px;">
                                        <asp:TextBox ID="txtLoginID" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                                    TabIndex="1" Width="120px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 7px; padding-bottom: 5px; padding-left: 10px; width: 70px; text-align: right; font-weight: bold; font-size: 11px; ">Password</td>
                                    <td style="padding-bottom: 5px; width: 157px;">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                                                    BorderStyle="Solid" BorderWidth="1px" TabIndex="2" Width="120px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style=" height: 67px; text-align: center;" colspan="2">
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" BorderWidth="1px" 
                                                    OnClientClick="return chkValidation()" TabIndex="3" Width="70px" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" BorderStyle="Solid" 
                                                    BorderWidth="1px" TabIndex="4" Width="70px" /><br />
                                        <br />
                                        <asp:LinkButton ID="lbtnFindPassword" runat="server" Font-Size="11px" ForeColor="White" Font-Bold="True" TabIndex="6">* Lost Password?</asp:LinkButton></td>
                                </tr>
                            </table>
                        </td>
                        <td style="text-align: center; height: 193px; vertical-align:top; padding-top:30px; width:250px;">
                            <table border="0" style="border: thin double #FFFF00; margin-right: 20px; margin-top: 10px; width:230px; height:190px;">
                                <tr>
                                    <td colspan="2" style="padding-bottom: 5px; height: 50px; text-align: center">
                                            <span style="font-size: 14pt; color: #FFD700; font-family: Verdana">New 
                                            Customers</span></td>
                                </tr>
                                <tr>
                                    <td colspan="2" 
                                                style="padding-left:15px; padding-bottom: 5px; padding-right:15px; height: 50px; text-align: Left; font-family: Verdana;">
                                            <b>If you have never purchased online from us, please register with us to order.</b></td>
                                </tr>
                                <tr>
                                    <td style=" height: 67px; text-align: center;" colspan="2">
                                        <asp:Button ID="btnRegister" runat="server" Text="REGISTER" BorderWidth="1px" 
                                                    TabIndex="3" Width="120px" />
                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                        <tr>
                                <td colspan="3" 
                                        style="padding:20px 20px 20px 100px; text-align:left; font-family: Verdana;">
                                        <b>Questions or Problems? Call 1-213-471-2913<br />
                                        <br />
                                        BENEFITS OF REGISTRATION
                                        </b>
                                        <ul>
                                                <li><b>Sign up to recieve email updates of the latest items at TrendyRags.com</b></li>
                                                <li><b>Quick Checkout</b></li>
                                                <li><b>Special promos for registered customer only</b></li>
                                        </ul>
                                </td>
                        </tr>

                </table>
            </td>
           <!-- 
            <td>
                <div class="Right_banner01">
                    <asp:Image ID="Home_01" runat="server" ImageUrl="~/images/Home_01.jpg" /></div>
                <div class="Right_banner02">
                    <asp:Image ID="Home_02" runat="server" ImageUrl="~/images/Home_02.jpg" /></div>
                <div class="Right_banner03">
                    <asp:Image ID="Home_03" runat="server" ImageUrl="~/images/Home_03.jpg" /></div>
            </td>
           --> 
        </tr>
    </table>
   
   <script language="javascript" type="text/javascript">
   <!--
   function chkValidation() 
   {
        var txtID = document.getElementById('<%=txtLoginID.clientid %>').value
        var txtPassword = document.getElementById('<%=txtPassword.clientid %>').value

        // alert(txtID)
        // alert(SizeValue) 

        if (txtID == '') {
            alert(' Please enter your ID(e-mail) first !!')
            return false
           }  else if (txtPassword == '') {
            alert(' Please enter your password !!')
            return false
           }  else {
        return true         
       } 
   
   }
   -->
   </script> 
</asp:Content>
