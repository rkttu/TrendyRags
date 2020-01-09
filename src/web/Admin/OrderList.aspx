<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false"  CodeFile="OrderList.aspx.vb" Inherits="Admin_OrderList" Title="Untitled Page" %>
<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.3, Version=7.3.20073.38, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"  Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="text-align: left; margin: 5px 0px 5px 10px;">
        <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial,Verdana"  Font-Size="12pt" Text="Order LIST"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCondition" runat="server" Visible="False" Width="625px"></asp:TextBox>
    </div>
    <div style="text-align: left; margin: 5px 0px 5px 10px;">
            <asp:CheckBox ID="chkStatus09" runat="server" AutoPostBack="True" 
                    Text="Error" />
            <asp:CheckBox ID="chkStatus10" runat="server" AutoPostBack="True" 
                    Checked="True" Text="Order Confirmed" />
            <asp:CheckBox ID="chkStatus20" runat="server" AutoPostBack="True" 
                    Checked="True" Text="Processing" />
            <asp:CheckBox ID="chkStatus30" runat="server" AutoPostBack="True" 
                    Checked="True" Text="Packing" />
            <asp:CheckBox ID="chkStatus40" runat="server" AutoPostBack="True" 
                    Checked="True" Text="Shipped" />
            <asp:CheckBox ID="chkStatus50" runat="server" AutoPostBack="True" 
                    Text="Returned" />
            <asp:CheckBox ID="chkStatus60" runat="server" AutoPostBack="True" 
                    Text="Refunded" />
            <asp:CheckBox ID="chkStatus80" runat="server" AutoPostBack="True" 
                    Text="Finished" />
            <asp:CheckBox ID="chkStatus90" runat="server" AutoPostBack="True" 
                    Text="Cancelled" />
    </div>
    <igtbl:UltraWebGrid ID="UltraWebGrid1" runat="server" DataMember="DefaultView" 
                DataSourceID="sqlDSTrendyRags" Width="800px">
        <Bands>
            <igtbl:UltraGridBand SelectTypeRow="Single">
                <AddNewRow View="NotSet" Visible="NotSet">
                </AddNewRow>
                <Columns>
                    <igtbl:UltraGridColumn BaseColumnName="OrderNo" IsBound="True" Key="OrderNo" Width="70px">
                        <Header Caption="OrderNo">
                        </Header>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center" Cursor="Hand">
                        </CellStyle>
                        <SelectedCellStyle Cursor="Hand">
                        </SelectedCellStyle>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="OrderStatus" IsBound="True" Key="OrderStatus" Width="40px">
                        <Header Caption="Status">
                            <RowLayoutColumnInfo OriginX="1" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="1" />
                        </Footer>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="OrderDate" DataType="System.DateTime" IsBound="True"
                        Key="OrderDate">
                        <Header Caption="OrderDate">
                            <RowLayoutColumnInfo OriginX="2" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="2" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="RecipientName" IsBound="True" Key="RecipientName">
                        <Header Caption="RecipientName">
                            <RowLayoutColumnInfo OriginX="3" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="3" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="Email" IsBound="True" Key="Email">
                        <Header Caption="Email">
                            <RowLayoutColumnInfo OriginX="4" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="4" />
                        </Footer>
                        <SelectedCellStyle Cursor="Hand">
                        </SelectedCellStyle>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="OrderAmount" DataType="System.Double" IsBound="True"
                        Key="OrderAmount">
                        <Header Caption="OrderAmount">
                            <RowLayoutColumnInfo OriginX="5" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="5" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="TaxAmount" DataType="System.Double" IsBound="True"
                        Key="TaxAmount">
                        <Header Caption="TaxAmount">
                            <RowLayoutColumnInfo OriginX="6" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="6" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="ShippingAmount" DataType="System.Double" IsBound="True"
                        Key="ShippingAmount">
                        <Header Caption="ShippingAmount">
                            <RowLayoutColumnInfo OriginX="7" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="7" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="TotalAmount" DataType="System.Double" IsBound="True"
                        Key="TotalAmount">
                        <Header Caption="TotalAmount">
                            <RowLayoutColumnInfo OriginX="8" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="8" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="PayMethod" IsBound="True" Key="PayMethod">
                        <Header Caption="PayMethod">
                            <RowLayoutColumnInfo OriginX="9" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="9" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="Paystatus" IsBound="True" Key="Paystatus">
                        <Header Caption="Paystatus">
                            <RowLayoutColumnInfo OriginX="10" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="10" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="ShipMethod" IsBound="True" Key="ShipMethod">
                        <Header Caption="ShipMethod">
                            <RowLayoutColumnInfo OriginX="11" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="11" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="ClientNo" DataType="System.Decimal" IsBound="True"
                        Key="ClientNo">
                        <Header Caption="ClientNo">
                            <RowLayoutColumnInfo OriginX="12" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="12" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="RecipientStreet1" IsBound="True" Key="RecipientStreet1">
                        <Header Caption="RecipientStreet1">
                            <RowLayoutColumnInfo OriginX="13" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="13" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="RecipientStreet2" IsBound="True" Key="RecipientStreet2">
                        <Header Caption="RecipientStreet2">
                            <RowLayoutColumnInfo OriginX="14" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="14" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="RecipientCity" IsBound="True" Key="RecipientCity">
                        <Header Caption="RecipientCity">
                            <RowLayoutColumnInfo OriginX="15" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="15" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                    <igtbl:UltraGridColumn BaseColumnName="RecipientState" IsBound="True" Key="RecipientState">
                        <Header Caption="RecipientState">
                            <RowLayoutColumnInfo OriginX="16" />
                        </Header>
                        <Footer>
                            <RowLayoutColumnInfo OriginX="16" />
                        </Footer>
                    </igtbl:UltraGridColumn>
                </Columns>
                <SelectedRowStyle Cursor="Hand" BackColor="#CCFFFF" />
            </igtbl:UltraGridBand>
        </Bands>
        <DisplayLayout BorderCollapseDefault="Separate" Name="UltraWebGrid1" RowHeightDefault="20px"
            RowSizingDefault="Free" SelectTypeRowDefault="Single" StationaryMarginsOutlookGroupBy="True"
            TableLayout="Fixed" Version="3.00" RowSelectorsDefault="No" 
                    AllowSortingDefault="Yes" HeaderClickActionDefault="SortMulti">
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
            <FilterOptionsDefault>
                <FilterOperandDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid"
                    BorderWidth="1px" CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                    Font-Size="11px">
                    <Padding Left="2px" />
                </FilterOperandDropDownStyle>
                <FilterHighlightRowStyle BackColor="#151C55" ForeColor="White">
                </FilterHighlightRowStyle>
                <FilterDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"
                    CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                    Font-Size="11px" Width="200px">
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
                Font-Size="8pt" ForeColor="DarkBlue" Width="800px">
            </FrameStyle>
            <Pager>
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
        SelectCommand="R_OrderByCondition" SelectCommandType="StoredProcedure">
            <SelectParameters>
                    <asp:ControlParameter ControlID="txtCondition" 
                            DefaultValue="( OrderStatus&lt;'50')" Name="Condition" PropertyName="Text" 
                            Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
