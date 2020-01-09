
Partial Class MyAccount_Default
        Inherits System.Web.UI.Page

        Const NotLogged = "Not-LoggedIn"

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
                If Session.Item("UserID") = NotLogged Then
                        messagebox("Please login first..")
                        Response.Redirect("../Login/Default.aspx?PU=../MyAccount/Default.aspx")
                End If

        End Sub

        Private Sub MessageBox(ByVal msg As String)
                Dim lbl As New Label()

                lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                           "window.alert('" + msg + "')</script>"

                Page.Controls.Add(lbl)

        End Sub

End Class
