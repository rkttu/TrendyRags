<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false" CodeFile="Client.aspx.vb" Inherits="Admin_Client" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <script src="../highslide/highslide.js" type="text/javascript"></script>
        <script src="../highslide/highslide-html.js" type="text/javascript"></script>
        <script src="../js/dhtmlwindow.js" type="text/javascript"></script>
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

        <div style="text-align:left; font-size:14px; font-family:Verdana; padding:10px 10px 10px 10px">Client Manager</div>
<div style="text-align:left; padding-left:10px; font-size:13px">
        <table cellpadding="5" style="width: 700px; border-width:0px; ">
                <tr>
                        <td width="150" align="right" style="padding-right:10px; ">Client No</td>
                        <td><asp:Label ID="lblClientNo" runat="server" Text="[000000]"></asp:Label></td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Company Name</td>
                        <td>
                                <asp:TextBox ID="txtCompanyName" runat="server" Width="300px" BorderWidth="0px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Client Name</td>
                        <td><asp:TextBox ID="txtClientNameF" Width="150px" runat="server" BorderWidth="0"></asp:TextBox>&nbsp;
                                <asp:TextBox ID="txtClientNameL" Width="150px" runat="server" BorderWidth="0"></asp:TextBox></td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">JOB Title</td>
                        <td>
                                <asp:TextBox ID="txtJobTitle" runat="server" Width="300px" BorderWidth="0px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Email</td>
                        <td><asp:TextBox ID="txtEmail" Width="300px" runat="server" BorderWidth="0"></asp:TextBox></td>
                </tr>

                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Password</td>
                        <td><asp:TextBox ID="txtPassword" runat="server" Width="300px" BorderWidth="0"></asp:TextBox></td>
                </tr>

                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Phone</td>
                        <td><asp:TextBox ID="txtPhone" Width="300px" runat="server" BorderWidth="0"></asp:TextBox></td>
                </tr>

                <tr>
                        <td width="150" align="right" style="padding-right:10px;">FAX.</td>
                        <td>
                                <asp:TextBox ID="txtFaxNo" runat="server" Width="300px" BorderWidth="0px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Street1</td>
                        <td><asp:TextBox ID="txtStreet1" Width="300px" runat="server" BorderWidth="0"></asp:TextBox></td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Street2</td>
                        <td><asp:TextBox ID="txtStreet2" Width="300px" runat="server" BorderWidth="0"></asp:TextBox></td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">City</td>
                        <td><asp:TextBox ID="txtCity" Width="300px" runat="server" BorderWidth="0"></asp:TextBox></td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">State/Zip</td>
                        <td>
                                <asp:DropDownList ID="ddlState" runat="server" Width="150px" 
                                        DataSourceID="DSState" DataTextField="StatesName" 
                                        DataValueField="Abbr"></asp:DropDownList>
                                &nbsp;
                                <asp:TextBox ID="txtZip" Width="150px" runat="server"  BorderWidth="0"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Country</td>
                        <td>
                                <asp:DropDownList ID="ddlCountry" runat="server" Width="200px" 
                                        DataSourceID="DSCountry" DataTextField="CountryName" DataValueField="CCode3">
                                </asp:DropDownList>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Accept Email</td>
                        <td>    
                                <asp:RadioButtonList ID="rdoAcceptEmail" runat="server"   RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">YES</asp:ListItem>
                                        <asp:ListItem>NO</asp:ListItem>
                                </asp:RadioButtonList>
                                                                                                                                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">UserClass</td>
                        <td>    
                                <asp:RadioButtonList ID="rdoUserClass" runat="server"  RepeatDirection="Horizontal">
                                        <asp:ListItem Value="USER" Selected="True">User</asp:ListItem>
                                        <asp:ListItem Value="PREWHOLESALE" >PreWholesale</asp:ListItem>
                                        <asp:ListItem Value="WHOLESALE" >Wholesale</asp:ListItem>
                                        <asp:ListItem Value="SALESREP" >SalesRep</asp:ListItem>
                                        <asp:ListItem Value="ADMIN" >Admin</asp:ListItem>
                                </asp:RadioButtonList>
                         </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Wholesale Level</td>
                        <td>    
                                <asp:RadioButtonList ID="rdoWholesaleLevel" runat="server" 
                                        RepeatDirection="Horizontal" CellPadding="0" CellSpacing="5">
                                        <asp:ListItem Value="E">E (Default)</asp:ListItem>
                                        <asp:ListItem Value="D">D</asp:ListItem>
                                        <asp:ListItem Value="C">C</asp:ListItem>
                                        <asp:ListItem Value="B">B</asp:ListItem>
                                        <asp:ListItem Value="A">A</asp:ListItem>
                                        <asp:ListItem  Value="NA" Selected="True">NA</asp:ListItem>
                                </asp:RadioButtonList>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">TAX ID.</td>
                        <td>    
                                <asp:TextBox ID="txtTaxID" runat="server" Width="200px" BorderWidth="0px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Seller&#39;s Permit No.</td>
                        <td>    
                                <asp:TextBox ID="txtSellerPermitNo" runat="server" Width="200px" 
                                        BorderWidth="0px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Seller&#39;s Permit File</td>
                        <td>    
                                <asp:TextBox ID="txtSellerPermitFile" runat="server" Width="300px" 
                                        BorderWidth="0px"></asp:TextBox>
                                <asp:Literal ID="ltrSellerPermitFile" runat="server">SellerPermitFile</asp:Literal>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Sales Rep.</td>
                        <td>    
                                <asp:TextBox ID="txtSalesRep" runat="server" BorderWidth="0px" Width="300px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td width="150" align="right" style="padding-right:10px;">Reg. Date</td>
                        <td><asp:TextBox ID="txtRegDate" Width="300px" runat="server" BorderWidth="0"></asp:TextBox>
                        </td>
                </tr>

                <tr>
                        <td width="150" align="right" style="padding-right:10px; height: 49px;"></td>
                        <td valign="bottom" style="height: 49px">
                                <br />
                                <asp:CheckBox ID="chkSendApprovalLetter" runat="server" 
                                        Text="Send the letter of Approval to wholesale buyer" />
                                <br />
                                <br />
                                <asp:Button ID="btnOK" runat="server" Text=" OK " Width="100px" />&nbsp;
                                <asp:Button ID="btnCancel"  runat="server" Text=" Cancel " Width="100px" 
                                        onclientclick="return confirm('  Are you sure you want to cancel?  ')" />
                        &nbsp;
                                <asp:Button ID="btnRemove" runat="server" 
                                        onclientclick="return confirm('  Are you sure you want to remove this client ??  ')" 
                                        Text="  Remove  " />
                        </td>
                </tr>

        </table>
                
</div>

        <br />
        <asp:SqlDataSource ID="DSState" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TrendyRags %>" 
                SelectCommand="SELECT [StatesName], [Abbr] FROM [CodeStates]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSCountry" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TrendyRags %>" 
                SelectCommand="SELECT [CountryName], [CCode3] FROM [CodeCountry]">
        </asp:SqlDataSource>
        
</asp:Content>

