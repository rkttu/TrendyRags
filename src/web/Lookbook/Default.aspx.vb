
Partial Class Lookbook_Default
    Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

                Dim strServerName As String = Request.ServerVariables("SERVER_NAME")
                Page.Title = strServerName

        End Sub

End Class
