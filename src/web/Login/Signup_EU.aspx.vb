Imports System.Net.Mail
Imports System.IO

Partial Class Login_Signup_EU
    Inherits System.Web.UI.Page
    Dim HomePage As String
    Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")
    Dim WelcomeLetter As String = ConfigurationManager.AppSettings("WelcomeLetter")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.ddlCountry.Attributes.Add("onChange", "postSelectCountry()")
        Me.ddlCountry.Attributes.Add("onBlur", "postSelectCountry()")

        HomePage = SSLRoot + "Login/Default.aspx"
        Page.Title = "TrendyRags.com"
        If IsPostBack() Then
        Else
            Call initscreen()
        End If

    End Sub

    Private Sub initscreen()

        Me.ddlState.SelectedValue = "CA"
        Me.ddlCountry.SelectedValue = "USA"

        Me.txtCity.Text = ""
        Me.txtEmail.Text = ""
        Me.txtEmailConfirm.Text = ""
        Me.txtNameFirst.Text = ""
        Me.txtNameLast.Text = ""
        Me.txtPassword.Text = ""
        Me.txtPasswordConfirm.Text = ""
        Me.txtPhone.Text = ""
        Me.txtStreet1.Text = ""
        Me.txtStreet2.Text = ""
        Me.txtZip.Text = ""

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click

        If Me.chkAgreewithPolicy.Checked Then
            If newUser() Then
                Call saveNewUser()
                Call sendMail()
                MessageBox("Thank you for joining us, confirmation email will be sent soon.\n")
                Response.Redirect(HomePage)
                Exit Sub
            Else
                MessageBox("Your are the member of trendyRags.com already !!\nThank you..")
                Exit Sub
            End If
        Else
            MessageBox("Please agree with our [Privacy Policy] first..")
            Me.chkAgreewithPolicy.Focus()
            Exit Sub
        End If

    End Sub

    Private Function newUser() As Boolean
        Dim blnIsNew As Boolean = True
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commUser As Data.SqlClient.SqlCommand
        Dim rdUser As Data.SqlClient.SqlDataReader
        Dim sqlUser As String = ""
        Dim strEmail As String = Me.txtEmail.Text.Trim

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlUser = "SELECT SerialNo FROM ClientMaster Where Email = @Email "
        commUser = New Data.SqlClient.SqlCommand
        commUser.CommandText = sqlUser
        commUser.Connection = connTR
        commUser.Parameters.AddWithValue("@Email", strEmail)
        rdUser = commUser.ExecuteReader()
        If rdUser.HasRows Then
            blnIsNew = False
        Else
            blnIsNew = True
        End If
        rdUser.Close()
        connTR.Close()

        Return blnIsNew
    End Function

    Private Sub saveNewUser()
        Dim strClientNameF As String = Me.txtNameFirst.Text.ToString
        Dim strClientNameL As String = Me.txtNameLast.Text.ToString
        Dim strEmail As String = Me.txtEmail.Text.ToString
        Dim strPhone As String = Me.txtPhone.Text.ToString
        Dim strStreet1 As String = Me.txtStreet1.Text.ToString
        Dim strStreet2 As String = Me.txtStreet2.Text.ToString
        Dim strCity As String = Me.txtCity.Text.ToUpper
        Dim strState As String = Me.ddlState.SelectedValue
        Dim strZip As String = Me.txtZip.Text.ToString
        Dim strCountry As String = Me.ddlCountry.SelectedValue
        Dim strPassword As String = Me.txtPassword.Text.ToString

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim sqlClient As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "INSERT Into ClientMaster (ClientNameF, ClientNameM, ClientNameL, Email, Phone, Street1, Street2, City, State, Zip, Country, MailOPT, Password, Class) Values  "
        sqlClient += "(@ClientNameF, '', @ClientNameL, @Email, @Phone, @Street1, @Street2, @City, @State, @Zip, @Country, 'YES', @Password, @Class)"

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@ClientNameF", strClientNameF)
        commClient.Parameters.AddWithValue("@ClientNameL", strClientNameL)
        commClient.Parameters.AddWithValue("@Email", strEmail)
        commClient.Parameters.AddWithValue("@Phone", strPhone)
        commClient.Parameters.AddWithValue("@Street1", strStreet1)
        commClient.Parameters.AddWithValue("@Street2", strStreet2)
        commClient.Parameters.AddWithValue("@City", strCity)
        commClient.Parameters.AddWithValue("@State", strState)
        commClient.Parameters.AddWithValue("@Zip", strZip)
        commClient.Parameters.AddWithValue("@Country", strCountry)
        commClient.Parameters.AddWithValue("@Password", strPassword)
        commClient.Parameters.AddWithValue("@Class", "USER")

        commClient.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Private Sub sendMail()
        Dim Msg As MailMessage = New MailMessage
        Dim MailObj As New SmtpClient(smtpServer)
        Dim strMyEmail As String = "support@trendyrags.com"
        Dim strMyName As String = "TrendyRags.com"

        Msg.From = New MailAddress(strMyEmail, strMyName)
        Msg.Bcc.Add(New MailAddress(strMyEmail))
        Msg.Bcc.Add(New MailAddress("Wally@TrendyRags.com"))
        Msg.Bcc.Add(New MailAddress("sicho77@live.com"))
        Msg.IsBodyHtml = "True"
        Msg.Body = makeMailBody()
        Msg.Subject = "[TrendyRags] Thank you for joining us."
        
        If Me.txtNameFirst.Text.Length > 0 Or Me.txtNameLast.Text.Length > 0 Then
            Msg.To.Add(New MailAddress(Me.txtEmail.Text, Me.txtNameFirst.Text.ToString + " " + Me.txtNameLast.Text.ToString))
        Else
            Msg.To.Add(New MailAddress(Me.txtEmail.Text))
        End If

        MailObj.Send(Msg)

    End Sub

    Private Function makeMailBody() As String
        Dim strBody As String = ""
        Dim objStreamReader As StreamReader
        objStreamReader = File.OpenText(WelcomeLetter)
        Dim contents As String = objStreamReader.ReadToEnd()

        objStreamReader.Close()

        If Me.txtNameFirst.Text.Length > 0 Or Me.txtNameLast.Text.Length > 0 Then
            strBody = Replace(contents, "%%ClientName%%", Me.txtNameFirst.Text.ToString + " " + Me.txtNameLast.Text.ToString)
        Else
            strBody = Replace(contents, "%%ClientName%%", "User")
        End If

        Return strBody
    End Function

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)
    End Sub


    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Call initscreen()

    End Sub

End Class
