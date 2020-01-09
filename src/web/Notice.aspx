<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Notice.aspx.vb" Inherits="Notice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Untitled Page</title>
</head>
<body>
        <form id="form1" runat="server">
        <div><img alt="" border="0" src="images/RSVP.jpg" usemap="#RSVP" /></div>
        <map name="RSVP" id="map_RSVP" />
        <area shape="rect" coords="400,540,570,560" href="mailto:info@TrendyRags.com&subject=RSVP - Runway Fashion Show (June 6, 2008)" alt="RSVP" />
        <center>
                <asp:Button ID="btnDonShowToday" runat="server" Text="Don't show today" />
&nbsp;
                <asp:Button ID="btnJustClose" runat="server" Text="Just Close" />
                        </center>
        </form>
</body>
<script id="BGRelated" language="javascript" type="text/javascript">

        function doCooking() {
                setCookie("TrendyRags_RSVP", "Don't Show Today", 1)
                window.close 
        }

        function setCookie(c_name,value,expiredays)    {
                var exdate=new Date();
                exdate.setDate(exdate.getDate()+expiredays);
                document.cookie=c_name+ "=" +escape(value)+ ((expiredays==null) ? "" : ";expires="+exdate );
                alert(exdate );
        }

        function getCookie(c_name)  {
                if (document.cookie.length>0)  {
                        c_start=document.cookie.indexOf(c_name + "=");
                        if (c_start!=-1)             { 
                                c_start=c_start + c_name.length+1; 
                                c_end=document.cookie.indexOf(";",c_start);
                                if (c_end==-1) c_end=document.cookie.length;
                return unescape(document.cookie.substring(c_start,c_end));
                } 
          }
          
        return "";
        
        }
        
</script>

</html>
