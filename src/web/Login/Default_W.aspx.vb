
Partial Class Login_Default_W
    Inherits System.Web.UI.Page
    Dim strPreviousURL As String
    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        ViewState("PreviousURL") = strPreviousURL

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.Title = "TrendyRags.com"
        Me.txtPassword.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + btnLogin.UniqueID + "').click();return false;}} else {return true}; ")

        If IsPostBack() Then
            strPreviousURL = ViewState("PreviousURL")
        Else
            strPreviousURL = Request("PU")
            If strPreviousURL = "" Then
                strPreviousURL = NSRoot + "ShowWindow/Default.aspx?GD=Women"
            End If
            Me.txtLoginID.Focus()
        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        strPreviousURL = Request("PU")

        If strPreviousURL = "" Then
            strPreviousURL = NSRoot + "Default.aspx"
        End If
        Response.Redirect(strPreviousURL)

    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim lbtnLogin, lbtnWAccess As LinkButton
        lbtnLogin = Page.Master.FindControl("lbtnLogin")
        lbtnWAccess = Page.Master.FindControl("lbtnWAccess")

        If validUserID() Then
            If strPreviousURL = NSRoot + "Default.aspx" Then
                strPreviousURL = NSRoot + "ShowWindow/Default.aspx?GD=Women"
            End If
            lbtnLogin.Text = "Logout"
            lbtnWAccess.Text = "Welcome " & Session.Item("UserName")
            lbtnWAccess.PostBackUrl = ""
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
        Dim strUserID, strPassword, strMessage As String

        strUserID = Me.txtLoginID.Text.Trim
        strPassword = Me.txtPassword.Text.Trim

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlLogin = "SELECT Top 1 * FROM ClientMaster WHERE (Email=@Email) and (Password=@Password) "


        commLogin = New Data.SqlClient.SqlCommand
        commLogin.CommandText = sqlLogin
        commLogin.Connection = connTR
        commLogin.Parameters.AddWithValue("@Email", strUserID)
        commLogin.Parameters.AddWithValue("@Password", strPassword)
        rdLogin = commLogin.ExecuteReader()
        rdLogin.Read()
        If rdLogin.HasRows Then
            Session.Item("UserID") = rdLogin("Email").ToString
            Session.Item("UserName") = rdLogin("ClientNameF").ToString & " " & rdLogin("ClientNameL").ToString
            Session.Item("Class") = rdLogin("Class").ToString.ToUpper
            If rdLogin("Class").ToString.ToUpper = "WHOLESALE" Then
                Session.Item("WholesaleLevel") = rdLogin("WholesaleLevel").ToString
            Else
                Session.Item("WholesaleLevel") = ""
            End If
            blnValid = True
        Else
            Session.Item("UserID") = ""
            Session.Item("UserName") = ""
            Session.Item("Class") = ""
            Session.Item("WholesaleLevel") = ""
            strMessage = "Invalid email or password, please check your email or password.\n"
            strMessage += "If you are not a member of TrendyRags.com, please sign up first !!"
            MessageBox(strMessage)
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

    Protected Sub lbtnFindPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnFindPassword.Click

        Response.Redirect(SSLRoot + "Login/FindPassword.aspx")

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click

        Response.Redirect(SSLRoot + "Login/SignUp_WS.aspx")

    End Sub

End Class
