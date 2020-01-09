<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false"
        CodeFile="ProductList.aspx.vb" Inherits="Admin_ProductList" Title="Untitled Page" %>
<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
        Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div style="text-align: left; margin: 5px 0px 5px 10px;">
                <asp:Label ID="Label1" runat="server" Text="Product LIST" Font-Bold="True" Font-Italic="True"
                        Font-Names="Arial,Verdana" Font-Size="12pt"></asp:Label>
        </div>
        <div style="text-align:leff; width:850px;">
        <igtbl:UltraWebGrid ID="uwGridList" runat="server" DataSourceID="sqlDSTrendyRags"
                Height="725px" Width="870px" DataMember="DefaultView">
                <Bands>
                        <igtbl:UltraGridBand>
                                <AddNewRow View="NotSet" Visible="NotSet">
                                </AddNewRow>
                                <Columns>
                                        <igtbl:UltraGridColumn Key="Gender" Width="75px" BaseColumnName="Gender" 
                                                IsBound="True">
                                                <CellStyle Cursor="Default" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="Gender">
                                                        <RowLayoutColumnInfo OriginX="8" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="8" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="DisplayOrder" IsBound="True" 
                                                Key="DisplayOrder"  Width="75px" DataType="System.Decimal" 
                                                AllowUpdate="Yes">
                                                <CellStyle Cursor="Default" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="Order">
                                                        <RowLayoutColumnInfo OriginX="7" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="7" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="ProductNo" IsBound="True" 
                                                Key="ProductNo" Width="100px">
                                                <CellStyle Cursor="Hand" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="ProductNo">
                                                        <RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
                                                </Header>

                                                <Footer>
                                                <RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="ProductName" IsBound="True" 
                                                Key="ProductName" Width="170px">
                                                <CellStyle Cursor="Default">
                                                </CellStyle>
                                                <Header Caption="ProductName">
                                                        <RowLayoutColumnInfo OriginX="1" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="1" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="Status" IsBound="True" Key="Status"  
                                                Width="60px" AllowUpdate="Yes">
                                                <CellStyle Cursor="Default" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="Status">
                                                        <RowLayoutColumnInfo OriginX="2" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="2" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="WebDisplay" IsBound="True"   
                                                Key="WebDisplay" Width="60px" AllowUpdate="Yes">
                                                <CellStyle Cursor="Default" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="Display">
                                                        <RowLayoutColumnInfo OriginX="3" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="3" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="NewItem" IsBound="True"   Key="NewItem" 
                                                Width="50px" AllowUpdate="Yes">
                                                <CellStyle Cursor="Default" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="New">
                                                        <RowLayoutColumnInfo OriginX="4" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="4" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="ExclusiveSales" IsBound="True" 
                                                Key="ExclusiveSales" Width="65px">
                                                <CellStyle Cursor="Default" HorizontalAlign="Center">
                                                </CellStyle>
                                                <Header Caption="Exclusive">
                                                        <RowLayoutColumnInfo OriginX="5" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="5" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceRetail" IsBound="True"  
                                                Key="PriceRetail" DataType="System.Double"  Format="$ ###,###,##0.00" 
                                                Width="90px" AllowUpdate="No">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Retail Price">
                                                        <RowLayoutColumnInfo OriginX="6" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="6" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceWholesale5" 
                                                DataType="System.Double" Format="$ ###,###,##0.00" IsBound="True" 
                                                Key="PriceWholesale5" Width="110px" AllowUpdate="No">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Wholesale5(Default)">
                                                        <RowLayoutColumnInfo OriginX="9" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="9" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceWholesale4" IsBound="True" 
                                                Key="PriceWholesale4" DataType="System.Double" 
                                                Format="$ ###,###,##0.00" Width="100px">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Wholesale4">
                                                        <RowLayoutColumnInfo OriginX="14" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="14" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceWholesale3" DataType="System.Double" 
                                                IsBound="True" Key="PriceWholesale3" Format="$ ###,###,##0.00" 
                                                Width="100px">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Wholesale3">
                                                        <RowLayoutColumnInfo OriginX="13" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="13" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceWholesale2" 
                                                DataType="System.Double" Format="$ ###,###,##0.00" IsBound="True" 
                                                Key="PriceWholesale2" Width="100px">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Wholesale2">
                                                        <RowLayoutColumnInfo OriginX="12" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="12" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceWholesale1" 
                                                DataType="System.Double" Format="$ ###,###,##0.00" IsBound="True" 
                                                Key="PriceWholesale1" Width="100px">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Wholesale1">
                                                        <RowLayoutColumnInfo OriginX="11" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="11" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="PriceRetailEvent1" 
                                                DataType="System.Double" Format="$ ###,###,##0.00" IsBound="True" 
                                                Key="PriceRetailEvent1" Width="100px">
                                                <CellStyle Cursor="Default" HorizontalAlign="Right">
                                                        <Padding Right="10px" />
                                                </CellStyle>
                                                <Header Caption="Event Price">
                                                        <RowLayoutColumnInfo OriginX="10" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="10" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                        <igtbl:UltraGridColumn BaseColumnName="Stock" IsBound="True" 
                                                Key="Stock" DataType="System.Decimal" Width="60px">
                                                <CellStyle Cursor="Default">
                                                </CellStyle>
                                                <Header Caption="Stock">
                                                        <RowLayoutColumnInfo OriginX="15" />
                                                </Header>
                                                <Footer>
                                                        <RowLayoutColumnInfo OriginX="15" />
                                                </Footer>
                                        </igtbl:UltraGridColumn>
                                </Columns>
                        </igtbl:UltraGridBand>
                </Bands>
                <DisplayLayout AllowColSizingDefault="Free" AllowSortingDefault="Yes" BorderCollapseDefault="Separate"
                        HeaderClickActionDefault="SortMulti" Name="uwGridList" RowHeightDefault="20px"
                        SelectTypeCellDefault="Single" SelectTypeRowDefault="Single" StationaryMargins="HeaderAndFooter"
                        StationaryMarginsOutlookGroupBy="True" TableLayout="Fixed"
                        Version="3.00" RowSelectorsDefault="No" AllowUpdateDefault="Yes">
                        <FrameStyle BackColor="#F3F3F6" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
                                Font-Size="8pt" Height="725px" Width="870px" ForeColor="MidnightBlue">
                        </FrameStyle>
                        <Pager PageSize="35" AllowPaging="True">
                                <PagerStyle BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px" 
                                        Font-Bold="True" Font-Names="Arial" Font-Size="13px" Height="25px" 
                                        HorizontalAlign="Left" VerticalAlign="Middle">
                                        <Padding Left="10px" />
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                                </PagerStyle>
                        </Pager>
                        <EditCellStyleDefault BorderStyle="None" BorderWidth="0px">
                        </EditCellStyleDefault>
                        <FooterStyleDefault BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px" 
                                Height="25px">
                                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                        </FooterStyleDefault>
                        <HeaderStyleDefault BackColor="#CECDDB" BorderStyle="Solid" ForeColor="Black" 
                                HorizontalAlign="Left" Cursor="Default">
                                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                        </HeaderStyleDefault>
                        <SelectedHeaderStyleDefault Cursor="Default">
                        </SelectedHeaderStyleDefault>
                        <RowStyleDefault BackColor="Window" BorderColor="#A8A7BF" BorderStyle="Solid" BorderWidth="1px"
                                Font-Names="Verdana" Font-Size="8pt">
                                <BorderDetails ColorLeft="Window" ColorTop="Window" />
                                <Padding Left="3px" />
                        </RowStyleDefault>
                        <SelectedRowStyleDefault BackColor="#B7B6CA">
                        </SelectedRowStyleDefault>
                        <AddNewBox>
                                <BoxStyle BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                                </BoxStyle>
                        </AddNewBox>
                        <ActivationObject BorderColor="168, 167, 191" BorderWidth="">
                        </ActivationObject>
                        <FilterOptionsDefault AllowRowFiltering="OnServer">
                                <FilterOperandDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid"
                                        BorderWidth="1px" CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                                        Font-Size="11px">
                                        <Padding Left="2px" />
                                </FilterOperandDropDownStyle>
                                <FilterHighlightRowStyle BackColor="#151C55" ForeColor="White">
                                </FilterHighlightRowStyle>
                                <FilterDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"
                                        CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                                        Font-Size="11px" Width="200px" ForeColor="#000040">
                                        <Padding Left="2px" />
                                </FilterDropDownStyle>
                        </FilterOptionsDefault>
                </DisplayLayout>
        </igtbl:UltraWebGrid>
        </div>
        <asp:SqlDataSource ID="sqlDSTrendyRags" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
                
                SelectCommand="SELECT [Gender], [DisplayOrder], [ProductNo], [ProductName], [NewItem], [ExclusiveSales], [PriceRetail], [PriceRetailEvent1], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay] FROM [ProductMaster] ORDER BY [DisplayOrder] DESC, [Gender] DESC, [ProductNo] ">
        </asp:SqlDataSource>
</asp:Content>
