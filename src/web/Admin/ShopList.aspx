<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false"  CodeFile="ShopList.aspx.vb" Inherits="Admin_ShopList" Title="Untitled Page" %>
<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"   Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div style="text-align:right; width:800px; padding-right:20px; padding-top:10px; padding-bottom:10px;">
                <asp:Button ID="btnAddNew" runat="server" Text="Add New" Height="22px" 
                        Width="100px" />
        </div>
        <div>
                <igtbl:UltraWebGrid ID="ugShoplist" runat="server" Browser="Xml" DataSourceID="DS_ShopList"
                        Height="470px" Width="800px">
                        <Bands>
                                <igtbl:UltraGridBand>
                                        <Columns>
                                                <igtbl:UltraGridColumn BaseColumnName="SerialNo" DataType="System.Decimal" IsBound="True"
                                                        Key="SerialNo">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Hand">
                                                        </CellStyle>
                                                        <Header Caption="SerialNo">
                                                        </Header>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="DisplayOrder" DataType="System.Decimal" IsBound="True"
                                                        Key="DisplayOrder">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Display Order">
                                                                <RowLayoutColumnInfo OriginX="1" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="1" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="Class" IsBound="True" Key="Class">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Class">
                                                                <RowLayoutColumnInfo OriginX="2" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="2" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="CompanyName" IsBound="True" Key="CompanyName"
                                                        Width="150px">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Company Name">
                                                                <RowLayoutColumnInfo OriginX="3" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="3" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="AddressLine1" IsBound="True" Key="AddressLine1"
                                                        Width="200px">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Address 1">
                                                                <RowLayoutColumnInfo OriginX="4" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="4" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="SuiteNo" IsBound="True" Key="SuiteNo" Width="100px">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="SuiteNo">
                                                                <RowLayoutColumnInfo OriginX="5" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="5" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="AddressLine2" IsBound="True" Key="AddressLine2"
                                                        Width="200px">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Address 2">
                                                                <RowLayoutColumnInfo OriginX="6" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="6" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="Phone" IsBound="True" Key="Phone">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Phone">
                                                                <RowLayoutColumnInfo OriginX="7" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="7" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="Fax" IsBound="True" Key="Fax">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Fax">
                                                                <RowLayoutColumnInfo OriginX="8" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="8" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                                <igtbl:UltraGridColumn BaseColumnName="Email" IsBound="True" Key="Email">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Cursor="Default">
                                                        </CellStyle>
                                                        <Header Caption="Email">
                                                                <RowLayoutColumnInfo OriginX="9" />
                                                        </Header>
                                                        <Footer>
                                                                <RowLayoutColumnInfo OriginX="9" />
                                                        </Footer>
                                                </igtbl:UltraGridColumn>
                                        </Columns>
                                        <AddNewRow Visible="NotSet" View="NotSet">
                                        </AddNewRow>
                                </igtbl:UltraGridBand>
                        </Bands>
                        <DisplayLayout Version="4.00" SelectTypeRowDefault="Extended" Name="UltraWebGrid1"
                                AllowSortingDefault="Yes" AllowColSizingDefault="Free" RowHeightDefault="20px"
                                TableLayout="Fixed" RowSelectorsDefault="No" AllowColumnMovingDefault="OnServer"
                                HeaderClickActionDefault="SortMulti" StationaryMargins="Header" BorderCollapseDefault="Separate"
                                StationaryMarginsOutlookGroupBy="True" LoadOnDemand="Xml">
                                <FrameStyle BackColor="Window" BorderColor="InactiveCaption" BorderWidth="1px" BorderStyle="Solid"
                                        Font-Names="Microsoft Sans Serif" Font-Size="10px" Height="470px" 
                                        Width="800px" ForeColor="#000066">
                                </FrameStyle>
                                <Pager MinimumPagesForDisplay="2">
                                        <PagerStyle BackColor="LightGray" BorderWidth="1px" BorderStyle="Solid">
                                                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px">
                                                </BorderDetails>
                                        </PagerStyle>
                                </Pager>
                                <EditCellStyleDefault BorderWidth="0px" BorderStyle="None">
                                </EditCellStyleDefault>
                                <FooterStyleDefault BackColor="LightGray" BorderWidth="1px" BorderStyle="Solid">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px">
                                        </BorderDetails>
                                </FooterStyleDefault>
                                <HeaderStyleDefault HorizontalAlign="Left" BackColor="LightGray" 
                                        BorderStyle="Solid" Font-Bold="True" Font-Names="Verdana" Font-Size="11px" 
                                        Height="24px">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px">
                                        </BorderDetails>
                                </HeaderStyleDefault>
                                <RowStyleDefault BackColor="Window" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                        Font-Names="Microsoft Sans Serif" Font-Size="8.25pt" Height="25px">
                                        <Padding Left="3px"></Padding>
                                        <BorderDetails ColorLeft="Window" ColorTop="Window"></BorderDetails>
                                </RowStyleDefault>
                                <GroupByRowStyleDefault BackColor="Control" BorderColor="Window">
                                </GroupByRowStyleDefault>
                                <GroupByBox Hidden="True">
                                        <BoxStyle BackColor="ActiveBorder" BorderColor="Window">
                                        </BoxStyle>
                                </GroupByBox>
                                <AddNewBox>
                                        <BoxStyle BackColor="Window" BorderColor="InactiveCaption" BorderWidth="1px" BorderStyle="Solid">
                                                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px">
                                                </BorderDetails>
                                        </BoxStyle>
                                </AddNewBox>
                                <ActivationObject BorderColor="" BorderWidth="">
                                </ActivationObject>
                                <FilterOptionsDefault>
                                        <FilterDropDownStyle CustomRules="overflow:auto;" BackColor="White" BorderColor="Silver"
                                                BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                                                Font-Size="11px" Height="300px" Width="200px">
                                                <Padding Left="2px"></Padding>
                                        </FilterDropDownStyle>
                                        <FilterHighlightRowStyle BackColor="#151C55" ForeColor="White">
                                        </FilterHighlightRowStyle>
                                        <FilterOperandDropDownStyle CustomRules="overflow:auto;" BackColor="White" BorderColor="Silver"
                                                BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                                                Font-Size="11px">
                                                <Padding Left="2px"></Padding>
                                        </FilterOperandDropDownStyle>
                                </FilterOptionsDefault>
                        </DisplayLayout>
                </igtbl:UltraWebGrid>
        <asp:SqlDataSource ID="DS_ShopList" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
                SelectCommand="SELECT * FROM [ShopList] ORDER BY [DisplayOrder] DESC"></asp:SqlDataSource>
        </div>
</asp:Content>
