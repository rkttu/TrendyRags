<%@ Page Language="VB" MasterPageFile="~/Includes/MP1.master" AutoEventWireup="false"
        CodeFile="Default.aspx.vb" Inherits="Lookbook_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div style="padding-top:70px; padding-bottom:30px; font-size:12px; font-family:Verdana; text-align:center; width:800px;">

                <script src="../js/LookBook.js" type="text/javascript"></script>

                <script type="text/javascript" language="javascript">
    
                        var myLookbook=new Array()
                        myLookbook[0] = ["0806/0806.jpg", "Fashion Show Rock The Runway on Jun. 08", "0806/Default.aspx"]
                        myLookbook[1] = ["0804/0804.jpg", "Lookbook Vol. 0804", "0804/Default.aspx"]
                        myLookbook[2] = ["0803/0803.jpg", "Lookbook Vol. 0803", "0803/Default.aspx"]
                        myLookbook[3] = ["0802/0802.jpg", "Lookbook Vol. 0802", "0802/Default.aspx"]
                        myLookbook[4] = ["Show0801/Show0801.jpg", "Fashion Show on Jan. 08", "Show0801/Default.aspx"]
                        
                        var theLookbook = new photogallery(myLookbook, 1, 1, '750px', '380px')
                </script>

        </div>
</asp:Content>
