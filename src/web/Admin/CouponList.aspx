<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" CodeFile="CouponList.aspx.vb" Inherits="Admin_CouponList" title="Untitled Page" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
        Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="text-align:left; font-size:17px; padding:20px 0px 20px 20px;">Coupon List</div>
        <div style="text-align:right; padding:0px 20px 5px 20px;"><asp:Button ID="btnAddNew" runat="server" Text="Add New" /></div>
        <igtbl:UltraWebGrid ID="ugCoupon" runat="server" DataSourceID="DS_Coupon" 
                Height="470px" Width="800px">
                <Bands>
<igtbl:UltraGridBand>
<AddNewRow View="NotSet" Visible="NotSet"></AddNewRow>
        <Columns>
                <igtbl:UltraGridColumn BaseColumnName="SerialNo" DataType="System.Decimal" 
                        IsBound="True" Key="SerialNo" Width="80px">
                        <CellStyle Cursor="Hand" HorizontalAlign="Center">
                        </CellStyle>
                        <Header Caption="SerialNo">
                        </Header>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="CouponCode" IsBound="True" 
                        Key="CouponCode">
                        <CellStyle Cursor="Hand" HorizontalAlign="Center">
                        </CellStyle>
                        <Header Caption="CouponCode">
                                <RowLayoutColumnInfo OriginX="1" />
                        </Header>
                        <Footer>
                                <RowLayoutColumnInfo OriginX="1" />
                        </Footer>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="Salesman" IsBound="True" Key="Salesman" 
                        Width="170px">
                        <Header Caption="Salesman">
                                <RowLayoutColumnInfo OriginX="2" />
                        </Header>
                        <Footer>
                                <RowLayoutColumnInfo OriginX="2" />
                        </Footer>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="StartDate" DataType="System.DateTime" 
                        IsBound="True" Key="StartDate" Width="130px">
                        <Header Caption="StartDate">
                                <RowLayoutColumnInfo OriginX="3" />
                        </Header>
                        <Footer>
                                <RowLayoutColumnInfo OriginX="3" />
                        </Footer>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="EndDate" DataType="System.DateTime" 
                        IsBound="True" Key="EndDate" Width="130px">
                        <Header Caption="EndDate">
                                <RowLayoutColumnInfo OriginX="4" />
                        </Header>
                        <Footer>
                                <RowLayoutColumnInfo OriginX="4" />
                        </Footer>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="DCRate" DataType="System.Int32" 
                        IsBound="True" Key="DCRate" Width="70px">
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                        <Header Caption="DCRate(%)">
                                <RowLayoutColumnInfo OriginX="5" />
                        </Header>
                        <Footer>
                                <RowLayoutColumnInfo OriginX="5" />
                        </Footer>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="Products" IsBound="True" Key="Products">
                        <Header Caption="Products">
                                <RowLayoutColumnInfo OriginX="6" />
                        </Header>
                        <Footer>
                                <RowLayoutColumnInfo OriginX="6" />
                        </Footer>
                </igtbl:UltraGridColumn>
        </Columns>
</igtbl:UltraGridBand>
</Bands>

<DisplayLayout Version="4.00" Name="UltraWebGrid1" AllowSortingDefault="Yes" 
                        AllowColSizingDefault="Free" RowHeightDefault="20px" TableLayout="Fixed" 
                        RowSelectorsDefault="No" AllowColumnMovingDefault="OnServer" 
                        HeaderClickActionDefault="SortMulti" StationaryMargins="Header" 
                        BorderCollapseDefault="Separate" StationaryMarginsOutlookGroupBy="True">
<FrameStyle BackColor="Window" BorderColor="InactiveCaption" BorderWidth="1px" 
                BorderStyle="Solid" Font-Names="Microsoft Sans Serif" Font-Size="12px" 
                Height="470px" Width="800px" ForeColor="#000066"></FrameStyle>

<Pager MinimumPagesForDisplay="2">
<PagerStyle BackColor="LightGray" BorderWidth="1px" BorderStyle="Solid">
<BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px"></BorderDetails>
</PagerStyle>
</Pager>

<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>

<FooterStyleDefault BackColor="LightGray" BorderWidth="1px" BorderStyle="Solid">
<BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px"></BorderDetails>
</FooterStyleDefault>

<HeaderStyleDefault HorizontalAlign="Center" BackColor="#000066" BorderStyle="Solid" 
                Font-Size="12px" ForeColor="White">
<BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px"></BorderDetails>
</HeaderStyleDefault>

<RowStyleDefault BackColor="Window" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Font-Names="Microsoft Sans Serif" Font-Size="8.25pt">
<Padding Left="3px"></Padding>

<BorderDetails ColorLeft="Window" ColorTop="Window"></BorderDetails>
</RowStyleDefault>

<GroupByRowStyleDefault BackColor="Control" BorderColor="Window"></GroupByRowStyleDefault>

<GroupByBox Hidden="True">
<BoxStyle BackColor="ActiveBorder" BorderColor="Window"></BoxStyle>
</GroupByBox>

<AddNewBox>
<BoxStyle BackColor="Window" BorderColor="InactiveCaption" BorderWidth="1px" BorderStyle="Solid">
<BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px"></BorderDetails>
</BoxStyle>
</AddNewBox>

<ActivationObject BorderColor="" BorderWidth=""></ActivationObject>

<FilterOptionsDefault>
<FilterDropDownStyle CustomRules="overflow:auto;" BackColor="White" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana,Arial,Helvetica,sans-serif" Font-Size="11px" Height="300px" Width="200px">
<Padding Left="2px"></Padding>
</FilterDropDownStyle>

<FilterHighlightRowStyle BackColor="#151C55" ForeColor="White"></FilterHighlightRowStyle>

<FilterOperandDropDownStyle CustomRules="overflow:auto;" BackColor="White" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana,Arial,Helvetica,sans-serif" Font-Size="11px">
<Padding Left="2px"></Padding>
</FilterOperandDropDownStyle>
</FilterOptionsDefault>
</DisplayLayout>
        </igtbl:UltraWebGrid>
        <asp:SqlDataSource ID="DS_Coupon" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TrendyRags %>" 
                SelectCommand="SELECT [SerialNo], [CouponCode], [Salesman], [StartDate], [EndDate], [DCRate], [Products] FROM [Coupon] ORDER BY [Salesman], [CouponCode]">
        </asp:SqlDataSource>
</asp:Content>

