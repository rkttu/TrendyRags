<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" CodeFile="ClientList.aspx.vb" Inherits="Admin_ClientList" title="Untitled Page" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1">
        <div style="text-align: left; margin: 5px 0px 5px 10px;">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial,Verdana"
            Font-Size="12pt" Text="Client LIST"></asp:Label>
    </div>
    <igtbl:UltraWebGrid ID="uwGridList" runat="server" DataSourceID="sqlDSTrendyRags"
        Height="500px" Width="800px" DataMember="DefaultView">
        <Bands>
            <igtbl:UltraGridBand>
                <AddNewRow View="NotSet" Visible="NotSet">
                </AddNewRow>
                    <Columns>
                            <igtbl:UltraGridColumn BaseColumnName="SerialNo" DataType="System.Decimal" 
                                    IsBound="True" Key="SerialNo" Width="60px">
                                    <CellStyle Cursor="Hand" HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="SerialNo">
                                    </Header>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Class" IsBound="True" Key="Class" 
                                    Width="80px">
                                    <CellStyle Cursor="Default" HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Class">
                                            <RowLayoutColumnInfo OriginX="1" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="1" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="WholesaleLevel" IsBound="True" 
                                    Key="WholesaleLevel" Width="50px">
                                    <CellStyle Cursor="Default" HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Level">
                                            <RowLayoutColumnInfo OriginX="2" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="2" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="CompanyName" IsBound="True" 
                                    Key="CompanyName" Width="150px">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Company">
                                            <RowLayoutColumnInfo OriginX="3" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="3" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="ClientNameF" IsBound="True" 
                                    Key="ClientNameF">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="First Name">
                                            <RowLayoutColumnInfo OriginX="4" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="4" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="ClientNameL" IsBound="True" 
                                    Key="ClientNameL">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Last Name">
                                            <RowLayoutColumnInfo OriginX="5" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="5" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Email" IsBound="True" Key="Email">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Email">
                                            <RowLayoutColumnInfo OriginX="6" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="6" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Phone" IsBound="True" Key="Phone">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Phone">
                                            <RowLayoutColumnInfo OriginX="7" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="7" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Street1" IsBound="True" Key="Street1">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Street1">
                                            <RowLayoutColumnInfo OriginX="8" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="8" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Street2" IsBound="True" Key="Street2">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Street2">
                                            <RowLayoutColumnInfo OriginX="9" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="9" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="City" IsBound="True" Key="City">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="City">
                                            <RowLayoutColumnInfo OriginX="10" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="10" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="State" IsBound="True" Key="State">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="State">
                                            <RowLayoutColumnInfo OriginX="11" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="11" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Zip" IsBound="True" Key="Zip">
                                    <CellStyle Cursor="Default" HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Zip">
                                            <RowLayoutColumnInfo OriginX="12" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="12" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="Country" IsBound="True" Key="Country">
                                    <CellStyle Cursor="Default" HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="Country">
                                            <RowLayoutColumnInfo OriginX="13" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="13" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="MailOPT" 
                                    IsBound="True" Key="MailOPT">
                                    <CellStyle Cursor="Default" HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="MailOPT">
                                            <RowLayoutColumnInfo OriginX="14" />
                                    </Header>
                                    <Footer>
                                            <RowLayoutColumnInfo OriginX="14" />
                                    </Footer>
                            </igtbl:UltraGridColumn>
                            <igtbl:UltraGridColumn BaseColumnName="RegDate" DataType="System.DateTime" 
                                    IsBound="True" Key="RegDate">
                                    <CellStyle Cursor="Default">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Header Caption="RegDate">
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
            SelectTypeCellDefault="Single" StationaryMargins="HeaderAndFooter"
            StationaryMarginsOutlookGroupBy="True" TableLayout="Fixed" UseFixedHeaders="True"
            Version="3.00" RowSelectorsDefault="No">
            <ActivationObject BorderColor="168, 167, 191" BorderWidth="">
            </ActivationObject>
            <FooterStyleDefault BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
            </FooterStyleDefault>
            <RowStyleDefault BackColor="Window" BorderColor="#A8A7BF" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="8pt">
                <BorderDetails ColorLeft="Window" ColorTop="Window" />
                <Padding Left="3px" />
            </RowStyleDefault>
            <FilterOptionsDefault AllowRowFiltering="OnServer" FilterUIType="HeaderIcons">
                <FilterOperandDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid"
                    BorderWidth="1px" CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                    Font-Size="11px">
                    <Padding Left="2px" />
                </FilterOperandDropDownStyle>
                <FilterHighlightRowStyle BackColor="#151C55" ForeColor="White">
                </FilterHighlightRowStyle>
                <FilterDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"
                    CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                    Font-Size="11px" ForeColor="#000040" Width="200px">
                    <Padding Left="2px" />
                </FilterDropDownStyle>
            </FilterOptionsDefault>
            <SelectedRowStyleDefault BackColor="#B7B6CA">
            </SelectedRowStyleDefault>
            <HeaderStyleDefault BackColor="#CECDDB" BorderStyle="Solid" ForeColor="Black" HorizontalAlign="Left">
                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
            </HeaderStyleDefault>
            <EditCellStyleDefault BorderStyle="None" BorderWidth="0px">
            </EditCellStyleDefault>
            <FrameStyle BackColor="#F3F3F6" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
                Font-Size="8pt" ForeColor="MidnightBlue" Height="500px" Width="800px">
            </FrameStyle>
            <Pager AllowPaging="True" PageSize="22">
                <PagerStyle BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                    <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                </PagerStyle>
            </Pager>
            <AddNewBox>
                <BoxStyle BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                    <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                </BoxStyle>
            </AddNewBox>
        </DisplayLayout>
    </igtbl:UltraWebGrid>
    <asp:SqlDataSource ID="sqlDSTrendyRags" runat="server" ConnectionString="<%$ ConnectionStrings:TrendyRags %>"
        
                
                SelectCommand="SELECT [SerialNo], [Class], [WholesaleLevel], [CompanyName], [ClientNameF], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [RegDate] FROM [ClientMaster] ORDER BY [Class] DESC, [RegDate] DESC, [SerialNo] DESC">
    </asp:SqlDataSource>
</asp:Content>
