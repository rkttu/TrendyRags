Partial Class Login_SignUp
    Inherits System.Web.UI.Page

    Dim HomePage As String
    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        HomePage = SSLRoot + "Login/Default.aspx"
        Page.Title = "TrendyRags.com"

    End Sub

End Class
