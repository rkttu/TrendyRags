<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false" CodeFile="TellAFriend.aspx.vb" Inherits="Event_TellAFriend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="width:750px; border-width:0px; padding-top:15px; padding-left: 20px; text-align:left;  font-size:16px;">Tell your friend about this style..
        <asp:TextBox ID="txtStyleNo" runat="server" Visible="False" Width="109px"></asp:TextBox>
</div>
<table style="width:750px; border-width:0px; margin-top:15px; ">
        <tr>
                <td rowspan="2" width="120" style="text-align:right; font-weight:bold;">From</td>
                <td style="width: 150px; text-align:right; padding-right:15px;">Your Name</td>
                <td style="text-align:left; width: 480px;"><asp:TextBox ID="txtFromName" runat="server" Width="430"> </asp:TextBox></td>
        </tr>
        <tr>
                <td style="text-align:right; padding-right:15px;">
                        <span style="color: #FF0000; font-weight: bold">(*)</span> Your Email</td>
                <td style="text-align:left; width: 480px;"><asp:TextBox ID="txtFromEmail" runat="server" Width="430"> </asp:TextBox></td>
        </tr>
        <tr>
                <td colspan="3" style="height:10px;">&nbsp;</td>
        </tr>
        <tr>
                <td rowspan="2" style="text-align:right; font-weight:bold; ">To</td>
                <td style="text-align:right; padding-right:15px; ">Friend's Name</td>
                <td style="text-align:left; width: 480px;"><asp:TextBox ID="txtToName" runat="server" Width="430"> </asp:TextBox></td>
        </tr>
        <tr>
                <td style="text-align:right; padding-right:15px;">
                        <span style="color: #FF0000; font-weight: bold">(*)</span> Friend's Email</td>
                <td style="text-align:left; width: 480px;"><asp:TextBox ID="txtToEmail" runat="server" Width="430"> </asp:TextBox></td>
        </tr>
        <tr>
                <td colspan="3" style="height:10px;">&nbsp;</td>
        </tr>
        <tr>
                <td colspan="2" style="text-align:right; padding-right:15px;">
                        <span style="color: #FF0000"><b>(*)</b></span> Subject</td>
                <td style="text-align:left; width: 480px;"><asp:TextBox ID="txtSubject" runat="server" Width="430"></asp:TextBox></td>
        </tr>
        <tr>
                <td colspan="3" style="height:10px;">&nbsp;</td>
        </tr>
        <tr>
                <td colspan="3" style="height:30px; vertical-align:bottom; text-align:left; font-size:14px; padding-left:100px;">
                        <span style="color: #FF0000"><b>(*)</b></span> Enter your message here</td>
        </tr>
        <tr>
                <td colspan="2">&nbsp;</td>
                <td style="text-align:left; width: 480px;">
                        <asp:TextBox ID="txtMessage" runat="server" Width="430px" 
                                Height="120px" TextMode="MultiLine"> </asp:TextBox></td>
        </tr>
</table>

<div style="width:750px; border-width:0px; margin-top:15px; text-align:center; font-size:12px; ">
        <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" 
                onclientclick="return chkValid()" />&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" /></div>
        
<script id="chkValid" language="javascript" type="text/javascript" >

        function chkValid() {

        var txtFromEmail = document.getElementById('<%=txtFromEmail.clientid %>').value
        var txtToEmail = document.getElementById('<%=txtToEmail.clientid %>').value
        var txtSubject = document.getElementById('<%=txtSubject.clientid %>').value
        var txtMessage = document.getElementById('<%=txtMessage.clientid %>').value

         var filter=/^.+@.+\..{2,3}$/

         if (!filter.test(txtFromEmail)) {
            alert("Please input your valid email address!")
            document.getElementById('<%=txtFromEmail.clientid %>').focus()
            return false

            } else if (!filter.test(txtToEmail)) {
            alert("Please input friend\'s valid email address!")
            document.getElementById('<%=txtToEmail.clientid %>').focus()
            return false

            } else if (txtSubject.length < 1) {
            alert(' Please enter the subject. ')
            document.getElementById('<%=txtSubject.clientid %>').focus()
            return false

            } else if (txtMessage.length < 1) {
            alert(' Please enter the message. ')
            document.getElementById('<%=txtMessage.clientid %>').focus()
            return false

            } else {

            return true         

            }         
        
        }

</script>        

</asp:Content>

