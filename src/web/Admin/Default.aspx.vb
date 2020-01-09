
Partial Class Admin_Default
    Inherits System.Web.UI.Page

    Dim strPreviousURL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.Title = "Admin for TrendyRags.com"
        'Me.txtLoginID.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + btnLogin.UniqueID + "').click();return false;}} else {return true}; ")
        Me.txtPassword.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + btnLogin.UniqueID + "').click();return false;}} else {return true}; ")

        strPreviousURL = Request("PU")
        If strPreviousURL = "" Then
            strPreviousURL = "~/Admin/Default.aspx"
        End If

        If UCase(Session.Item("Class")) = "ADMIN" Then
            Me.btnLogin.Enabled = False
            Me.btnCancel.Enabled = False
        Else
            Me.btnLogin.Enabled = True
            Me.btnCancel.Enabled = True
        End If

        Me.txtLoginID.Focus()

    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim lbtnLogin, lbtnRegister As LinkButton
        lbtnLogin = Page.Master.FindControl("lbtnLogin")
        lbtnRegister = Page.Master.FindControl("lbtnRegister")

        If validUserID() Then
            lbtnLogin.Text = "Logout"
            lbtnRegister.Text = "Admin : " & Session.Item("UserName")
            lbtnRegister.PostBackUrl = ""
            Response.Redirect(strPreviousURL)
        Else
            'MessageBox("Please check your Login ID or Password..")
            Me.txtLoginID.Focus()
        End If

    End Sub

    Private Function validUserID() As Boolean
        Dim blnValid As Boolean
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commLogin As Data.SqlClient.SqlCommand
        Dim rdLogin As Data.SqlClient.SqlDataReader
        Dim sqlLogin As String = ""
        Dim strUserID, strPassword As String

        strUserID = Me.txtLoginID.Text.Trim
        strPassword = Me.txtPassword.Text.Trim

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlLogin = "SELECT Top 1 * FROM ClientMaster WHERE (Email=@Email) AND (Password=@Password) AND (Class='ADMIN') "

        commLogin = New Data.SqlClient.SqlCommand
        commLogin.CommandText = sqlLogin
        commLogin.Connection = connTR
        commLogin.Parameters.AddWithValue("@Email", strUserID)
        commLogin.Parameters.AddWithValue("@Password", strPassword)
        rdLogin = commLogin.ExecuteReader()
        rdLogin.Read()
        If rdLogin.HasRows Then
            Session.Item("UserID") = rdLogin("Email")
            Session.Item("UserName") = rdLogin("ClientNameF") & " " & rdLogin("ClientNameL")
            Session.Item("Class") = "ADMIN"
            blnValid = True
        Else
            blnValid = False
        End If

        rdLogin.Close()
        connTR.Close()

        Return blnValid

    End Function

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)

    End Sub

End Class
