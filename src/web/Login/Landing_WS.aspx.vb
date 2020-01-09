
Partial Class Login_Landing_WS
    Inherits System.Web.UI.Page

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Response.Redirect("~/ShowWindow/Default.aspx")

    End Sub

End Class
