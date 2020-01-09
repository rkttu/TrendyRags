<%@ Page Language="VB" MasterPageFile="~/Admin/MPadmin.master" AutoEventWireup="false"
        CodeFile="Product.aspx.vb" Inherits="Admin_Product" Title="Product Manager - TrendyRags.com" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <script src="../js/dhtmlwindow.js" type="text/javascript"></script>

        <div id="AdminContents" style="border-top: #597886 1px solid; border-right: #597886 1px solid; width: 810px; text-align: left;">
                <div id="Title" style="padding-left: 10px; padding-top: 10px; padding-bottom: 5px;">
                        <asp:Literal ID="ltrTitle" runat="server"></asp:Literal>
                </div>
                <br />
                <table border="0" cellpadding="0" cellspacing="0" style="padding-left: 3px; font-size: 12px; padding-bottom: 3px; width: 810px; padding-top: 3px; height: 1193px;">
                        <tr>
                                <td style="width: 151px"></td>
                                <td></td>
                                <td style="width: 200px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Product No</td>
                                <td style="height: 20px"><asp:TextBox ID="txtProductNo" runat="server" Width="430px" TabIndex="10"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"><asp:Button ID="btnSearch" runat="server" Text="Search" Visible="False" Width="100px" TabIndex="20" /></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Brand Name</td>
                                <td style="height: 20px"><asp:TextBox ID="txtBrandName" runat="server" Width="430px" TabIndex="30"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"><asp:DropDownList ID="ddlBrandName" runat="server" Width="190px" TabIndex="40"></asp:DropDownList></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Category</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtCategory" runat="server" Width="430px" TabIndex="50"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">
                                        <asp:DropDownList ID="ddlCategory" runat="server" Width="190px" TabIndex="60">
                                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Gender</td>
                                <td style="height: 20px">
                                        <asp:RadioButtonList ID="rdoGender" runat="server" RepeatDirection="Horizontal" Width="300px"
                                                TabIndex="70">
                                                <asp:ListItem Selected="True">Men</asp:ListItem>
                                                <asp:ListItem>Women</asp:ListItem>
                                                <asp:ListItem>Unisex</asp:ListItem>
                                                <asp:ListItem>Kids</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Raw 
                                        Material Type</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtRawType" runat="server" Width="430px" TabIndex="50"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">
                                        <asp:DropDownList ID="ddlRawType" runat="server" Width="190px" TabIndex="60">
                                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">New Item</td>
                                <td style="height: 20px">&nbsp;
                                        <asp:CheckBox ID="chkNewItem" runat="server" TabIndex="80" /></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Exclusive or Sales Item</td>
                                <td style="height: 20px">
                                        <asp:RadioButtonList ID="rdoExclusiveSales" runat="server" RepeatDirection="Horizontal"
                                                Width="248px" TabIndex="90">
                                                <asp:ListItem Selected="True">Ordinary</asp:ListItem>
                                                <asp:ListItem>Exclusive</asp:ListItem>
                                                <asp:ListItem>Sales</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Web Display</td>
                                <td style="height: 20px">
                                        <asp:RadioButton ID="rdoDisplayYes" runat="server" Text="Display YES " Checked="True" GroupName="WebDisplay" TabIndex="100" />
                                        <asp:RadioButton ID="rdoDisplayNo" runat="server" Text="Display NO" GroupName="WebDisplay" TabIndex="110" /></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Display Order</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtDisplayOrder" runat="server" TabIndex="120">0</asp:TextBox><span style="color: #CC3300"> <b>** Bigger number has higher priority. **</b></span></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Product Name</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtProductName" runat="server" Width="430px" TabIndex="130"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Model Name</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtModelName" runat="server" Width="430px" TabIndex="140"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 21px; padding-right: 5px; text-align: right;" valign="top">Brief Description</td>
                                <td style="height: 21px">
                                        <asp:TextBox ID="txtBriefDescription" runat="server" Width="430px" MaxLength="400" Rows="2" TextMode="MultiLine" TabIndex="150"></asp:TextBox></td>
                                <td style="width: 200px; height: 21px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;" valign="top">Full Description</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtFullDescription" runat="server" Width="430px" Rows="7" TextMode="MultiLine" TabIndex="160"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Price Retail</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceRetail" runat="server" Width="250px" TabIndex="170"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Price Retail - Event1</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceRetailEvent1" runat="server" Width="250px" TabIndex="180"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 20px; text-align: right">Price Retail - Event2</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceRetailEvent2" runat="server" Width="250px" TabIndex="190"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Price Wholesale E</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceWholesale5" runat="server" TabIndex="200" Width="250px"></asp:TextBox>
                                        &nbsp;<span style="color: #CC3300; font-weight: bold">** Default wholesale price **</span></td>
                                <td style="width: 200px; height: 20px">&quot;E&quot; Wholesale class(Lowest)</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Price Wholesale D</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceWholesale4" runat="server" TabIndex="210" Width="250px"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">&quot;D&quot; Wholesale class</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Price Wholesale C</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceWholesale3" runat="server" TabIndex="220" Width="250px"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">&quot;C&quot; Wholesale class</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Price Wholesale B</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceWholesale2" runat="server" Width="250px" TabIndex="230"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">&quot;B&quot; Wholesale class</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Price Wholesale A</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtPriceWholesale1" runat="server" Width="250px" TabIndex="240"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">&quot;A&quot; Wholesale class(Best class)</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">LineSheet1</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtLineSheet1" runat="server" Width="430px"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">
                                        <asp:Button ID="btnUploadLineSheet1" runat="server" CssClass="highslide" OnClientClick="openLinesheet1(); return false;" Text="Uploading" ToolTip="It can't be uploaded in the &quot;FireFox&quot;." Width="100px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">LineSheet2</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtLineSheet2" runat="server" Width="430px"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">
                                        <asp:Button ID="btnUploadLineSheet2" runat="server" OnClientClick="openLinesheet2(); return false;" Text="Uploading" Width="100px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">LineSheet3</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtLineSheet3" runat="server" Width="430px"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">
                                        <asp:Button ID="btnUploadLineSheet3" runat="server" OnClientClick="openLinesheet3(); return false;" Text="Uploading" Width="100px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Sizes</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtSizes" runat="server" Width="430px" TabIndex="250"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">use &quot;/&quot; for delimeter</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Weight(LBS)</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtWeightLBS" runat="server" TabIndex="260" Width="430px"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px">** must be matched with SIZE **</td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Colors</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtColors" runat="server" Width="430px" TabIndex="270"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Stock</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtStock" runat="server" Width="230px" TabIndex="280"></asp:TextBox>&nbsp;&quot;0&quot; means don&#39;t count</td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;">Status</td>
                                <td style="height: 20px">
                                        <asp:RadioButton ID="rdoPending" runat="server" Text="Pending" Checked="True" GroupName="Status" TabIndex="290" />
                                        &nbsp; &nbsp;
                                        <asp:RadioButton ID="rdoLive" runat="server" Text="Live" GroupName="Status" TabIndex="300" />
                                        &nbsp;&nbsp; &nbsp;
                                        <asp:RadioButton ID="rdoRetire" runat="server" Text="Retire" GroupName="Status" TabIndex="310" /></td>
                                <td style="width: 200px; height: 20px"></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;" valign="top">Images - Representative</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtImagesRep" runat="server" Width="430px" TextMode="MultiLine" TabIndex="320"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px" valign="top">
                                        <asp:Button ID="btnImageRep" runat="server" CssClass="highslide" OnClientClick="openImageRep(); return false;" Text="Uploading" Width="100px" TabIndex="330" ToolTip="It can't be uploaded in the &quot;FireFox&quot;." /></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;" valign="top">Images - Thumbnails</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtImagesThumb" runat="server" Width="430px" Rows="5" TextMode="MultiLine" TabIndex="340"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px" valign="top">
                                        <asp:Button ID="btnImagesThumb" runat="server" CssClass="highslide" OnClientClick="openImageThumb(); return false;" Text="Uploading" Width="100px" TabIndex="350" ToolTip="It can't be uploaded in the &quot;FireFox&quot;." /></td>
                        </tr>
                        <tr>
                                <td style="width: 151px; height: 20px; padding-right: 5px; text-align: right;" valign="top">Images - Details</td>
                                <td style="height: 20px">
                                        <asp:TextBox ID="txtImagesDetail" runat="server" Width="430px" Rows="5" TextMode="MultiLine" TabIndex="360"></asp:TextBox></td>
                                <td style="width: 200px; height: 20px" valign="top">
                                        <asp:Button ID="btnImagesDetail" runat="server" CssClass="highslide" OnClientClick="openImageDetail(); return false;" Text="Uploading" Width="100px" TabIndex="370" ToolTip="It can't be uploaded in the &quot;FireFox&quot;." /></td>
                        </tr>
                        <tr>
                                <td style="padding-right: 5px; width: 151px; height: 35px; text-align: right"></td>
                                <td style="height: 35px" valign="bottom" align="center">
                                        <asp:Button ID="btnSave" runat="server" Text="OK / Save" Width="160px" TabIndex="380" />
                                        &nbsp; &nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="130px" TabIndex="390" /></td>
                                <td style="width: 200px; height: 35px"></td>
                        </tr>
                </table>
                <br />
                &nbsp; &nbsp;
        </div>
        <div id="divSearch" style="display: none; position: absolute; width: 400px; left: 650px; top: 1500px; text-align: left;">
                <div class="highslide-body" style="padding: 0 10px 10px 10px">
                        <span style="color: Navy;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam
                                dapibus leo quis nisl. In lectus. Vivamus consectetuer pede in nisl. Mauris cursus
                                pretium mauris. Suspendisse condimentum mi ac tellus. Pellentesque habitant morbi
                                tristique senectus et netus et malesuada fames ac turpis egestas. Donec sed enim.
                                Ut vel ipsum.
                                <br />
                                <br />
                        </span>
                        <asp:Button ID="btnPOPUPOK" runat="server" Text=" OK " OnClientClick="btnOK()" /></div>
        </div>
        <div id="divLinesheet1" style="display: none; position: absolute; width: 500px; top: 1400px; left: 100px; text-align: left;">
                <table style="padding: 15 10px 10px 10px; color: Navy; font-size: 11px; text-align: left;">
                        <tr>
                                <td style="width: 100px"></td>
                                <td style="width: 400px"></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Linesheet1</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblLinesheet1" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuLinesheet1" runat="server" Width="390px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; height: 33px;"></td>
                                <td style="width: 400px; height: 33px;"><asp:Button ID="btnFULineshee1OK" runat="server" Text="OK / Upload" /></td>
                        </tr>
                </table>
        </div>
        <div id="divLinesheet2" style="display: none; position: absolute; width: 500px; top: 1400px; left: 100px; text-align: left;">
                <table style="padding: 15 10px 10px 10px; color: Navy; font-size: 11px; text-align: left;">
                        <tr>
                                <td style="width: 100px"></td>
                                <td style="width: 400px"></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Linesheet2</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblLinesheet2" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuLinesheet2" runat="server" Width="390px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; height: 33px;"></td>
                                <td style="width: 400px; height: 33px;"><asp:Button ID="btnFULineshee2OK" runat="server" Text="OK / Upload" /></td>
                        </tr>
                </table>
        </div>
        <div id="divLinesheet3" style="display: none; position: absolute; width: 500px; top: 1400px; left: 100px; text-align: left;">
                <table style="padding: 15 10px 10px 10px; color: Navy; font-size: 11px; text-align: left;">
                        <tr>
                                <td style="width: 100px"></td>
                                <td style="width: 400px"></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Linesheet3</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblLinesheet3" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuLinesheet3" runat="server" Width="390px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; height: 33px;"></td>
                                <td style="width: 400px; height: 33px;"><asp:Button ID="btnFULineshee3OK" runat="server" Text="OK / Upload" /></td>
                        </tr>
                </table>
        </div>
        <div id="divImageRep" style="display: none; position: absolute; width: 500px; top: 1500px; left: 100px; text-align: left;">
                <table style="padding: 15 10px 10px 10px; color: Navy; font-size: 11px; text-align: left;">
                        <tr>
                                <td style="width: 100px"></td>
                                <td style="width: 400px"></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Image Rep.</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblRep" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuImageRep" runat="server" Width="390px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; height: 33px;"></td>
                                <td style="width: 400px; height: 33px;"><asp:Button ID="btnFUImageRepOK" runat="server" Text="OK / Upload" /></td>
                        </tr>
                </table>
        </div>
        <div id="divImageThumb" style="display: none; position: absolute; width: 500px; top: 1600px; left: 100px; text-align: left;">
                <table style="padding: 15 10px 10px 10px; color: Navy; font-size: 11px; text-align: left;">
                        <tr>
                                <td style="width: 100px"></td>
                                <td style="width: 400px"></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 1</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb1" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb1" runat="server" Width="390px" /></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 2</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb2" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb2" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 3</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb3" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb3" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 4</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb4" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb4" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 5</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb5" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb5" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 6</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb6" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb6" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 7</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb7" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb7" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 8</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb8" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb8" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 9</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb9" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb9" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Thumbnail 10</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblThumb10" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuThumb10" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; height: 33px;"></td>
                                <td style="width: 400px; height: 33px;"><asp:Button ID="btnFUImageThumbOK" runat="server" Text="OK / Upload" /></td>
                        </tr>
                </table>
        </div>
        <div id="divImageDetail" style="display: none; position: absolute; width: 500px; top: 1700px; left: 650px; text-align: left;">
                <table style="padding: 15 10px 10px 10px; color: Navy; font-size: 11px; text-align: left;">
                        <tr>
                                <td style="width: 100px"></td>
                                <td style="width: 400px"></td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 1</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail1" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail1" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 2</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail2" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail2" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 3</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail3" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail3" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 4</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail4" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail4" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 5</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail5" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail5" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 6</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail6" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail6" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 7</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail7" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail7" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 8</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail8" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail8" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 9</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail9" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail9" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; text-align: center;">Detail 10</td>
                                <td style="width: 400px">Current:
                                        <asp:Label ID="lblDetail10" runat="server" Text=""></asp:Label><br />
                                        <asp:FileUpload ID="fuDetail10" runat="server" Width="390px" />
                                </td>
                        </tr>
                        <tr>
                                <td style="width: 100px; height: 33px;"></td>
                                <td style="width: 400px; height: 33px;"><asp:Button ID="btnFUImageDetailOK" runat="server" Text="OK / Upload" /></td>
                        </tr>
                </table>
        </div>

        <script type="text/javascript">    
    
      function btnOK() {
        // document.getElementById('<%=txtBrandName.clientid %>').value = "High Slide..";
        hs.close('highslide-html');
        } 
       
       function openLinesheet1() {
            if (document.getElementById('<%=txtProductNo.clientid %>').value == '') {
                alert('Please enter the [Product No.] first! '); 
           } else {
                var nLeft = window.event.X || window.event.clientX;
                var nTop = window.event.Y || window.event.clientY;
                nLeft -= 580; 
                nTop -= 10; 
                var divwin=dhtmlwindow.open('divbix', 'div', 'divLinesheet1', 'Upload Linesheet for wholesaler',  'width=500px,height=80px,left=' + nLeft + 'px,top=' + nTop + 'px,resize=1,scrolling=1');
           } 
          return false; 
       } 
  
       function openLinesheet2() {
            if (document.getElementById('<%=txtProductNo.clientid %>').value == '') {
                alert('Please enter the [Product No.] first! '); 
           } else {
                var nLeft = window.event.X || window.event.clientX;
                var nTop = window.event.Y || window.event.clientY;
                nLeft -= 580; 
                nTop -= 10; 
                var divwin=dhtmlwindow.open('divbix', 'div', 'divLinesheet2', 'Upload Linesheet for wholesaler',  'width=500px,height=80px,left=' + nLeft + 'px,top=' + nTop + 'px,resize=1,scrolling=1');
           } 
          return false; 
       } 
  
       function openLinesheet3() {
            if (document.getElementById('<%=txtProductNo.clientid %>').value == '') {
                alert('Please enter the [Product No.] first! '); 
           } else {
                var nLeft = window.event.X || window.event.clientX;
                var nTop = window.event.Y || window.event.clientY;
                nLeft -= 580; 
                nTop -= 10; 
                var divwin=dhtmlwindow.open('divbix', 'div', 'divLinesheet3', 'Upload Linesheet for wholesaler',  'width=500px,height=80px,left=' + nLeft + 'px,top=' + nTop + 'px,resize=1,scrolling=1');
           } 
          return false; 
       } 
  
       function openImageRep() {
            if (document.getElementById('<%=txtProductNo.clientid %>').value == '') {
                alert('Please enter the [Product No.] first! '); 
           } else {
                var nLeft = window.event.X || window.event.clientX;
                var nTop = window.event.Y || window.event.clientY;
                nLeft -= 580; 
                nTop -= 10; 
                var divwin=dhtmlwindow.open('divbix', 'div', 'divImageRep', 'Upload Image of Representative',  'width=500px,height=80px,left=' + nLeft + 'px,top=' + nTop + 'px,resize=1,scrolling=1');
           } 
          return false; 
       } 
    
       function openImageThumb() {
            if (document.getElementById('<%=txtProductNo.clientid %>').value == '') {
                alert('Please enter the [Product No.] first! '); 
           } else {
                var nLeft = window.event.X || window.event.clientX;
                var nTop = window.event.Y || window.event.clientY;
                nLeft -= 580; 
                nTop -= 300; 
                var divwin=dhtmlwindow.open('divbix', 'div', 'divImageThumb', 'Upload Images of thumb nail', 'width=500px,height=480px,left=' + nLeft + 'px,top=' + nTop + 'px,resize=1,scrolling=1');
           } 
          return false; 
       } 
  
       function openImageDetail() {
            if (document.getElementById('<%=txtProductNo.clientid %>').value == '') {
                alert('Please enter the [Product No.] first! '); 
           } else {
                var nLeft = window.event.X || window.event.clientX;
                var nTop = window.event.Y || window.event.clientY;
                nLeft -= 580; 
                nTop -= 400; 
                var divwin=dhtmlwindow.open('divbix', 'div', 'divImageDetail', 'Upload Images of detail', 'width=500px,height=480px,left=' + nLeft + 'px,top=' + nTop + 'px,resize=1,scrolling=1');
           } 
          return false; 
       } 
  
        function doBrandName() {
                var ddlBrandName = document.getElementById('<%=ddlBrandName.clientid %>')
                var txtBrandName = document.getElementById('<%=txtBrandName.clientid %>')
        
                document.getElementById('<%=txtBrandName.clientid%>').value = ddlBrandName.options[ddlBrandName.selectedIndex].text
        }
        
        function doCategory() {
                var ddlCategory = document.getElementById('<%=ddlCategory.clientid %>')
                var txtCategory = document.getElementById('<%=txtCategory.clientid %>')
        
                document.getElementById('<%=txtCategory.clientid%>').value = ddlCategory.options[ddlCategory.selectedIndex].text
        }

        function doRawType() {
                var ddlRawType = document.getElementById('<%=ddlRawType.clientid %>')
                var txtRawType = document.getElementById('<%=txtRawType.clientid %>')
        
                document.getElementById('<%=txtRawType.clientid%>').value = ddlRawType.options[ddlRawType.selectedIndex].text
        }
        
        </script>

</asp:Content>
