
Partial Class Policies_PrivacyAndSecurity
    Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
                Session.Item("CurrentPage") = "~/Policies/PrivacyAndSecurity.aspx"
                Page.Title = "TrendyRags.com"

        End Sub
End Class
