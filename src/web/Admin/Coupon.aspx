<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" CodeFile="Coupon.aspx.vb" Inherits="Admin_Coupon" title="Untitled Page" %>


<%@ Register assembly="Infragistics2.WebUI.WebDateChooser.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebSchedule" tagprefix="igsch" %>


<%@ Register assembly="Infragistics2.WebUI.WebDataInput.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebDataInput" tagprefix="igtxt" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div style="text-align: left; font-size: 18px; font-family: Verdana; padding: 50px 10px 25px 20px">
                Coupon list Manager</div>
        <div style="text-align: left; padding-left: 10px; font-size: 12px">
                <table cellpadding="5" style="width: 700px; border-width: 0px;">
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">Serial No.</td>
                                <td><asp:TextBox ID="txtSerialNo" Width="150px" runat="server" BorderWidth="0" 
                                                BackColor="#EEEEEE" Font-Size="13px" ForeColor="#333333" ReadOnly="True"></asp:TextBox>
                                        </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">Coupon Code</td>
                                <td><asp:TextBox ID="txtCouponCode" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                        </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">Sales Rep.</td>
                                <td><asp:TextBox ID="txtSalesRep" runat="server" BorderWidth="0px" Width="300px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">Date of Begin</td>
                                <td valign="middle">
                                        <igsch:WebDateChooser ID="dateBegin" runat="server" 
                                                Width="300px" Value="">
                                        <CalendarLayout NextMonthImageUrl="ig_cal_grayN.gif" 
                                                PrevMonthImageUrl="ig_cal_grayP.gif" ShowMonthDropDown="False" 
                                                ShowYearDropDown="False" TitleFormat="Month">
                                                <CalendarStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                        Font-Strikeout="False" Font-Underline="False" BackColor="Black" 
                                                        Font-Names="Verdana" Font-Size="9pt" ForeColor="White">
                                                </CalendarStyle>
                                                <DayHeaderStyle BackColor="#404040" Font-Size="8pt" ForeColor="#E0E0E0" 
                                                        Height="1pt">
                                                <BorderDetails ColorBottom="Gray" StyleBottom="Solid" WidthBottom="1px" />
                                                </DayHeaderStyle>
                                                <OtherMonthDayStyle ForeColor="Gray" />
                                                <SelectedDayStyle BackColor="Silver" ForeColor="Black" />
                                                <TitleStyle BackColor="Black" Font-Bold="True" ForeColor="#E0E0E0" 
                                                        Height="18pt" />
                                                <TodayDayStyle BackColor="#404040" />
                                                <FooterStyle BackColor="#404040" BorderColor="#606060" BorderStyle="Solid" 
                                                        BorderWidth="1px" ForeColor="#E0E0E0" />
                                        </CalendarLayout>
                                        </igsch:WebDateChooser><asp:TextBox ID="txtTimeBegin" runat="server" 
                                                BorderWidth="0px" Visible="False">00:00:00</asp:TextBox>
                                        </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">Date of Finish</td>
                                <td><igsch:WebDateChooser ID="dateFinish" runat="server" 
                                                Width="300px">
                                        <CalendarLayout NextMonthImageUrl="ig_cal_grayN.gif" 
                                                PrevMonthImageUrl="ig_cal_grayP.gif" ShowMonthDropDown="False" 
                                                ShowYearDropDown="False" TitleFormat="Month">
                                                <CalendarStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                        Font-Strikeout="False" Font-Underline="False" BackColor="Black" 
                                                        Font-Names="Verdana" Font-Size="9pt" ForeColor="White">
                                                </CalendarStyle>
                                                <DayHeaderStyle BackColor="#404040" Font-Size="8pt" ForeColor="#E0E0E0" 
                                                        Height="1pt">
                                                <BorderDetails ColorBottom="Gray" StyleBottom="Solid" WidthBottom="1px" />
                                                </DayHeaderStyle>
                                                <OtherMonthDayStyle ForeColor="Gray" />
                                                <SelectedDayStyle BackColor="Silver" ForeColor="Black" />
                                                <TitleStyle BackColor="Black" Font-Bold="True" ForeColor="#E0E0E0" 
                                                        Height="18pt" />
                                                <TodayDayStyle BackColor="#404040" />
                                                <FooterStyle BackColor="#404040" BorderColor="#606060" BorderStyle="Solid" 
                                                        BorderWidth="1px" ForeColor="#E0E0E0" />
                                        </CalendarLayout>
                                        </igsch:WebDateChooser>
                                        <asp:TextBox ID="txtTimeFinish" runat="server" BorderWidth="0px" 
                                                Visible="False">23:59:59</asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">DC Rate (%)</td>
                                <td><asp:TextBox ID="txtDCRate" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px;">Products (Codes)</td>
                                <td><asp:TextBox ID="txtProductCodes" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td width="150" align="right" style="padding-right: 10px; height: 49px;"></td>
                                <td valign="bottom" style="height: 60px">
                                        <asp:Button ID="btnOK" runat="server" Text=" OK " Width="100px" />&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text=" Cancel " Width="100px" 
                                                OnClientClick="return confirm('  Are you sure you want to cancel?  ')" 
                                                Height="26px" />
                                        &nbsp;
                                        <asp:Button ID="btnRemove" runat="server" OnClientClick="return confirm('  Are you sure you want to remove this client ??  ')"
                                                Text="  Remove  " />
                                </td>
                        </tr>
                </table>
                
        </div>
</asp:Content>
