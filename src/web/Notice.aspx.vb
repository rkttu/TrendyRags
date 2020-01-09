
Partial Class Notice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dtmCookieExpires As DateTime

        'Me.chkDonShowToday.Attributes.Add("onClick", "doCooking()")

        If Not Request.Cookies("TRRSVP") Is Nothing Then
            dtmCookieExpires = DateTime.Parse(Request.Cookies("TRRSVP").Expires)
            'Response.Write("Value is " + Server.HtmlDecode(Request.Cookies("TRRSVP").Value) + "<br>")
            'Response.Write("dtmCookieExpires is " + dtmCookieExpires.ToString + "<br>")
            'Response.Write("Expire is " + DateTime.Parse(Request.Cookies("TRRSVP").Expires).ToString + " ==> " + Now.ToString + "<br>")

            'If dtmCookieExpires > Now Then
            '    Response.Write("dtmCookieExpires > Now")
            'Else
            '    Response.Write("dtmCookieExpires <= Now")
            'End If



            Response.Write("<script language='javascript'> { window.close();}</script>")
        End If

    End Sub

    Protected Sub btnDonShowToday_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDonShowToday.Click

        'Dim aCookie As New HttpCookie("TRRSVP")

        Response.Cookies("TRRSVP").Value = "DonotShowToday (" + DateTime.Now.AddDays(1).ToString + ")"
        Response.Cookies("TRRSVP").Expires = DateTime.Now.AddDays(1)

        'Response.Write("Set expired: " + DateTime.Now.AddDays(1).ToString)
        Response.Write("<script language='javascript'> { window.close();}</script>")

    End Sub

    Protected Sub btnJustClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJustClose.Click

        Response.Write("<script language='javascript'> { window.close();}</script>")

    End Sub
End Class
