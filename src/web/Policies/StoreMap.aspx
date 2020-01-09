<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StoreMap.aspx.vb" Inherits="Policies_StoreMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="LoadGoogleMap();">
    <form id="form1" runat="server">
        <div style="font-family: Verdana;">
            <center>
                <table border="0" cellpadding="0" cellspacing="0" width="760">
                    <tr>
                        <td align="left" style="width: 400px;">
                            <b>
                                <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label></b>
                        </td>
                        <td align="right">
                            <asp:Button ID="btnPrint" runat="server" Text="   Print   " OnClientClick="javascript:print();" />
                            <asp:Button ID="btnClose" runat="server" Text="   Close   " OnClientClick="javascript:window.close();" />
                        </td>
                    </tr>
                </table>
            </center>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <div id="map" style="height: 590px; width: 760px; font-size: 11px; text-align:left;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <br />
                                    <div style="font-size: 12px; font-family: Verdana; font-weight: bold;">
                                        <asp:Label ID="lblShopName" runat="server" Text="Label"></asp:Label></div>
                                    <div style="font-size: 12px; font-family: Verdana;">
                                        <asp:Label ID="lblAddr1" runat="server" Text="Label"></asp:Label> 
                                            <asp:Label ID="lblSuiteNo" runat="server" Text="Label"></asp:Label>
                                                <asp:Label ID="lblAddr2" runat="server" Text="Label"></asp:Label><br />
                                        <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label></div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>

<script src="http://maps.google.com/maps?file=api&v=1&key=ABQIAAAATxCEDF4NwvyPiqu0u20SKBTgOGksGqpKFKV_uB5CI6mtFdmWZhTh7Q4DfkZnYMdkMVmGgKZ4iibGIg"
    type="text/javascript"></script>

<script language="javascript" type="text/javascript">
        //<![CDATA[   

        function LoadGoogleMap() {
                var geocoder  = new GClientGeocoder();
                var map         = new GMap2(document.getElementById('map'));
                var geoAddr1   = document.getElementById('<%=lblAddr1.clientid%>').innerHTML 
                var geoAddr2   = document.getElementById('<%=lblAddr2.clientid%>').innerHTML 
                var geoSuiteNo   = document.getElementById('<%=lblSuiteNo.clientid%>').innerHTML
                var geoTitle    = document.getElementById('<%=lblTitle.clientid%>').innerHTML
                var geoPhone  = document.getElementById('<%=lblPhone.clientid%>').innerHTML
                var MapText   = '<b>' + geoTitle + '</b><br>' + geoAddr1 + " " + geoSuiteNo + '<br>' + geoAddr2  + '<br>Phone : ' + geoPhone

                geoAddress        = geoAddr1 + " " + geoAddr2 ;
                // alert(geoAddress);
                geocoder.getLatLng(    
                        geoAddress, 
                        function(point) {      
                                if (!point) {        
                                        alert('Map of ' + geoTitle + ' not found');      
                                } else {        
                                        map.setCenter(point, 15);        
                                        var marker = new GMarker(point);        
                                        map.addOverlay(marker);        
                                        map.addControl(new GSmallMapControl());
                                        map.addControl(new GMapTypeControl());
                                        marker.openInfoWindowHtml(MapText);      
                                }    
                        }  
                );     

        }

        //]]>
</script>

</html>
