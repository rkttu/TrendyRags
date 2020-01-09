
Partial Class Admin_MPadmin
        Inherits System.Web.UI.MasterPage

        Protected Sub lbtnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnLogin.Click

                If Session.Item("UserID") <> "Not-LoggedIn" Then
                        Session.Item("UserID") = "Not-LoggedIn"
                        Session.Item("UserName") = ""
                        Session.Item("Class") = ""
                        Me.lbtnLogin.Text = "Login"
                        Me.lbtnRegister.Text = "Register"
                        Response.Redirect("~/Admin/Default.aspx")
                End If

        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

                If Session.Item("UserID") = "Not-LoggedIn" Then
                        Me.lbtnLogin.Text = "Login"
                        Me.lbtnRegister.Text = "Register"
                Else
                        Me.lbtnLogin.Text = "Logout"
                        Me.lbtnRegister.Text = "Admin : " & Session.Item("UserName")
                End If

        End Sub


End Class

